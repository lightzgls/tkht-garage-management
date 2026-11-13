# Đối chiếu với hai tab thiết kế

Theo điều chỉnh ngày 03/11/2026: mỗi JSP giữ class UI cùng tên ngay trong scriptlet như `module1`. Giao diện đơn giản nhưng vẫn giữ bố cục mockup: khung, tiêu đề căn giữa, Back, hàng tìm kiếm, đường bảng và các ô liên kết. Một file CSS ngắn thực hiện các phần bố cục này; không dùng JavaScript điều hướng. Start Date/End Date dùng `input type="date"`. Trang phụ tùng có lại hàng Image từ `SparePart2.img`.

Nguồn duy nhất cho nghiệp vụ: Design và PlantUML - Design, đọc ngày 01/11/2026. Không lấy quy tắc từ Requirement, Analysis1, Analysis2, bản Swing hoặc bản JSP cũ. Bản chụp phần chữ nằm trong `design/`.

## Cách đối chiếu

- Tên JSP, thành phần HTML và chữ ký truy vấn: sơ đồ lớp chi tiết 03–04.
- Kiểu dữ liệu, thuộc tính đối tượng và quan hệ kế thừa: sơ đồ lớp thực thể 01; lớp đã xuất hiện trong 03–04 dùng khai báo chi tiết.
- Bảng, cột, độ dài, nullable, PK/FK/UNIQUE: sơ đồ CSDL 02. Có 13 bảng, 85 cột, 13 khóa ngoại và 7 UNIQUE ngoài khóa chính. Không thêm `discount` hay `paymentStatus`.
- Nhãn, cột, thứ tự thông tin và bố cục: các bảng mockup trong Design.
- Thứ tự xử lý và truyền đối tượng: activity/sequence 05–08. JSP gọi DAO trực tiếp; không thêm tầng Controller, Service, DTO.

JSP khai báo một class Java cùng tên trong scriptlet `<% ... %>` và tạo một đối tượng UI riêng cho mỗi request. Class giữ dữ liệu của trang và các phương thức xử lý như `searchClicked()`, `ViewDetails(code)`, `customerSelected(id)`, `loadInvoices()` và `loadDetails()`. Không dùng JSP declaration `<%! ... %>` cho class UI hoặc field dữ liệu người dùng, nên không chia sẻ trạng thái UI giữa các request.

Các thành phần `Link`, `Input`, `Select`, `Submit`, `Table` được ánh xạ sang HTML `a`, `input`, `select`, `button`, `table` với đúng `id`. Link/form gọi phương thức của class UI trên server; các thuộc tính dữ liệu được đưa sang request attribute để phần HTML đọc qua JSTL/EL.

## Chín trang trong sơ đồ

| JSP | Thành phần/dữ liệu theo sơ đồ |
|---|---|
| MainUI2.jsp | searchServicesParts |
| SearchServicesPartsUI2.jsp | searchType, keyword, btnSearch, tblResults, back, services, spareParts, page |
| ServiceDetailsUI2.jsp | tblInformation, selectedService, back |
| PartDetailsUI2.jsp | tblInformation, selectedPart, back |
| ManagementStaffUI2.jsp | statistics, logout, staff |
| StatisticsUI2.jsp | customerStatistics, sparePartStatistics, SupplierStatistics, serviceStatistics, staff, back |
| CustomerStatisticsUI2.jsp | startDate, endDate, btnSearch, tblCustomers, back, customerStatistics, staff, totalRevenue |
| CustomerInvoicesUI2.jsp | tblCustomerInformation, tblInvoices, back, selectedCustomer, invoices, staff |
| InvoiceDetailsUI2.jsp | tblInvoiceInformation, tblOrderDetails, back, orderDetails, staff, selectedCustomer, selectedInvoice |

`page` là field của class `SearchServicesPartsUI2`, truy cập bằng `ui.page`, nên không xung đột với biến ngầm định `page` của JSP. `currentSession` là tham chiếu cục bộ final để class UI sử dụng session của request.

