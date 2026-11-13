<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%@ include file="WEB-INF/auth.jspf" %>
<%
    final HttpSession currentSession = session;
    class CustomerInvoicesUI2 {
        private CustomerStatistics2 selectedCustomer;
        private List<Invoice2> invoices = new ArrayList<>();

        public void loadInvoices() throws SQLException {
            selectedCustomer = (CustomerStatistics2) currentSession.getAttribute("selectedCustomer");
            if (request.getParameter("customerId") != null) {
                selectedCustomer = null;
                List<CustomerStatistics2> customers = (List<CustomerStatistics2>) currentSession.getAttribute("customerStatistics");
                if (customers != null) {
                    for (CustomerStatistics2 customer : customers) {
                        if (String.valueOf(customer.getId()).equals(request.getParameter("customerId"))) {
                            selectedCustomer = customer;
                            break;
                        }
                    }
                }
            }
            if (selectedCustomer == null) {
                response.setStatus(404);
                request.setAttribute("error", "Vui lòng chọn khách hàng từ kết quả thống kê.");
                return;
            }
            try (InvoiceDAO2 dao = new InvoiceDAO2()) {
                invoices = dao.getInvoicesByCustomer(selectedCustomer);
            }
            currentSession.setAttribute("selectedCustomer", selectedCustomer);
            currentSession.setAttribute("invoices", invoices);
            currentSession.removeAttribute("selectedInvoice");
        }

        public void viewInvoiceDetailClicked(String invoiceId) throws java.io.IOException {
            response.sendRedirect("InvoiceDetailsUI2.jsp?invoiceId="
                    + java.net.URLEncoder.encode(invoiceId == null ? "" : invoiceId, java.nio.charset.StandardCharsets.UTF_8));
        }
    }
    CustomerInvoicesUI2 ui = new CustomerInvoicesUI2();
    if ("viewInvoiceDetailClicked".equals(request.getParameter("action"))) {
        ui.viewInvoiceDetailClicked(request.getParameter("invoiceId"));
        return;
    }
    try {
        ui.loadInvoices();
    } catch (SQLException error) {
        application.log("CustomerInvoicesUI2.loadInvoices() failed", error);
        response.setStatus(503);
        request.setAttribute("error", "Không thể tải danh sách hóa đơn. Vui lòng tải lại trang.");
    }
    CustomerStatistics2 selectedCustomer = ui.selectedCustomer;
    List<Invoice2> invoices = ui.invoices;
    request.setAttribute("selectedCustomer", selectedCustomer);
    request.setAttribute("invoices", invoices);
    request.setAttribute("title", "Customer Invoices");
%>
<%@ include file="WEB-INF/header.jspf" %>
<c:url var="back" value="CustomerStatisticsUI2.jsp"><c:param name="startDate" value="${sessionScope.startDate}"/><c:param name="endDate" value="${sessionScope.endDate}"/></c:url>
<a id="back" href="<c:out value='${back}'/>">Back</a>
<h1><c:out value="${title}"/></h1>
<c:if test="${not empty error}"><p role="alert"><c:out value="${error}"/></p></c:if>
<% if (selectedCustomer != null) { %>
<p>Period: <%= date(selectedCustomer.getStartDate()) %> - <%= date(selectedCustomer.getEndDate()) %></p>
<table id="tblCustomerInformation"><colgroup><col><col></colgroup><thead><tr><th colspan="2">Customer Information</th></tr></thead><tbody>
    <tr><td>Customer Code</td><td><c:out value="${selectedCustomer.code}"/></td></tr>
    <tr><td>Customer Name</td><td><c:out value="${selectedCustomer.name}"/></td></tr>
    <tr><td>Phone Number</td><td><c:out value="${selectedCustomer.tel}"/></td></tr>
    <tr><td>Invoice Count</td><td class="numeric">${selectedCustomer.totalInvoice}</td></tr>
    <tr><td>Total Revenue</td><td class="numeric"><%= money(selectedCustomer.getTotalRevenue()) %> VND</td></tr>
</tbody></table>
<h2>Invoice List:</h2>
<table id="tblInvoices">
    <thead><tr><th class="ordinal">No.</th><th>Invoice Number</th><th>Created At</th><th class="numeric">Total Amount (VND)</th></tr></thead>
    <tbody>
    <% for (int index = 0; index < invoices.size(); index++) {
        Invoice2 invoice = invoices.get(index);
        request.setAttribute("invoice", invoice);
    %>
        <c:url var="invoiceUrl" value="CustomerInvoicesUI2.jsp"><c:param name="action" value="viewInvoiceDetailClicked"/><c:param name="invoiceId" value="${invoice.id}"/></c:url>
        <tr data-invoice="<c:out value='${invoice.code}'/>"><td class="ordinal"><%= index + 1 %></td>
            <td class="linked"><a href="<c:out value='${invoiceUrl}'/>"><c:out value="${invoice.code}"/></a></td>
            <td><%= date(invoice.getCreatedAt().toLocalDate()) %></td><td class="numeric"><%= money(invoice.getTotal()) %></td></tr>
    <% } %>
    </tbody>
</table>
<% } %>
<%@ include file="WEB-INF/footer.jspf" %>
