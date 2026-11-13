<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%@ include file="WEB-INF/auth.jspf" %>
<%
    class StatisticsUI2 {
        public void CustomerStatClicked() throws java.io.IOException {
            response.sendRedirect("CustomerStatisticsUI2.jsp");
        }
    }
    StatisticsUI2 ui = new StatisticsUI2();
    if ("CustomerStatClicked".equals(request.getParameter("action"))) {
        ui.CustomerStatClicked();
        return;
    }
    request.setAttribute("title", "Statistics");
%>
<%@ include file="WEB-INF/header.jspf" %>
<a id="back" href="ManagementStaffUI2.jsp">Back</a>
<h1>Statistics</h1>
<nav class="statistics-menu">
    <p><a class="button" id="customerStatistics" href="StatisticsUI2.jsp?action=CustomerStatClicked">Customer Statistics</a></p>
    <p><button type="button" id="sparePartStatistics" disabled>Spare Part Statistics</button></p>
    <p><button type="button" id="SupplierStatistics" disabled>Supplier Statistics</button></p>
    <p><button type="button" id="serviceStatistics" disabled>Service Statistics</button></p>
</nav>
<%@ include file="WEB-INF/footer.jspf" %>
