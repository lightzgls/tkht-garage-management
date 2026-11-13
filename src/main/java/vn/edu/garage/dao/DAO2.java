package vn.edu.garage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/** Mỗi DAO mở một kết nối; try-with-resources ở JSP sẽ đóng kết nối đó. */
public class DAO2 implements AutoCloseable {
    protected Connection con;

    public DAO2() throws SQLException {
        con = DriverManager.getConnection(
                System.getProperty("DB_URL", System.getenv().getOrDefault("DB_URL",
                        "jdbc:mysql://localhost:3306/garage_management?connectionTimeZone=Asia/Bangkok&connectTimeout=5000&socketTimeout=5000")),
                System.getProperty("DB_USER", System.getenv().getOrDefault("DB_USER", "garage")),
                System.getProperty("DB_PASSWORD", System.getenv().getOrDefault("DB_PASSWORD", "garage_dev")));
    }

    @Override
    public void close() throws SQLException {
        con.close();
    }
}
