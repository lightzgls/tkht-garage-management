<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%
    class MainUI2 {
        public void searchFuncClicked() throws java.io.IOException {
            response.sendRedirect("SearchServicesPartsUI2.jsp");
        }

        public void openLogin() throws java.io.IOException {
            response.sendRedirect("LoginUI2.jsp");
        }
    }
    MainUI2 ui = new MainUI2();
    if ("searchFuncClicked".equals(request.getParameter("action"))) {
        ui.searchFuncClicked();
        return;
    }
    if ("openLogin".equals(request.getParameter("action"))) {
        ui.openLogin();
        return;
    }
    request.setAttribute("title", "Garage Management System");
%>
<%@ include file="WEB-INF/header.jspf" %>
<h1>Garage Management System</h1>
<nav class="home-menu">
    <p><a class="button" href="MainUI2.jsp?action=openLogin">Login</a></p>
    <p><a class="button" id="searchServicesParts" href="MainUI2.jsp?action=searchFuncClicked">Search Services / Spare Parts</a></p>
</nav>
<%@ include file="WEB-INF/footer.jspf" %>
