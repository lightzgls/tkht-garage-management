<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%@ include file="WEB-INF/auth.jspf" %>
<%
    final HttpSession currentSession = session;
    class CustomerStatisticsUI2 {
        private String startDate;
        private String endDate;
        private List<CustomerStatistics2> customerStatistics = new ArrayList<>();
        private double totalRevenue;

        public void searchClicked() throws SQLException {
            LocalDate from = parseDate(startDate == null ? "" : startDate);
            LocalDate to = parseDate(endDate == null ? "" : endDate);
            if (from.getYear() < 1 || to.getYear() > 9998 || from.isAfter(to)) {
                throw new IllegalArgumentException("Khoảng ngày không hợp lệ.");
            }
            startDate = from.toString();
            endDate = to.toString();
            try (CustomerStatisticsDAO2 dao = new CustomerStatisticsDAO2()) {
                customerStatistics = dao.getCustomerStatistics(from, to);
            }
            for (CustomerStatistics2 customer : customerStatistics) {
                totalRevenue += customer.getTotalRevenue();
            }
            currentSession.setAttribute("customerStatistics", customerStatistics);
            currentSession.setAttribute("startDate", startDate);
            currentSession.setAttribute("endDate", endDate);
            currentSession.removeAttribute("selectedCustomer");
            currentSession.removeAttribute("selectedInvoice");
            currentSession.removeAttribute("invoices");
        }

        public void customerSelected(String customerId) throws java.io.IOException {
            response.sendRedirect("CustomerInvoicesUI2.jsp?customerId="
                    + java.net.URLEncoder.encode(customerId == null ? "" : customerId, java.nio.charset.StandardCharsets.UTF_8));
        }
    }
    CustomerStatisticsUI2 ui = new CustomerStatisticsUI2();
    if ("customerSelected".equals(request.getParameter("action"))) {
        ui.customerSelected(request.getParameter("customerId"));
        return;
    }
    ui.startDate = request.getParameter("startDate");
    ui.endDate = request.getParameter("endDate");
    boolean searched = ui.startDate != null || ui.endDate != null;
    if (searched) {
        try {
            ui.searchClicked();
        } catch (IllegalArgumentException | DateTimeException error) {
            response.setStatus(400);
            request.setAttribute("error", "Vui lòng chọn đủ hai ngày hợp lệ; ngày bắt đầu không được sau ngày kết thúc.");
        } catch (SQLException error) {
            application.log("CustomerStatisticsUI2.searchClicked() failed", error);
            response.setStatus(503);
            request.setAttribute("error", "Không thể tải thống kê. Vui lòng nhấn Search để thử lại.");
        }
    }
    request.setAttribute("startDate", ui.startDate);
    request.setAttribute("endDate", ui.endDate);
    request.setAttribute("customerStatistics", ui.customerStatistics);
    request.setAttribute("totalRevenue", money(ui.totalRevenue));
    request.setAttribute("searched", searched);
    request.setAttribute("title", "Customer Statistics");
%>
<%@ include file="WEB-INF/header.jspf" %>
<a id="back" href="StatisticsUI2.jsp">Back</a>
<h1>Customer Statistics</h1>
<form class="date-form" method="get" action="CustomerStatisticsUI2.jsp">
    <p><label for="startDate">Start Date: <input type="date" id="startDate" name="startDate" min="0001-01-01" max="9998-12-31" required value="<c:out value='${startDate}'/>"></label></p>
    <p><label for="endDate">End Date: <input type="date" id="endDate" name="endDate" min="0001-01-01" max="9998-12-31" required value="<c:out value='${endDate}'/>"></label></p>
    <p><button type="submit" id="btnSearch">Search</button></p>
</form>
<c:if test="${not empty error}"><p role="alert"><c:out value="${error}"/></p></c:if>
<h2>Results</h2>
<fmt:setLocale value="vi_VN"/>
<table id="tblCustomers">
    <thead><tr>
        <th class="ordinal">No.</th><th>Code</th><th>Customer</th><th>Phone</th>
        <th class="numeric">Invoices</th><th class="numeric">Revenue (VND)</th>
    </tr></thead>
    <tbody>
    <c:forEach items="${customerStatistics}" var="customer" varStatus="row">
        <c:url var="customerUrl" value="CustomerStatisticsUI2.jsp"><c:param name="action" value="customerSelected"/><c:param name="customerId" value="${customer.id}"/></c:url>
        <tr data-customer="<c:out value='${customer.code}'/>"><td class="ordinal">${row.count}</td><td><c:out value="${customer.code}"/></td>
            <td class="linked"><a href="<c:out value='${customerUrl}'/>"><c:out value="${customer.name}"/></a></td>
            <td><c:out value="${customer.tel}"/></td><td class="numeric">${customer.totalInvoice}</td>
            <td class="numeric"><fmt:formatNumber value="${customer.totalRevenue}" maxFractionDigits="0"/></td></tr>
    </c:forEach>
    <c:if test="${not searched}"><c:forEach begin="1" end="3"><tr class="blank"><td></td><td></td><td></td><td></td><td></td><td></td></tr></c:forEach></c:if>
    </tbody>
</table>
<c:if test="${searched and empty customerStatistics and empty error}"><p>Không có hóa đơn đã thanh toán trong khoảng ngày đã chọn.</p></c:if>
<p class="total">Total Revenue: <c:if test="${searched}"><c:out value="${totalRevenue}"/> VND</c:if></p>
<%@ include file="WEB-INF/footer.jspf" %>
