<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%@ include file="WEB-INF/auth.jspf" %>
<%
    final HttpSession currentSession = session;
    class ManagementStaffUI2 {
        public void ViewStatClicked() throws java.io.IOException {
            response.sendRedirect("StatisticsUI2.jsp");
        }

        public void logout() throws java.io.IOException {
            currentSession.invalidate();
            response.sendRedirect("MainUI2.jsp");
        }
    }
    ManagementStaffUI2 ui = new ManagementStaffUI2();
    if ("POST".equals(request.getMethod()) && "logout".equals(request.getParameter("action"))) {
        ui.logout();
        return;
    }
    if ("ViewStatClicked".equals(request.getParameter("action"))) {
        ui.ViewStatClicked();
        return;
    }
    request.setAttribute("title", "Management Dashboard");
%>
<%@ include file="WEB-INF/header.jspf" %>
<h1>Management Dashboard</h1>
<div>
    <a class="button" id="statistics" href="ManagementStaffUI2.jsp?action=ViewStatClicked">Statistics</a>
    <aside>
        <div>Username: <c:out value="${staff.username}"/></div>
        <form action="ManagementStaffUI2.jsp" method="post"><button id="logout" name="action" value="logout">Log Out</button></form>
    </aside>
</div>
<%@ include file="WEB-INF/footer.jspf" %>
