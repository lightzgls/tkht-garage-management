<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%
    final HttpSession currentSession = session;
    class LoginUI2 {
        private String username;
        private String password;

        public boolean login() throws SQLException, java.io.IOException {
            String sql = "SELECT id, name, tel, email, username, status FROM tblStaff2"
                    + " WHERE username = ? AND password = ? AND role = 'Management Staff' AND status = 'Active'";
            try (Connection connection = DriverManager.getConnection(
                    System.getProperty("DB_URL", System.getenv().getOrDefault("DB_URL", "jdbc:mysql://localhost:3306/garage_management?connectionTimeZone=Asia/Bangkok&connectTimeout=5000&socketTimeout=5000")),
                    System.getProperty("DB_USER", System.getenv().getOrDefault("DB_USER", "garage")),
                    System.getProperty("DB_PASSWORD", System.getenv().getOrDefault("DB_PASSWORD", "garage_dev")));
                 PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, password);
                try (ResultSet rows = statement.executeQuery()) {
                    if (rows.next()) {
                        ManagementStaff staff = new ManagementStaff();
                        staff.setId(rows.getInt("id"));
                        staff.setName(rows.getString("name"));
                        staff.setTel(rows.getString("tel"));
                        staff.setEmail(rows.getString("email"));
                        staff.setUsername(rows.getString("username"));
                        staff.setStatus(rows.getString("status"));
                        currentSession.invalidate();
                        request.getSession(true).setAttribute("staff", staff);
                        response.sendRedirect("ManagementStaffUI2.jsp");
                        return true;
                    }
                }
            }
            response.setStatus(401);
            request.setAttribute("error", "Sai tài khoản, mật khẩu hoặc không có quyền quản lý.");
            return false;
        }
    }
    LoginUI2 ui = new LoginUI2();
    response.setHeader("Cache-Control", "no-store");
    if ("POST".equals(request.getMethod())) {
        ui.username = request.getParameter("username");
        ui.password = request.getParameter("password");
        try {
            if (ui.login()) { return; }
        } catch (SQLException error) {
            application.log("LoginUI2.login() failed", error);
            response.setStatus(503);
            request.setAttribute("error", "Không thể kết nối cơ sở dữ liệu. Vui lòng thử lại.");
        }
    }
    request.setAttribute("title", "Login");
%>
<%@ include file="WEB-INF/header.jspf" %>
<a href="MainUI2.jsp">Back</a>
<h1>Login</h1>
<form class="date-form" method="post" action="LoginUI2.jsp">
    <p><label>Username: <input name="username" autocomplete="username" required value="<c:out value='${param.username}'/>"></label></p>
    <p><label>Password: <input name="password" type="password" autocomplete="current-password" required></label></p>
    <p><button type="submit">Login</button></p>
</form>
<c:if test="${not empty error}"><p role="alert"><c:out value="${error}"/></p></c:if>
<%@ include file="WEB-INF/footer.jspf" %>
