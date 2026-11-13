package vn.edu.garage.dao;

import vn.edu.garage.model.CustomerStatistics2;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerStatisticsDAO2 extends DAO2 {
    public CustomerStatisticsDAO2() throws SQLException { super(); }

    /** Chỉ tính hóa đơn đã thanh toán, theo ngày paidAt, bao gồm cả ngày kết thúc. */
    public List<CustomerStatistics2> getCustomerStatistics(LocalDate startDate, LocalDate endDate)
            throws SQLException {
        if (startDate == null || endDate == null || startDate.isAfter(endDate)) {
            throw new IllegalArgumentException("Khoảng ngày không hợp lệ.");
        }
        String sql = """
                SELECT c.id, c.code, c.name, c.tel, c.email, c.address,
                       COUNT(i.id) AS totalInvoice, SUM(i.total) AS totalRevenue
                FROM tblCustomer2 c
                JOIN tblOrder2 o ON o.customerId = c.id
                JOIN tblInvoice2 i ON i.orderId = o.id
                WHERE i.paidAt >= ? AND i.paidAt < ?
                GROUP BY c.id, c.code, c.name, c.tel, c.email, c.address
                ORDER BY totalRevenue DESC, c.code
                """;
        List<CustomerStatistics2> results = new ArrayList<>();
        try (var statement = con.prepareStatement(sql)) {
            statement.setTimestamp(1, Timestamp.valueOf(startDate.atStartOfDay()));
            statement.setTimestamp(2, Timestamp.valueOf(endDate.plusDays(1).atStartOfDay()));
            try (var rows = statement.executeQuery()) {
                while (rows.next()) {
                    CustomerStatistics2 customer = new CustomerStatistics2();
                    customer.setId(rows.getInt("id"));
                    customer.setCode(rows.getString("code"));
                    customer.setName(rows.getString("name"));
                    customer.setTel(rows.getString("tel"));
                    customer.setEmail(rows.getString("email"));
                    customer.setAddress(rows.getString("address"));
                    customer.setStartDate(startDate);
                    customer.setEndDate(endDate);
                    customer.setTotalInvoice(rows.getInt("totalInvoice"));
                    customer.setTotalRevenue(rows.getDouble("totalRevenue"));
                    results.add(customer);
                }
            }
        }
        return results;
    }
}

