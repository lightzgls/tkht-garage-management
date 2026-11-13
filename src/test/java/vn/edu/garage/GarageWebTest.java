package vn.edu.garage;

import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;
import org.h2.tools.RunScript;
import org.junit.jupiter.api.*;
import vn.edu.garage.dao.*;
import vn.edu.garage.model.*;
import java.io.InputStreamReader;
import java.net.*;
import java.net.http.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.sql.*;
import java.time.*;
import java.util.*;
import static org.junit.jupiter.api.Assertions.*;

/** Kiểm tra truy vấn thật và biên dịch/chạy tất cả JSP trên Tomcat 9. */
class GarageWebTest {
    static Tomcat tomcat;
    static String baseUrl;
    static final String DB_URL = "jdbc:h2:mem:design;MODE=MySQL;DB_CLOSE_DELAY=-1";

    @BeforeAll static void start() throws Exception {
        System.setProperty("DB_URL", DB_URL);
        System.setProperty("DB_USER", "sa");
        System.setProperty("DB_PASSWORD", "");
        try (var connection = DriverManager.getConnection(DB_URL, "sa", "")) {
            for (String file : List.of("/db/schema.sql", "/db/seed.sql")) {
                try (var reader = new InputStreamReader(GarageWebTest.class.getResourceAsStream(file), StandardCharsets.UTF_8)) {
                    RunScript.execute(connection, reader);
                }
            }
            // Hóa đơn chưa trả, ngoài kỳ, và trả lúc 00:00 ngày tiếp theo: đều phải bị loại.
            try (var statement = connection.createStatement()) {
                statement.execute("INSERT INTO tblOrder2 (id, receivedAt, customerId) VALUES (90, '2026-08-01 00:00:00', 1), (91, '2026-07-01 00:00:00', 1), (92, '2026-09-01 00:00:00', 1)");
                statement.execute("INSERT INTO tblInvoice2 (id, code, createdAt, subTotal, taxTotal, total, paidAt, orderId, salesStaffId) VALUES (90, 'UNPAID', '2026-08-01 00:00:00', 100, 0, 100, NULL, 90, 2), (91, 'JULY', '2026-07-01 00:00:00', 100, 0, 100, '2026-07-31 23:59:59', 91, 2), (92, 'SEPT', '2026-08-31 12:00:00', 100, 0, 100, '2026-09-01 00:00:00', 92, 2)");
            }
        }
        Path module = Path.of(".").toAbsolutePath().normalize();
        Path serverBase = module.resolve(System.getProperty("preview.port") == null ? "target/test-tomcat" : "target/preview-tomcat");
        Files.createDirectories(serverBase);
        tomcat = new Tomcat();
        tomcat.setBaseDir(serverBase.toString());
        tomcat.setPort(Integer.getInteger("preview.port", 0));
        tomcat.getConnector().setProperty("address", "127.0.0.1");
        tomcat.getConnector().setURIEncoding("UTF-8");
        var context = tomcat.addWebapp("/garage", module.resolve("src/main/webapp").toString());
        context.setParentClassLoader(GarageWebTest.class.getClassLoader());
        var manager = new org.apache.catalina.session.StandardManager();
        manager.setPathname("");
        context.setManager(manager);
        var resources = new StandardRoot(context);
        for (String group : List.of("main-ui", "management-staff")) {
            resources.addPreResources(new DirResourceSet(resources, "/", module.resolve("src/main/view").resolve(group).toString(), "/"));
        }
        resources.addPreResources(new DirResourceSet(resources, "/WEB-INF/classes", module.resolve("target/classes").toString(), "/"));
        context.setResources(resources);
        tomcat.start();
        assertTrue(context.getState().isAvailable());
        baseUrl = "http://127.0.0.1:" + tomcat.getConnector().getLocalPort() + "/garage";
    }

    @AfterAll static void stop() throws Exception {
        if (tomcat != null) { tomcat.stop(); tomcat.destroy(); }
        System.clearProperty("DB_URL");
        System.clearProperty("DB_USER");
        System.clearProperty("DB_PASSWORD");
    }