## DAO

| Lớp | Constructor / phương thức |
|---|---|
| DAO2 | public DAO2(); protected con: Connection |
| ServiceDAO2 | public ServiceDAO2(); getServicesByName(String keyword, int page): List<Service2> |
| SparePartDAO2 | public SparePartDAO2(); getSparePartsByName(String keyword, int page): List<SparePart2> |
| CustomerStatisticsDAO2 | public CustomerStatisticsDAO2(); getCustomerStatistics(LocalDate startDate, LocalDate endDate): List<CustomerStatistics2> |
| InvoiceDAO2 | public InvoiceDAO2(); getInvoicesByCustomer(CustomerStatistics2 selectedCustomerID): List<Invoice2> |
| OrderDetailDAO2 | public OrderDetailDAO2(); getOrderDetails(int orderID): List<OrderDetail2> |

Các constructor/phương thức JDBC khai báo `throws SQLException`. `DAO2` bổ sung `AutoCloseable.close()` để đóng kết nối bằng try-with-resources. Các DAO con dùng cùng quy ước kết nối của DAO2; sơ đồ 04 không vẽ lớp cơ sở này.

`config/DatabaseListener` là cấu hình vòng đời ứng dụng, nạp JDBC driver MySQL khi Tomcat khởi động WAR. Lớp này không thêm phương thức hoặc thuộc tính nghiệp vụ vào các DAO/thực thể trong sơ đồ.

Module 1 truyền đối tượng Service2/SparePart2 đã tìm được sang đúng trang chi tiết qua session. Không thêm các API `getServiceDetails` hoặc `getSparePartDetails` vì chúng không có trong hai tab hiện tại.

Module 2 truyền `staff`, `selectedCustomer`, `selectedInvoice` qua session và kiểm tra lựa chọn nằm trong danh sách vừa tải. Khoảng thống kê nằm trong CustomerStatistics2. Khi xem hóa đơn, DAO đọc danh sách ServiceDetail2/PartDetail2 theo orderID và gán vào Order2.orderDetails.

## 21 lớp thực thể

Mỗi lớp ở một file Java, thuộc tính private; dùng constructor rỗng và getter/setter thông thường. Các lớp kế thừa không khai báo lại thuộc tính cha.

