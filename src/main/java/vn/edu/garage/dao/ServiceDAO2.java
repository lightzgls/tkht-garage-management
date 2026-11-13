package vn.edu.garage.dao;

import vn.edu.garage.model.Service2;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class ServiceDAO2 extends DAO2 {
    public ServiceDAO2() throws SQLException { super(); }

    /** Tìm tên có chứa từ khóa; trang bắt đầu từ 1, mỗi trang tối đa 20 dòng. */
    public List<Service2> getServicesByName(String keyword, int page) throws SQLException {
        if (page < 1) { throw new IllegalArgumentException("Trang phải lớn hơn 0."); }
        String sql = "SELECT id, code, name, description, basePrice, estimatedDuration, tax, status FROM tblService2"
                + " WHERE LOWER(name) LIKE ? ESCAPE '!' ORDER BY code LIMIT 20 OFFSET ?";
        List<Service2> results = new ArrayList<>();
        try (var statement = con.prepareStatement(sql)) {
            String text = keyword.strip().toLowerCase(Locale.ROOT)
                    .replace("!", "!!").replace("%", "!%").replace("_", "!_");
            statement.setString(1, "%" + text + "%");
            statement.setLong(2, ((long) page - 1) * 20);
            try (var rows = statement.executeQuery()) {
                while (rows.next()) {
                    Service2 item = new Service2();
                    item.setId(rows.getInt("id"));
                    item.setCode(rows.getString("code"));
                    item.setName(rows.getString("name"));
                    item.setDescription(rows.getString("description"));
                    item.setBasePrice(rows.getDouble("basePrice"));
                    item.setEstimatedDuration(rows.getInt("estimatedDuration"));
                    item.setTax(rows.getDouble("tax"));
                    item.setStatus(rows.getString("status"));
                    results.add(item);
                }
            }
        }
        return results;
    }
}