    static HttpClient browser() {
        return HttpClient.newBuilder().cookieHandler(new CookieManager(null, CookiePolicy.ACCEPT_ALL))
                .connectTimeout(Duration.ofSeconds(10)).build();
    }
    static HttpResponse<String> get(HttpClient client, String path) throws Exception {
        return client.send(HttpRequest.newBuilder(URI.create(baseUrl + path)).timeout(Duration.ofSeconds(30)).GET().build(),
                HttpResponse.BodyHandlers.ofString(StandardCharsets.UTF_8));
    }
    static HttpResponse<String> post(HttpClient client, String path, String form) throws Exception {
        return client.send(HttpRequest.newBuilder(URI.create(baseUrl + path)).timeout(Duration.ofSeconds(30))
                .header("Content-Type", "application/x-www-form-urlencoded")
                .POST(HttpRequest.BodyPublishers.ofString(form)).build(), HttpResponse.BodyHandlers.ofString(StandardCharsets.UTF_8));
    }
    static void login(HttpClient client) throws Exception {
        var response = post(client, "/LoginUI2.jsp", "username=xxx&password=123456");
        assertEquals(302, response.statusCode(), response.body());
        assertTrue(response.headers().firstValue("location").orElse("").endsWith("ManagementStaffUI2.jsp"));
    }
    static String period() { return "?startDate=2026-08-01&endDate=2026-08-31"; }

    @Test void searchUsesNamesAndTreatsSqlWildcardsLiterally() throws Exception {
        try (ServiceDAO2 dao = new ServiceDAO2(); SparePartDAO2 parts = new SparePartDAO2()) {
            assertEquals(3, dao.getServicesByName("bRaKe", 1).size());
            assertEquals("SV02", dao.getServicesByName("Pad Replacement", 1).get(0).getCode());
            assertTrue(dao.getServicesByName("SV02", 1).isEmpty());
            assertTrue(dao.getServicesByName("%", 1).isEmpty());
            assertTrue(dao.getServicesByName("_", 1).isEmpty());
            assertTrue(dao.getServicesByName("' OR 1=1 --", 1).isEmpty());
            assertEquals("PT01", parts.getSparePartsByName("Front", 1).get(0).getCode());
            assertThrows(IllegalArgumentException.class, () -> dao.getServicesByName("", 0));
        }
    }

    @Test void paginationHasNoMissingOrRepeatedResults() throws Exception {
        try (var connection = DriverManager.getConnection(DB_URL, "sa", "");
             var statement = connection.prepareStatement("INSERT INTO tblService2 (code, name, basePrice, estimatedDuration, tax, status) VALUES (?, ?, 100, 30, 0.1, 'Available')")) {
            for (int index = 0; index < 22; index++) {
                statement.setString(1, String.format("PG%02d", index));
                statement.setString(2, "Pagination example " + index);
                statement.executeUpdate();
            }
        }
        try (ServiceDAO2 dao = new ServiceDAO2()) {
            var first = dao.getServicesByName("Pagination", 1);
            var second = dao.getServicesByName("Pagination", 2);
            assertEquals(20, first.size());
            assertEquals(2, second.size());
            Set<String> codes = new HashSet<>();
            first.forEach(item -> codes.add(item.getCode()));
            second.forEach(item -> codes.add(item.getCode()));
            assertEquals(22, codes.size());
            assertTrue(dao.getServicesByName("Pagination", 3).isEmpty());
            HttpClient client = browser();
            var page1 = get(client, "/SearchServicesPartsUI2.jsp?keyword=Pagination");
            assertEquals(200, page1.statusCode(), page1.body());
            assertTrue(page1.body().contains(">Next</a>"));
            var page2 = get(client, "/SearchServicesPartsUI2.jsp?keyword=Pagination&page=2");
            assertEquals(200, page2.statusCode(), page2.body());
            assertTrue(page2.body().contains(">Previous</a>"));
            assertFalse(page2.body().contains(">Next</a>"));
        } finally {
            try (var connection = DriverManager.getConnection(DB_URL, "sa", ""); var statement = connection.createStatement()) {
                statement.executeUpdate("DELETE FROM tblService2 WHERE code LIKE 'PG%'");
            }
        }
    }

