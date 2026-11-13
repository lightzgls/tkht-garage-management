package vn.edu.garage.dao;

import vn.edu.garage.model.SparePart2;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class SparePartDAO2 extends DAO2 {
    public SparePartDAO2() throws SQLException { super(); }

    /** Tìm tên có chứa từ khóa; trang bắt đầu từ 1, mỗi trang tối đa 20 dòng. */
    public List<SparePart2> getSparePartsByName(String keyword, int page) throws SQLException {
        if (page < 1) { throw new IllegalArgumentException("Trang phải lớn hơn 0."); }
        String sql = "SELECT name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status, code, id FROM tblSparePart2"
                + " WHERE LOWER(name) LIKE ? ESCAPE '!' ORDER BY code LIMIT 20 OFFSET ?";
        List<SparePart2> results = new ArrayList<>();
        try (var statement = con.prepareStatement(sql)) {
            String text = keyword.strip().toLowerCase(Locale.ROOT)
                    .replace("!", "!!").replace("%", "!%").replace("_", "!_");
            statement.setString(1, "%" + text + "%");
            statement.setLong(2, ((long) page - 1) * 20);
            try (var rows = statement.executeQuery()) {
                while (rows.next()) {
                    SparePart2 item = new SparePart2();
                    item.setName(rows.getString("name"));
                    item.setImg(rows.getString("img"));
                    item.setCompatibilityNote(rows.getString("compatibilityNote"));
                    item.setSellingPrice(rows.getDouble("sellingPrice"));
                    item.setTax(rows.getDouble("tax"));
                    item.setReorderLevel(rows.getInt("reorderLevel"));
                    item.setStatus(rows.getString("status"));
                    item.setCode(rows.getString("code"));
                    item.setId(rows.getInt("id"));
                    results.add(item);
                }
            }
        }
        return results;
    }
}

