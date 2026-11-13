package vn.edu.garage.dao;

import vn.edu.garage.model.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO2 extends DAO2 {
    public OrderDetailDAO2() throws SQLException { super(); }

    /** Đọc giá và thuế lịch sử từ OrderDetail2, tên dịch vụ/phụ tùng từ bảng liên quan. */
    public List<OrderDetail2> getOrderDetails(int orderID) throws SQLException {
        String sql = """
                SELECT od.id, od.unitPrice, od.appliedTax,
                       sd.orderDetailId AS serviceDetailId, sd.description, sd.status AS detailStatus,
                       sd.technicalStaffId, ts.name AS technicalName,
                       sv.id AS serviceId, sv.code AS serviceCode, sv.name AS serviceName,
                       sv.description AS serviceDescription, sv.basePrice, sv.estimatedDuration,
                       sv.tax AS serviceTax, sv.status AS serviceStatus,
                       pd.orderDetailId AS partDetailId, pd.quantity,
                       sp.id AS partId, sp.code AS partCode, sp.name AS partName, sp.img,
                       sp.compatibilityNote, sp.sellingPrice, sp.tax AS partTax,
                       sp.reorderLevel, sp.status AS partStatus
                FROM tblOrderDetail2 od
                LEFT JOIN tblServiceDetail2 sd ON sd.orderDetailId = od.id
                LEFT JOIN tblService2 sv ON sv.id = sd.serviceId
                LEFT JOIN tblStaff2 ts ON ts.id = sd.technicalStaffId
                LEFT JOIN tblPartDetail2 pd ON pd.orderDetailId = od.id
                LEFT JOIN tblSparePart2 sp ON sp.id = pd.sparePartId
                WHERE od.orderId = ? ORDER BY od.id
                """;
        List<OrderDetail2> details = new ArrayList<>();
        try (var statement = con.prepareStatement(sql)) {
            statement.setInt(1, orderID);
            try (var rows = statement.executeQuery()) {
                while (rows.next()) {
                    boolean isService = rows.getObject("serviceDetailId") != null;
                    boolean isPart = rows.getObject("partDetailId") != null;
                    if (isService == isPart) {
                        throw new SQLException("OrderDetail phải thuộc đúng một loại Service hoặc Spare Part.");
                    }
                    OrderDetail2 detail;
                    if (isService) {
                        Service2 service = new Service2();
                        service.setId(rows.getInt("serviceId"));
                        service.setCode(rows.getString("serviceCode"));
                        service.setName(rows.getString("serviceName"));
                        service.setDescription(rows.getString("serviceDescription"));
                        service.setBasePrice(rows.getDouble("basePrice"));
                        service.setEstimatedDuration(rows.getInt("estimatedDuration"));
                        service.setTax(rows.getDouble("serviceTax"));
                        service.setStatus(rows.getString("serviceStatus"));

                        ServiceDetail2 item = new ServiceDetail2();
                        item.setService(service);
                        item.setDescription(rows.getString("description"));
                        item.setStatus(rows.getString("detailStatus"));
                        if (rows.getObject("technicalStaffId") != null) {
                            TechnicalStaff2 staff = new TechnicalStaff2();
                            staff.setId(rows.getInt("technicalStaffId"));
                            staff.setName(rows.getString("technicalName"));
                            item.setTechnicalStaff(staff);
                        }
                        detail = item;
                    } else {
                        SparePart2 part = new SparePart2();
                        part.setId(rows.getInt("partId"));
                        part.setCode(rows.getString("partCode"));
                        part.setName(rows.getString("partName"));
                        part.setImg(rows.getString("img"));
                        part.setCompatibilityNote(rows.getString("compatibilityNote"));
                        part.setSellingPrice(rows.getDouble("sellingPrice"));
                        part.setTax(rows.getDouble("partTax"));
                        part.setReorderLevel(rows.getInt("reorderLevel"));
                        part.setStatus(rows.getString("partStatus"));

                        PartDetail2 item = new PartDetail2();
                        item.setSparePart(part);
                        item.setQuantity(rows.getInt("quantity"));
                        detail = item;
                    }
                    detail.setId(rows.getInt("id"));
                    detail.setUnitPrice(rows.getDouble("unitPrice"));
                    detail.setAppliedTax(rows.getDouble("appliedTax"));
                    details.add(detail);
                }
            }
        }
        return details;
    }
}

