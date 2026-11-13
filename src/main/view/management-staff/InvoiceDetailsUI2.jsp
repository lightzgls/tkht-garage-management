<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%@ include file="WEB-INF/auth.jspf" %>
<%
    final HttpSession currentSession = session;
    class InvoiceDetailsUI2 {
        private CustomerStatistics2 selectedCustomer;
        private Invoice2 selectedInvoice;
        private List<OrderDetail2> orderDetails = new ArrayList<>();

        public void loadDetails() throws SQLException {
            selectedCustomer = (CustomerStatistics2) currentSession.getAttribute("selectedCustomer");
            selectedInvoice = (Invoice2) currentSession.getAttribute("selectedInvoice");
            if (request.getParameter("invoiceId") != null) {
                selectedInvoice = null;
                List<Invoice2> invoices = (List<Invoice2>) currentSession.getAttribute("invoices");
                if (invoices != null) {
                    for (Invoice2 invoice : invoices) {
                        if (String.valueOf(invoice.getId()).equals(request.getParameter("invoiceId"))) {
                            selectedInvoice = invoice;
                            break;
                        }
                    }
                }
            }
            if (selectedCustomer == null || selectedInvoice == null
                    || selectedInvoice.getOrder().getCustomer().getId() != selectedCustomer.getId()) {
                selectedInvoice = null;
                response.setStatus(404);
                request.setAttribute("error", "Vui lòng chọn hóa đơn từ danh sách của khách hàng.");
                return;
            }
            try (OrderDetailDAO2 dao = new OrderDetailDAO2()) {
                orderDetails = dao.getOrderDetails(selectedInvoice.getOrder().getId());
            }
            selectedInvoice.getOrder().setOrderDetails(orderDetails);
            currentSession.setAttribute("selectedInvoice", selectedInvoice);
        }
    }
    InvoiceDetailsUI2 ui = new InvoiceDetailsUI2();
    try {
        ui.loadDetails();
    } catch (SQLException error) {
        application.log("InvoiceDetailsUI2.loadDetails() failed", error);
        response.setStatus(503);
        request.setAttribute("error", "Không thể tải chi tiết hóa đơn. Vui lòng tải lại trang.");
    }
    CustomerStatistics2 selectedCustomer = ui.selectedCustomer;
    Invoice2 selectedInvoice = ui.selectedInvoice;
    List<OrderDetail2> orderDetails = ui.orderDetails;
    request.setAttribute("selectedCustomer", selectedCustomer);
    request.setAttribute("selectedInvoice", selectedInvoice);
    request.setAttribute("orderDetails", orderDetails);
    request.setAttribute("title", "Invoice Details");
%>
<%@ include file="WEB-INF/header.jspf" %>
<a id="back" href="CustomerInvoicesUI2.jsp">Back</a>
<c:if test="${not empty error}"><p role="alert"><c:out value="${error}"/></p></c:if>
<% if (selectedInvoice != null) { %>
<table id="tblInvoiceInformation"><colgroup><col><col></colgroup><thead><tr><th colspan="2">Invoice Details</th></tr></thead><tbody>
    <tr><td>Invoice Number</td><td><c:out value="${selectedInvoice.code}"/></td></tr>
    <tr><td>Customer</td><td><c:out value="${selectedCustomer.name}"/></td></tr>
    <tr><td>Created At</td><td><%= date(selectedInvoice.getCreatedAt().toLocalDate()) %></td></tr>
    <tr><td>Status</td><td><%= selectedInvoice.getPaidAt() == null ? "Unpaid" : "Paid" %></td></tr>
</tbody></table>
<div>
<h2>Order Details (VND)</h2>
<table id="tblOrderDetails">
    <thead><tr>
        <th class="ordinal">No.</th><th>Type</th><th>Item</th><th class="numeric">Qty</th>
        <th class="numeric">Unit Price</th><th class="numeric">Before Tax</th><th class="numeric">Tax Rate</th>
        <th class="numeric">Tax Amount</th><th class="numeric">Line Total</th>
    </tr></thead>
    <tbody>
    <% for (int index = 0; index < orderDetails.size(); index++) {
        OrderDetail2 detail = orderDetails.get(index);
        boolean service = detail instanceof ServiceDetail2;
        int quantity = service ? 1 : ((PartDetail2) detail).getQuantity();
        String name = service ? ((ServiceDetail2) detail).getService().getName()
                : ((PartDetail2) detail).getSparePart().getName();
        double amountBeforeTax = detail.getUnitPrice() * quantity;
        double taxAmount = amountBeforeTax * detail.getAppliedTax();
        request.setAttribute("itemName", name);
    %>
        <tr data-detail="<%= detail.getId() %>"><td class="ordinal"><%= index + 1 %></td><td><%= service ? "Service" : "Spare Part" %></td>
            <td><c:out value="${itemName}"/></td><td class="numeric"><%= quantity %></td><td class="numeric"><%= money(detail.getUnitPrice()) %></td>
            <td class="numeric"><%= money(amountBeforeTax) %></td><td class="numeric"><%= money(detail.getAppliedTax() * 100) %>%</td>
            <td class="numeric"><%= money(taxAmount) %></td><td class="numeric"><%= money(amountBeforeTax + taxAmount) %></td></tr>
    <% } %>
    </tbody>
</table>
</div>
<table><thead><tr><th>Amount Type</th><th class="numeric">Value (VND)</th></tr></thead><tbody>
    <tr><td>Subtotal</td><td class="numeric"><%= money(selectedInvoice.getSubTotal()) %></td></tr>
    <tr><td>Total Tax</td><td class="numeric"><%= money(selectedInvoice.getTaxTotal()) %></td></tr>
    <tr><td>Total Amount</td><td class="numeric"><%= money(selectedInvoice.getTotal()) %></td></tr>
</tbody></table>
<h2>Payment Information</h2>
<table><thead><tr><th>Payment Time</th><th>Payment Method</th><th>Reference Code</th><th>Staff</th></tr></thead><tbody>
    <tr><td><%= selectedInvoice.getPaidAt() == null ? "" : selectedInvoice.getPaidAt().format(DateTimeFormatter.ofPattern("dd/MM/uuuu HH:mm")) %></td>
        <td><c:out value="${selectedInvoice.method}"/></td><td><c:out value="${selectedInvoice.referenceCode}"/></td><td><c:out value="${selectedInvoice.salesStaff.name}"/></td></tr>
</tbody></table>
<% } %>
<%@ include file="WEB-INF/footer.jspf" %>