    @Test void databaseColumnsAndForeignKeysMatchPlantUml() throws Exception {
        String source = Files.readString(Path.of("design/PlantUML-Design.txt"));
        source = source.substring(source.indexOf("02 - Database Diagram"), source.indexOf("03 - Detail Class Diagram"));
        var tables = java.util.regex.Pattern.compile("entity \\\"(\\w+)\\\" as \\w+ #[A-F0-9]+ \\{([^}]+)\\}").matcher(source);
        try (var connection = DriverManager.getConnection(DB_URL, "sa", "")) {
            int tableCount = 0, columnCount = 0, foreignKeyCount = 0;
            while (tables.find()) {
                Set<String> expected = new LinkedHashSet<>();
                var fields = java.util.regex.Pattern.compile("(?m)^\\s*\\*?\\s*(\\w+)\\s*:").matcher(tables.group(2));
                while (fields.find()) { expected.add(fields.group(1).toLowerCase(Locale.ROOT)); }
                Set<String> actual = new LinkedHashSet<>();
                try (var columns = connection.getMetaData().getColumns(null, "PUBLIC", tables.group(1).toUpperCase(Locale.ROOT), null)) {
                    while (columns.next()) { actual.add(columns.getString("COLUMN_NAME").toLowerCase(Locale.ROOT)); }
                }
                assertEquals(expected, actual, tables.group(1));
                try (var keys = connection.getMetaData().getImportedKeys(null, "PUBLIC", tables.group(1).toUpperCase(Locale.ROOT))) {
                    while (keys.next()) { foreignKeyCount++; }
                }
                tableCount++;
                columnCount += actual.size();
            }
            assertEquals(13, tableCount);
            assertEquals(85, columnCount);
            assertEquals(13, foreignKeyCount);
        }
    }

    @Test void statisticsMatchesMockupAndIncludesEndOfLastDay() throws Exception {
        try (CustomerStatisticsDAO2 dao = new CustomerStatisticsDAO2()) {
            var customers = dao.getCustomerStatistics(LocalDate.of(2026, 8, 1), LocalDate.of(2026, 8, 31));
            assertEquals(List.of("KH001", "KH002", "KH003"), customers.stream().map(Customer2::getCode).toList());
            assertEquals(List.of(3, 2, 1), customers.stream().map(CustomerStatistics2::getTotalInvoice).toList());
            assertEquals(List.of(6500000.0, 4200000.0, 1800000.0), customers.stream().map(CustomerStatistics2::getTotalRevenue).toList());
            assertEquals(12500000.0, customers.stream().mapToDouble(CustomerStatistics2::getTotalRevenue).sum());
            var lastDay = dao.getCustomerStatistics(LocalDate.of(2026, 8, 31), LocalDate.of(2026, 8, 31));
            assertEquals(1, lastDay.size());
            assertEquals("KH003", lastDay.get(0).getCode());
            assertThrows(IllegalArgumentException.class, () -> dao.getCustomerStatistics(LocalDate.of(2026, 8, 2), LocalDate.of(2026, 8, 1)));
        }
    }

    @Test void invoiceQueryKeepsCustomerPeriodAndMapsRelations() throws Exception {
        try (CustomerStatisticsDAO2 customers = new CustomerStatisticsDAO2(); InvoiceDAO2 invoices = new InvoiceDAO2()) {
            var customer = customers.getCustomerStatistics(LocalDate.of(2026, 8, 1), LocalDate.of(2026, 8, 31)).get(0);
            var result = invoices.getInvoicesByCustomer(customer);
            assertEquals(List.of("HD001", "HD002", "HD003"), result.stream().map(Invoice2::getCode).toList());
            assertEquals(6500000.0, result.stream().mapToDouble(Invoice2::getTotal).sum());
            assertSame(customer, result.get(0).getOrder().getCustomer());
            assertEquals("Staff ABC", result.get(0).getSalesStaff().getName());
            assertEquals(LocalDateTime.of(2026, 8, 5, 10, 30), result.get(0).getPaidAt());
        }
    }

    @Test void invoiceLinesKeepSubtypesQuantityAndHistoricalPrices() throws Exception {
        try (OrderDetailDAO2 dao = new OrderDetailDAO2()) {
            var lines = dao.getOrderDetails(1);
            assertEquals(3, lines.size());
            assertInstanceOf(ServiceDetail2.class, lines.get(0));
            assertInstanceOf(PartDetail2.class, lines.get(1));
            assertEquals(2, ((PartDetail2) lines.get(1)).getQuantity());
            assertEquals("Front Brake Pads", ((PartDetail2) lines.get(1)).getSparePart().getName());
            double subtotal = 0, tax = 0;
            for (OrderDetail2 line : lines) {
                int quantity = line instanceof PartDetail2 part ? part.getQuantity() : 1;
                subtotal += line.getUnitPrice() * quantity;
                tax += line.getUnitPrice() * quantity * line.getAppliedTax();
            }
            assertEquals(2000000, subtotal);
            assertEquals(200000, tax);
            assertEquals(2200000, subtotal + tax);
            // HD002 có giá tại thời điểm lập hóa đơn khác giá hiện tại của Service2.
            var historical = (ServiceDetail2) dao.getOrderDetails(2).get(0);
            assertEquals(1500000, historical.getUnitPrice());
            assertEquals(500000, historical.getService().getBasePrice());
        }
    }