| Lớp | Kế thừa | Thuộc tính khai báo |
|---|---|---|
| `Staff2` | — | `tel: String`, `name: String`, `email: String`, `username: String`, `password: String`, `status: String`, `id: int` |
| `SalesStaff2` | `Staff2` | Không có thuộc tính riêng |
| `ManagementStaff` | `Staff2` | Không có thuộc tính riêng |
| `TechnicalStaff2` | `Staff2` | Không có thuộc tính riêng |
| `WarehouseStaff2` | `Staff2` | Không có thuộc tính riêng |
| `Supplier2` | — | `taxCode: String`, `name: String`, `tel: String`, `email: String`, `address: String`, `status: String`, `id: int` |
| `Service2` | — | `id: int`, `code: String`, `name: String`, `description: String`, `basePrice: double`, `estimatedDuration: int`, `tax: double`, `status: String` |
| `SparePart2` | — | `name: String`, `img: String`, `compatibilityNote: String`, `sellingPrice: double`, `tax: double`, `reorderLevel: int`, `status: String`, `code: String`, `id: int` |
| `Customer2` | — | `name: String`, `tel: String`, `email: String`, `address: String`, `id: int`, `code: String` |
| `Appointment2` | — | `id: int`, `appointmentTime: LocalDateTime`, `note: String`, `status: String`, `contactName: String`, `contactTel: String`, `vehiclePlate: String`, `vehicleBrand: String`, `vehicleModel: String` |
| `Order2` | — | `receivedAt: LocalDateTime`, `vehiclePlate: String`, `vehicleBrand: String`, `vehicleModel: String`, `id: int`, `orderDetails: List<OrderDetail2>`, `customer: Customer2` |
| `OrderDetail2` | — | `appliedTax: double`, `unitPrice: double`, `id: int` |
| `ServiceDetail2` | `OrderDetail2` | `description: String`, `status: String`, `technicalStaff: TechnicalStaff2`, `service: Service2` |
| `PartDetail2` | `OrderDetail2` | `quantity: int`, `sparePart: SparePart2` |
| `Invoice2` | — | `createdAt: LocalDateTime`, `subTotal: double`, `taxTotal: double`, `total: double`, `paidAt: LocalDateTime`, `method: String`, `referenceCode: String`, `id: int`, `code: String`, `order: Order2`, `salesStaff: SalesStaff2` |
| `PartsReceipt2` | — | `receivedAt: LocalDateTime`, `id: int`, `warehouseStaff: WarehouseStaff2`, `supplier: Supplier2`, `partReceiptDetails: List<PartsReceiptDetail2>` |
| `PartsReceiptDetail2` | — | `quantity: int`, `unitPrice: double`, `id: int`, `sparePart: SparePart2` |
| `CustomerStatistics2` | `Customer2` | `totalInvoice: int`, `totalRevenue: double`, `startDate: LocalDate`, `endDate: LocalDate` |
| `ServiceStatistics2` | `Service2` | `startDate: LocalDate`, `endDate: LocalDate` |
| `SupplierStatistic2` | `Supplier2` | `startDate: LocalDate`, `endDate: LocalDate` |
| `SparePartStatistic2` | `SparePart2` | `startDate: LocalDate`, `endDate: LocalDate` |

## Các chỗ nguồn chưa thống nhất

Không thể đồng thời khớp tuyệt đối những khai báo khác nhau dưới đây. Bản code chọn như sau, không sửa Google Doc:

| Điểm lệch | Cách triển khai |
|---|---|
| SparePart2 thiếu id ở sơ đồ 03, nhưng có id ở sơ đồ thực thể, Design và CSDL | Giữ id: int theo mô hình đầy đủ |
| Appointment2.time ở sơ đồ 01; appointmentTime trong Design và CSDL | Dùng appointmentTime: LocalDateTime |
| CustomerStatistic2 / CustomerStatistics2; ManagementStaff2 / ManagementStaff | Dùng CustomerStatistics2 và ManagementStaff theo sơ đồ chi tiết/PlantUML |
| PartsReceipt2.partsReceiptDetails trong chữ; partReceiptDetails trong PlantUML | Giữ partReceiptDetails theo khai báo PlantUML |
| Activity 05 ghi SparePartDetailsUI2.jsp, các sơ đồ 03/07 ghi PartDetailsUI2.jsp | Dùng PartDetailsUI2.jsp |
| Mockup kết quả Brake chỉ có SV01/SV02, nhưng HD001 có thêm Brake System Inspection | Seed có thêm SV03; tìm Brake trả đúng cả 3. Không ẩn dịch vụ để ép khớp số dòng minh họa |
| Có mockup Service Details, chưa có mockup Part Details riêng | Part Details dùng cùng bảng Information/Value, hiển thị code, name, img, compatibilityNote, sellingPrice, status; img được bổ sung theo yêu cầu trực tiếp của người dùng |
| Có điều kiện After Login nhưng chưa thiết kế lớp/DAO đăng nhập | Thêm LoginUI2.jsp hỗ trợ tài khoản quản lý; không thêm StaffDAO hoặc sửa Staff2 |
| Giao diện đơn giản vẫn phải giữ thiết kế | Giữ khung, canh lề, đường bảng, màu liên kết #6fa8dc và các dòng trống ban đầu trong mockup; chỉ bỏ trang trí ngoài thiết kế |

## Chi tiết triển khai tối thiểu

