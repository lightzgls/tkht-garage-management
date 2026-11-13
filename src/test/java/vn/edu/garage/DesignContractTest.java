package vn.edu.garage;

import org.junit.jupiter.api.Test;
import java.lang.reflect.*;
import java.nio.file.*;
import java.util.*;
import java.util.regex.*;
import static org.junit.jupiter.api.Assertions.*;

/** Đối chiếu trực tiếp với bản chụp văn bản PlantUML, không suy hợp đồng từ code. */
class DesignContractTest {
    @Test void entityFieldsAndInheritanceMatchBothDesignDiagrams() throws Exception {
        String source = Files.readString(Path.of("design/PlantUML-Design.txt"));
        String entities = source.substring(0, source.indexOf("02 - Database Diagram"));
        String details = source.substring(source.indexOf("03 - Detail Class Diagram"), source.indexOf("05 - Activity Diagram"));
        Map<String, Map<String, String>> expected = new LinkedHashMap<>();
        Pattern classes = Pattern.compile("class (\\w+)(?: \\{([^}]*?)\\})?(?=\\n)");
        Matcher blocks = classes.matcher(entities);
        while (blocks.find()) { expected.put(blocks.group(1), fields(blocks.group(2))); }
        blocks = classes.matcher(details);
        while (blocks.find()) {
            if (expected.containsKey(blocks.group(1))) {
                expected.put(blocks.group(1), fields(blocks.group(2)));
            }
        }
        // Hai chỗ thiếu/lệch đã nêu trong DESIGN-MATCH.md, lấy tên chính thức từ Design.
        expected.get("SparePart2").put("id", "int");
        expected.get("Appointment2").remove("time");
        expected.get("Appointment2").put("appointmentTime", "LocalDateTime");
        assertEquals(21, expected.size());
        for (var entry : expected.entrySet()) {
            Class<?> entity = Class.forName("vn.edu.garage.model." + entry.getKey());
            Map<String, String> actual = new LinkedHashMap<>();
            for (Field field : entity.getDeclaredFields()) {
                assertTrue(Modifier.isPrivate(field.getModifiers()), field.toString());
                String type = field.getGenericType().getTypeName().replace("java.lang.", "")
                        .replace("java.time.", "").replace("java.util.", "").replace("vn.edu.garage.model.", "");
                actual.put(field.getName(), type);
            }
            assertEquals(entry.getValue(), actual, entity.getSimpleName());
            assertNotNull(entity.getConstructor());
        }
        Matcher inheritance = Pattern.compile("(\\w+) <\\|-- (\\w+)").matcher(entities);
        while (inheritance.find()) {
            assertEquals(inheritance.group(1), Class.forName("vn.edu.garage.model." + inheritance.group(2)).getSuperclass().getSimpleName());
        }
    }

    private static Map<String, String> fields(String body) {
        Map<String, String> fields = new LinkedHashMap<>();
        if (body == null) { return fields; }
        Matcher matches = Pattern.compile("-\\s*(\\w+)\\s*:\\s*([^\\n]+)").matcher(body);
        while (matches.find()) { fields.put(matches.group(1), matches.group(2).strip()); }
        return fields;
    }

    @Test void daoQueriesKeepExactDesignedSignaturesAndBaseConnection() throws Exception {
        Class<?> base = Class.forName("vn.edu.garage.dao.DAO2");
        assertEquals(1, base.getDeclaredFields().length);
        assertEquals(java.sql.Connection.class, base.getDeclaredField("con").getType());
        assertTrue(Modifier.isProtected(base.getDeclaredField("con").getModifiers()));
        for (String name : List.of("ServiceDAO2", "SparePartDAO2", "CustomerStatisticsDAO2", "InvoiceDAO2", "OrderDetailDAO2")) {
            Class<?> dao = Class.forName("vn.edu.garage.dao." + name);
            assertEquals(base, dao.getSuperclass());
            assertEquals(0, dao.getDeclaredFields().length);
            assertNotNull(dao.getConstructor());
            assertEquals(1, dao.getDeclaredMethods().length);
        }
        assertEquals(List.class, Class.forName("vn.edu.garage.dao.ServiceDAO2").getMethod("getServicesByName", String.class, int.class).getReturnType());
        assertEquals(List.class, Class.forName("vn.edu.garage.dao.SparePartDAO2").getMethod("getSparePartsByName", String.class, int.class).getReturnType());
        assertEquals(List.class, Class.forName("vn.edu.garage.dao.CustomerStatisticsDAO2").getMethod("getCustomerStatistics", java.time.LocalDate.class, java.time.LocalDate.class).getReturnType());
        assertEquals(List.class, Class.forName("vn.edu.garage.dao.InvoiceDAO2").getMethod("getInvoicesByCustomer", vn.edu.garage.model.CustomerStatistics2.class).getReturnType());
        assertEquals(List.class, Class.forName("vn.edu.garage.dao.OrderDetailDAO2").getMethod("getOrderDetails", int.class).getReturnType());
    }

    @Test void jspPagesHaveMatchingRequestClassesAndNamedControls() throws Exception {
        Map<String, List<String>> screens = Map.of(
                "main-ui/MainUI2", List.of("searchServicesParts"),
                "main-ui/SearchServicesPartsUI2", List.of("searchType", "keyword", "btnSearch", "tblResults", "back"),
                "main-ui/ServiceDetailsUI2", List.of("tblInformation", "back"),
                "main-ui/PartDetailsUI2", List.of("tblInformation", "back"),
                "management-staff/LoginUI2", List.of(),
                "management-staff/ManagementStaffUI2", List.of("statistics", "logout"),
                "management-staff/StatisticsUI2", List.of("customerStatistics", "sparePartStatistics", "SupplierStatistics", "serviceStatistics", "back"),
                "management-staff/CustomerStatisticsUI2", List.of("startDate", "endDate", "btnSearch", "tblCustomers", "back"),
                "management-staff/CustomerInvoicesUI2", List.of("tblCustomerInformation", "tblInvoices", "back"),
                "management-staff/InvoiceDetailsUI2", List.of("tblInvoiceInformation", "tblOrderDetails", "back"));
        for (var screen : screens.entrySet()) {
            Path source = Path.of("src/main/view", screen.getKey());
            String className = source.getFileName().toString();
            String content = Files.readString(source.resolveSibling(className + ".jsp"));
            Matcher scriptlet = Pattern.compile("<%(?![@!])([\\s\\S]*?)%>").matcher(content);
            assertTrue(scriptlet.find(), screen.getKey());
            assertTrue(Pattern.compile("\\bclass\\s+" + className + "\\s*\\{")
                    .matcher(scriptlet.group(1)).find(), screen.getKey() + " request class");
            for (String id : screen.getValue()) { assertTrue(content.contains("id=\"" + id + "\""), screen.getKey() + ": " + id); }
        }
    }
}
