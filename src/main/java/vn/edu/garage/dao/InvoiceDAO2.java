package vn.edu.garage.dao;

import vn.edu.garage.model.*;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class InvoiceDAO2 extends DAO2 {
    public InvoiceDAO2() throws SQLException { super(); }

    /** Nhận đúng CustomerStatistics2 để giữ khách hàng và khoảng ngày đã chọn. */
    public List<Invoice2> getInvoicesByCustomer(CustomerStatistics2 selectedCustomerID) throws SQLException {
        String sql = """
                SELECT i.*, o.receivedAt, o.vehiclePlate, o.vehicleBrand, o.vehicleModel,
                       s.name AS staffName, s.tel AS staffTel, s.email AS staffEmail,
                       s.username AS staffUsername, s.status AS staffStatus
                FROM tblInvoice2 i
                JOIN tblOrder2 o ON o.id = i.orderId
                JOIN tblStaff2 s ON s.id = i.salesStaffId
                WHERE o.customerId = ? AND i.paidAt >= ? AND i.paidAt < ?
                ORDER BY i.createdAt, i.code
                """;
        List<Invoice2> invoices = new ArrayList<>();
        try (var statement = con.prepareStatement(sql)) {
            statement.setInt(1, selectedCustomerID.getId());
            statement.setTimestamp(2, Timestamp.valueOf(selectedCustomerID.getStartDate().atStartOfDay()));
            statement.setTimestamp(3, Timestamp.valueOf(selectedCustomerID.getEndDate().plusDays(1).atStartOfDay()));
            try (var rows = statement.executeQuery()) {
                while (rows.next()) {
                    Order2 order = new Order2();
                    order.setId(rows.getInt("orderId"));
                    order.setReceivedAt(rows.getTimestamp("receivedAt").toLocalDateTime());
                    order.setVehiclePlate(rows.getString("vehiclePlate"));
                    order.setVehicleBrand(rows.getString("vehicleBrand"));
                    order.setVehicleModel(rows.getString("vehicleModel"));
                    order.setCustomer(selectedCustomerID);

                    SalesStaff2 staff = new SalesStaff2();
                    staff.setId(rows.getInt("salesStaffId"));
                    staff.setName(rows.getString("staffName"));
                    staff.setTel(rows.getString("staffTel"));
                    staff.setEmail(rows.getString("staffEmail"));
                    staff.setUsername(rows.getString("staffUsername"));
                    staff.setStatus(rows.getString("staffStatus"));

                    Invoice2 invoice = new Invoice2();
                    invoice.setId(rows.getInt("id"));
                    invoice.setCode(rows.getString("code"));
                    invoice.setCreatedAt(rows.getTimestamp("createdAt").toLocalDateTime());
                    invoice.setSubTotal(rows.getDouble("subTotal"));
                    invoice.setTaxTotal(rows.getDouble("taxTotal"));
                    invoice.setTotal(rows.getDouble("total"));
                    invoice.setPaidAt(rows.getTimestamp("paidAt").toLocalDateTime());
                    invoice.setMethod(rows.getString("method"));
                    invoice.setReferenceCode(rows.getString("referenceCode"));
                    invoice.setOrder(order);
                    invoice.setSalesStaff(staff);
                    invoices.add(invoice);
                }
            }
        }
        return invoices;
    }
}