    @Test void allPublicPagesAndBothDetailPagesCompileAndRun() throws Exception {
        HttpClient client = browser();
        for (String page : List.of("MainUI2.jsp", "LoginUI2.jsp", "SearchServicesPartsUI2.jsp")) {
            var response = get(client, "/" + page);
            assertEquals(200, response.statusCode(), response.body());
        }
        assertEquals(302, get(client, "/MainUI2.jsp?action=searchFuncClicked").statusCode());
        assertEquals(302, get(client, "/MainUI2.jsp?action=openLogin").statusCode());
        var search = get(client, "/SearchServicesPartsUI2.jsp?searchType=Service&keyword=Brake");
        assertEquals(200, search.statusCode(), search.body());
        assertTrue(search.body().contains("Price (VND)"));
        assertTrue(search.body().contains(">500.000</td>"));
        assertEquals(302, get(client, "/SearchServicesPartsUI2.jsp?action=ViewDetails&code=SV02").statusCode());
        var service = get(client, "/ServiceDetailsUI2.jsp");
        assertEquals(200, service.statusCode(), service.body());
        assertTrue(service.body().contains("60 minutes"));
        assertTrue(service.body().contains(">500.000</td>"));
        assertTrue(service.body().contains("Replace worn brake pads and inspect braking components"));
        get(client, "/SearchServicesPartsUI2.jsp?searchType=Part&keyword=Front");
        assertEquals(302, get(client, "/SearchServicesPartsUI2.jsp?action=ViewDetails&code=PT01").statusCode());
        var part = get(client, "/PartDetailsUI2.jsp");
        assertEquals(200, part.statusCode(), part.body());
        assertTrue(part.body().contains("Front Brake Pads"));
        assertTrue(part.body().contains(">600.000</td>"));
        assertTrue(part.body().contains("<td>Image</td>"));
        assertTrue(part.body().contains("Chưa có ảnh minh họa"));
        try {
            try (var connection = DriverManager.getConnection(DB_URL, "sa", ""); var statement = connection.createStatement()) {
                statement.executeUpdate("UPDATE tblSparePart2 SET img = 'parts/demo-pad.png' WHERE code = 'PT01'");
            }
            get(client, "/SearchServicesPartsUI2.jsp?searchType=Part&keyword=Front");
            get(client, "/SearchServicesPartsUI2.jsp?action=ViewDetails&code=PT01");
            var withImage = get(client, "/PartDetailsUI2.jsp");
            assertEquals(200, withImage.statusCode(), withImage.body());
            assertTrue(withImage.body().contains("src=\"parts/demo-pad.png\""));
        } finally {
            try (var connection = DriverManager.getConnection(DB_URL, "sa", ""); var statement = connection.createStatement()) {
                statement.executeUpdate("UPDATE tblSparePart2 SET img = NULL WHERE code = 'PT01'");
            }
        }
    }

