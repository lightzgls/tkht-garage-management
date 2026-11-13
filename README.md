# Garage Management — Java Web

Triển khai hai module từ **Design** và **PlantUML - Design** trong tài liệu TKHT:

1. Khách hàng tìm dịch vụ/phụ tùng và xem chi tiết.
2. Quản lý xem doanh thu khách hàng, danh sách hóa đơn và chi tiết hóa đơn.

Ưu tiên code đơn giản, dễ đọc; giữ các lớp, DAO và luồng chức năng trong thiết kế. Mỗi JSP có class Java cùng tên ngay trong scriptlet, tạo đối tượng UI riêng cho từng request như cách làm ở `module1`. Giao diện giữ bố cục mockup: khung, tiêu đề căn giữa, Back, hàng tìm kiếm, bảng có đường viền và màu ô liên kết. Chỉ dùng một file CSS ngắn cho những phần này; không dùng JavaScript điều hướng. Các bản `module1` và `module1-swing` là bản cũ, được giữ nguyên.

## Xem thử nhanh, không cần Docker

Cần JDK 17+ và Maven 3.9+. Script tự tìm Maven đi kèm NetBeans đã cài trên máy này.

Từ thư mục gốc TKHT:

```powershell
.\garage-management\preview.ps1
```

Mở [bản xem thử](http://127.0.0.1:8091/garage/MainUI2.jsp). Script build, chạy kiểm thử rồi mở Tomcat 9 với **H2 trong bộ nhớ**. Dữ liệu được khởi tạo lại khi dừng/chạy server. Nhấn Ctrl+C để dừng. Sau khi đã build thành công, có thể chạy `preview.ps1 -SkipBuild`.

## Chạy với MySQL

Mở Docker Desktop, rồi chạy từ thư mục TKHT:

```powershell
.\garage-management\run.ps1
```

Mở [ứng dụng](http://localhost:8081). Compose build WAR và khởi động Tomcat 9/JDK 17 cùng MySQL 8.4. Database là `garage_management`, project Compose `tkht-design-web`, volume `tkht-design-web_design_data`, tách khỏi database cũ.

Schema và seed gốc chỉ chạy khi volume mới được tạo. `run.ps1` còn nạp `sample-data.sql` để bổ sung dữ liệu cho cả volume đã tồn tại. Script chỉ thêm mã chưa có; chạy lại không ghi đè hoặc tạo trùng. Ứng dụng hai module chỉ đọc dữ liệu; không có màn sửa/xóa dữ liệu. Có thể đổi cổng bằng `$env:APP_PORT = '8082'` trước khi chạy. Dừng bằng `docker compose -f garage-management/compose.yaml stop`.

## Dữ liệu mẫu MySQL

Sau khi nạp: **25 dịch vụ, 23 phụ tùng, 12 khách hàng, 45 hóa đơn**; gồm 42 hóa đơn đã thanh toán và 3 hóa đơn chưa thanh toán. Dữ liệu từ **05/08/2026 đến 01/11/2026**. Những số lượng này áp dụng cho database mẫu ban đầu; dữ liệu bạn tự thêm vẫn được giữ.

- Tìm kiếm: chọn Service hoặc Spare Part, để trống từ khóa rồi Search để xem toàn bộ và thử phân trang. Có cả tên tiếng Anh lẫn tiếng Việt như `Oil`, `Battery`, `lốp`, `lọc`.
- Thống kê: chọn **01/08/2026** đến **01/11/2026** trên lịch để xem toàn bộ mẫu; hoặc **01/10/2026** đến **31/10/2026** để xem tháng 10.
- Hóa đơn mới HD007–HD045 có dòng dịch vụ và phụ tùng, số lượng, thuế và thông tin thanh toán. HD043–HD045 chưa thanh toán nên không được tính vào doanh thu.
- Sáu hóa đơn gốc tháng 8 và tổng **12.500.000 VND** được giữ nguyên.

Để nạp bổ sung mà không build/khởi động lại ứng dụng:

```powershell
.\garage-management\sample-data.ps1
```

Bản xem thử H2 vẫn dùng bộ mẫu gốc trong `seed.sql`. Bộ mẫu bổ sung dùng SQL cho MySQL và không thay đổi dữ liệu kiểm thử H2.

## Thử chức năng

- Trang chủ → Search Services / Spare Parts → chọn loại, nhập `Brake` hoặc `Front` → bấm tên để xem chi tiết → Back.
- Trang chủ → Login bằng **xxx / 123456** → Statistics → Customer Statistics.
- Chọn **01/08/2026** đến **31/08/2026** bằng hai ô ngày → Search. Kết quả: 3 khách hàng, tổng **12.500.000 VND**.
- Chọn Khách mẫu KH001: 3 hóa đơn, tổng **6.500.000 VND**. Chọn HD001: tổng **2.200.000 VND**, gồm 2 dịch vụ và 2 phụ tùng Front Brake Pads.
- Back trở lại danh sách hóa đơn/thống kê; Log Out kết thúc phiên quản lý.

Tài khoản và mật khẩu seed là dữ liệu demo cho bài tập. Đăng nhập chỉ cho vai trò Management Staff. Các mục Spare Part/Supplier/Service Statistics giữ ở menu nhưng chưa có chức năng vì hai tab không thiết kế luồng triển khai cho các mục đó.

## Đọc code

```text
src/main/java/vn/edu/garage/
  model/       21 lớp thực thể; constructor rỗng và getter/setter
  dao/         DAO2 + 5 DAO truy vấn
  config/      Nạp JDBC driver khi Tomcat khởi động ứng dụng
src/main/view/
  main-ui/           Trang chính, tìm kiếm và chi tiết dịch vụ/phụ tùng
  management-staff/  Đăng nhập quản lý, thống kê và hóa đơn
src/main/webapp/
  WEB-INF/     phần dùng chung, kiểm tra đăng nhập, cấu hình
  assets/design.css  định dạng giao diện dùng chung
src/main/resources/db/
  schema.sql   13 bảng theo PlantUML
  seed.sql     dữ liệu minh họa
  sample-data.sql  dữ liệu bổ sung cho MySQL; chạy lại không trùng
src/test/      kiểm thử lớp, SQL và HTTP/JSP
design/        bản chụp phần chữ của đúng hai tab đã đọc
```

Các thư mục View theo sơ đồ gói số 09. Sales Staff và Warehouse Staff chưa có màn hình trong hai module đã triển khai. Bản WAR và bản xem thử vẫn phục vụ các trang JSP ở URL hiện tại.

UI gọi DAO trực tiếp như sơ đồ. Mỗi DAO dùng PreparedStatement, trả về entity, và được đóng bằng try-with-resources. Kết quả tìm kiếm/khách hàng/hóa đơn được truyền qua session; các trang kiểm tra đối tượng được chọn thuộc danh sách vừa tải.

Ví dụ: `SearchServicesPartsUI2.jsp` khai báo class `SearchServicesPartsUI2` với dữ liệu tìm kiếm, `searchClicked()` và `ViewDetails(code)`. JSP tạo `new SearchServicesPartsUI2()` cho request hiện tại, gọi hàm xử lý rồi hiển thị HTML. Các thao tác menu dùng link/form gọi phương thức trong class UI; không cần JavaScript điều hướng.

`PartDetailsUI2.jsp` hiển thị cả `SparePart2.img`: có đường dẫn thì render ảnh, rỗng thì hiện “Chưa có ảnh minh họa”. Hai ô Start Date/End Date dùng `input type="date"`, gửi ngày dạng ISO `yyyy-MM-dd`; báo cáo và hóa đơn hiển thị `dd/MM/yyyy`. Các link thống kê cũ dùng `dd/MM/yyyy` vẫn được đọc và chuyển về giá trị ISO cho ô ngày.

Xem [DESIGN-MATCH.md](DESIGN-MATCH.md) để đối chiếu từng lớp và các điểm tài liệu chưa thống nhất. Seed thêm SV03 theo dòng dịch vụ trong HD001, nên tìm `Brake` trả 3 dòng thay vì 2 dòng minh họa ở mockup tìm kiếm.

## Build và kiểm thử

```powershell
.\garage-management\build.ps1
```

Hoặc chạy `mvn package` bên trong `garage-management`. Kết quả là `target/garage-management.war`, có thể deploy lên Tomcat 9. Khi deploy riêng, cấu hình `DB_URL`, `DB_USER`, `DB_PASSWORD` để trỏ đến MySQL đã import schema/seed.

Kết quả xác minh ngày 01/11/2026: **14 test đạt**, gồm hợp đồng lớp từ PlantUML, cấu trúc bảng/FK, tìm kiếm/phân trang, doanh thu/ngày thanh toán, giá lịch sử, các trang JSP thật, login/logout và trường hợp lỗi. Build WAR thành công. Ngoài kiểm thử H2/Tomcat 9, đã chạy thành công cả hai luồng qua HTTP trên Tomcat Docker kết nối MySQL 8.4: đăng nhập, tìm kiếm, chi tiết dịch vụ/phụ tùng, thống kê, hóa đơn và đăng xuất. Nginx/HTTPS trong sơ đồ triển khai chưa được dựng trong môi trường demo localhost.

`DatabaseListener` nạp `com.mysql.cj.jdbc.Driver` từ `WEB-INF/lib` lúc khởi động. Bước này cần cho bản WAR chạy trên Tomcat; nếu chỉ kiểm thử với JDBC driver trên classpath của chương trình Java, lỗi `No suitable driver found` có thể không xuất hiện.

Cập nhật 03/11/2026: giữ 10 class UI trong JSP và điều hướng phía Java; sửa bố cục theo mockup, bổ sung ảnh phụ tùng và ô chọn ngày. **14 test đạt**, gồm trường ảnh có/không có đường dẫn và giá trị ISO của hai ô ngày; build WAR thành công.