- Phân trang: tham số page trong sơ đồ chưa ghi kích thước hoặc mốc bắt đầu. Bản chạy chọn 20 dòng/trang, bắt đầu từ 1; chỉ hiện điều hướng khi cần.
- Tìm tên chứa từ khóa, bỏ khoảng trắng hai đầu, không phân biệt hoa/thường; dùng PreparedStatement và tìm ký tự %, _ theo nghĩa ký tự. Không lấy quy tắc 2–100 ký tự từ tab Analysis.
- Thống kê dùng paidAt >= đầu ngày bắt đầu và paidAt < đầu ngày sau ngày kết thúc; loại hóa đơn chưa thanh toán. Tổng doanh thu lấy từ Invoice2.total, giảm dần.
- Giá, thuế và số lượng dòng lấy từ OrderDetail2/PartDetail2; không thay giá lịch sử bằng bảng giá hiện tại. Footer lấy snapshot subTotal/taxTotal/total của Invoice2.
- Login demo dùng xxx / 123456; mật khẩu minh họa lưu theo giá trị mẫu trong SQL, chưa triển khai cơ chế mật khẩu cho môi trường thật.
- Ba loại thống kê còn lại chỉ được thiết kế ở menu, chưa có luồng/lớp DAO chi tiết: giữ tên trong menu và vô hiệu hóa.
- Schema có FK tới Staff2; kiểm tra subtype staff ở nghiệp vụ tạo hóa đơn/nhập kho ngoài phạm vi hai module. Không thêm cột role vào lớp Staff2.
- Bản Docker demo dùng Tomcat 9 / JDK 17 và MySQL 8.4, database garage_management. Sơ đồ 10 còn mô tả Ubuntu 24.04, Nginx/HTTPS; môi trường demo localhost chưa dựng reverse proxy/chứng chỉ, không được xem là đã kiểm chứng toàn bộ sơ đồ triển khai.

## Xác minh ngày 01/11/2026

`build.ps1` hoàn tất và tạo `target/garage-management.war`. 14 test đạt, 0 failure/error:

- Đối chiếu 21 lớp, thuộc tính, quan hệ kế thừa; chữ ký 5 DAO và field con của DAO2.
- Chín JSP thiết kế, đúng id thành phần; thêm một JSP đăng nhập hỗ trợ.
- 13 bảng, 85 cột, 13 FK so với PlantUML.
- Truy vấn tên, ký tự SQL, phân trang, giá lịch sử, subtype và số lượng.
- Dữ liệu thống kê 3/2/1 hóa đơn, doanh thu 6.500.000 / 4.200.000 / 1.800.000; tổng 12.500.000 VND.
- Mốc cuối ngày 31/08; hóa đơn chưa trả và hóa đơn ngoài kỳ bị loại.
- HTTP thực tế trên Tomcat 9: cả hai luồng, Back, login/logout, chặn truy cập khi chưa đăng nhập, chặn lựa chọn ngoài danh sách, ngày sai, escape HTML và lỗi CSDL.
- CSDL kiểm thử tự động là H2 chế độ MySQL. Sau khi sửa bước nạp JDBC driver, đã build lại container và xác minh qua HTTP trên MySQL Docker thật: đăng nhập, tìm hai loại, xem chi tiết hai loại, thống kê, danh sách hóa đơn, chi tiết HD001, đăng xuất và chặn trang cần đăng nhập. Nginx/HTTPS chưa được xác minh.

Cập nhật 03/11/2026: **14 test đạt** với 10 class UI trong JSP. Các kiểm tra HTTP bao phủ action điều hướng, ảnh phụ tùng có/không có đường dẫn, ô chọn ngày dạng ISO, cả hai luồng nghiệp vụ và các trường hợp lỗi; build WAR thành công. Bố cục được đọc lại từ table styles trong tab Design, gồm các tỷ lệ cột, viền đen, tiêu đề và màu xanh #6fa8dc.