    @Test void fullManagementFlowMatchesMockupValues() throws Exception {
        HttpClient client = browser();
        login(client);
        for (String page : List.of("ManagementStaffUI2.jsp", "StatisticsUI2.jsp", "CustomerStatisticsUI2.jsp")) {
            var response = get(client, "/" + page);
            assertEquals(200, response.statusCode(), response.body());
        }
        assertEquals(302, get(client, "/ManagementStaffUI2.jsp?action=ViewStatClicked").statusCode());
        assertEquals(302, get(client, "/StatisticsUI2.jsp?action=CustomerStatClicked").statusCode());
        var statistics = get(client, "/CustomerStatisticsUI2.jsp" + period());
        assertEquals(200, statistics.statusCode(), statistics.body());
        assertTrue(statistics.body().contains("Khách mẫu KH001"));
        assertTrue(statistics.body().contains("12.500.000"));
        assertTrue(statistics.body().contains("type=\"date\" id=\"startDate\""));
        assertTrue(statistics.body().contains("type=\"date\" id=\"endDate\""));
        assertTrue(statistics.body().contains("value=\"2026-08-01\""));
        assertTrue(statistics.body().contains("value=\"2026-08-31\""));
        assertEquals(302, get(client, "/CustomerStatisticsUI2.jsp?action=customerSelected&customerId=1").statusCode());
        var invoices = get(client, "/CustomerInvoicesUI2.jsp?customerId=1");
        assertEquals(200, invoices.statusCode(), invoices.body());
        assertTrue(invoices.body().contains("6.500.000"));
        assertTrue(invoices.body().contains("HD003"));
        assertEquals(302, get(client, "/CustomerInvoicesUI2.jsp?action=viewInvoiceDetailClicked&invoiceId=1").statusCode());
        var details = get(client, "/InvoiceDetailsUI2.jsp?invoiceId=1");
        assertEquals(200, details.statusCode(), details.body());
        for (String value : List.of("Brake Pad Replacement", "Front Brake Pads", "Brake System Inspection", "2.000.000", "200.000", "2.200.000", "TT001", "Staff ABC", "05/08/2026 10:30")) {
            assertTrue(details.body().contains(value), value);
        }
        assertEquals(200, get(client, "/CustomerInvoicesUI2.jsp").statusCode());
        assertEquals(200, get(client, "/CustomerStatisticsUI2.jsp" + period()).statusCode());
        assertEquals(302, post(client, "/ManagementStaffUI2.jsp", "action=logout").statusCode());
        assertEquals(302, get(client, "/InvoiceDetailsUI2.jsp?invoiceId=1").statusCode());
    }

    @Test void authenticationAndSelectionsCannotBeBypassedWithUrls() throws Exception {
        HttpClient client = browser();
        for (String page : List.of("ManagementStaffUI2.jsp", "StatisticsUI2.jsp", "CustomerStatisticsUI2.jsp", "CustomerInvoicesUI2.jsp", "InvoiceDetailsUI2.jsp")) {
            assertEquals(302, get(client, "/" + page).statusCode());
        }
        assertEquals(401, post(client, "/LoginUI2.jsp", "username=sales&password=123456").statusCode());
        assertEquals(401, post(client, "/LoginUI2.jsp", "username=xxx&password=wrong").statusCode());
        login(client);
        assertEquals(404, get(client, "/CustomerInvoicesUI2.jsp?customerId=1").statusCode());
        assertEquals(404, get(client, "/InvoiceDetailsUI2.jsp?invoiceId=1").statusCode());
        get(client, "/CustomerStatisticsUI2.jsp" + period());
        get(client, "/CustomerInvoicesUI2.jsp?customerId=2");
        assertEquals(404, get(client, "/InvoiceDetailsUI2.jsp?invoiceId=1").statusCode());
        assertEquals(404, get(client, "/SearchServicesPartsUI2.jsp?action=ViewDetails&code=SV02").statusCode());
    }

    @Test void invalidInputIsEscapedAndDatesAreStrict() throws Exception {
        HttpClient client = browser();
        var escaped = get(client, "/SearchServicesPartsUI2.jsp?keyword=%3Cscript%3Ealert(1)%3C%2Fscript%3E");
        assertEquals(200, escaped.statusCode(), escaped.body());
        assertTrue(escaped.body().contains("&lt;script&gt;"));
        assertFalse(escaped.body().contains("<script>alert(1)</script>"));
        assertEquals(400, get(client, "/SearchServicesPartsUI2.jsp?keyword=Brake&page=-1").statusCode());
        assertEquals(400, get(client, "/SearchServicesPartsUI2.jsp?keyword=Brake&searchType=Unknown").statusCode());
        login(client);
        for (String query : List.of("?startDate=2026-02-31&endDate=2026-08-31", "?startDate=2026-08-02&endDate=2026-08-01", "?startDate=&endDate=")) {
            assertEquals(400, get(client, "/CustomerStatisticsUI2.jsp" + query).statusCode());
        }
    }

    @Test void databaseFailureProducesReadable503() throws Exception {
        String previous = System.getProperty("DB_URL");
        System.setProperty("DB_URL", "jdbc:invalid:unavailable");
        try {
            var response = get(browser(), "/SearchServicesPartsUI2.jsp?keyword=Brake");
            assertEquals(503, response.statusCode(), response.body());
            assertTrue(response.body().contains("Không thể tải dữ liệu"), response.body());
            assertFalse(response.body().contains("SQLException"));
        } finally { System.setProperty("DB_URL", previous); }
    }
}
