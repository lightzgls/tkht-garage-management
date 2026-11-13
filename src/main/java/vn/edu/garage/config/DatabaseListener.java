package vn.edu.garage.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/** Nạp driver từ WEB-INF/lib trước khi JSP hoặc DAO mở kết nối trên Tomcat. */
public class DatabaseListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException error) {
            throw new IllegalStateException("Missing MySQL JDBC driver in WEB-INF/lib.", error);
        }
    }
}
