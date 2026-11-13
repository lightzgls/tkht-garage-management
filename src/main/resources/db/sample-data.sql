-- Dữ liệu mẫu bổ sung cho hai module, sau schema.sql và seed.sql.
-- Chỉ thêm mã chưa có; chạy lại không ghi đè hoặc tạo trùng.
-- Các khách hàng, thông tin liên hệ và giao dịch dưới đây là dữ liệu giả lập.
SET NAMES utf8mb4;
START TRANSACTION;

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV04', 'Engine Oil Change', 'Dịch vụ mẫu: Engine Oil Change. Kiểm tra và thực hiện theo tình trạng xe.', 180000, 30, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV04');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV05', 'Oil Filter Replacement', 'Dịch vụ mẫu: Oil Filter Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 100000, 20, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV05');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV06', 'Wheel Alignment', 'Dịch vụ mẫu: Wheel Alignment. Kiểm tra và thực hiện theo tình trạng xe.', 350000, 60, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV06');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV07', 'Tire Rotation', 'Dịch vụ mẫu: Tire Rotation. Kiểm tra và thực hiện theo tình trạng xe.', 150000, 30, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV07');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV08', 'Battery Check', 'Dịch vụ mẫu: Battery Check. Kiểm tra và thực hiện theo tình trạng xe.', 100000, 20, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV08');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV09', 'Battery Replacement', 'Dịch vụ mẫu: Battery Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 150000, 30, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV09');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV10', 'Air Conditioning Inspection', 'Dịch vụ mẫu: Air Conditioning Inspection. Kiểm tra và thực hiện theo tình trạng xe.', 250000, 45, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV10');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV11', 'Air Filter Replacement', 'Dịch vụ mẫu: Air Filter Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 80000, 15, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV11');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV12', 'Cabin Filter Replacement', 'Dịch vụ mẫu: Cabin Filter Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 80000, 15, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV12');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV13', 'Spark Plug Replacement', 'Dịch vụ mẫu: Spark Plug Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 200000, 45, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV13');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV14', 'Coolant Replacement', 'Dịch vụ mẫu: Coolant Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 250000, 45, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV14');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV15', 'Transmission Inspection', 'Dịch vụ mẫu: Transmission Inspection. Kiểm tra và thực hiện theo tình trạng xe.', 300000, 60, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV15');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV16', 'Suspension Inspection', 'Dịch vụ mẫu: Suspension Inspection. Kiểm tra và thực hiện theo tình trạng xe.', 200000, 45, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV16');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV17', 'Engine Diagnostics', 'Dịch vụ mẫu: Engine Diagnostics. Kiểm tra và thực hiện theo tình trạng xe.', 300000, 45, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV17');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV18', 'Headlight Adjustment', 'Dịch vụ mẫu: Headlight Adjustment. Kiểm tra và thực hiện theo tình trạng xe.', 100000, 20, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV18');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV19', 'Wiper Blade Replacement', 'Dịch vụ mẫu: Wiper Blade Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 50000, 15, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV19');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV20', 'Exhaust Inspection', 'Dịch vụ mẫu: Exhaust Inspection. Kiểm tra và thực hiện theo tình trạng xe.', 150000, 30, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV20');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV21', 'Fuel System Cleaning', 'Dịch vụ mẫu: Fuel System Cleaning. Kiểm tra và thực hiện theo tình trạng xe.', 450000, 60, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV21');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV22', 'Timing Belt Replacement', 'Dịch vụ mẫu: Timing Belt Replacement. Kiểm tra và thực hiện theo tình trạng xe.', 1200000, 180, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV22');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV23', 'Power Steering Inspection', 'Dịch vụ mẫu: Power Steering Inspection. Kiểm tra và thực hiện theo tình trạng xe.', 200000, 45, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV23');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV24', 'Kiểm tra lốp xe', 'Dịch vụ mẫu: Kiểm tra lốp xe. Kiểm tra và thực hiện theo tình trạng xe.', 100000, 20, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV24');

INSERT INTO tblService2 (code, name, description, basePrice, estimatedDuration, tax, status)
SELECT 'SV25', 'Vệ sinh khoang máy', 'Dịch vụ mẫu: Vệ sinh khoang máy. Kiểm tra và thực hiện theo tình trạng xe.', 400000, 60, 0.10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblService2 WHERE code = 'SV25');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT02', 'Rear Brake Pads', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 550000, 0.10, 5, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT02');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT03', 'Engine Oil 5W-30', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 350000, 0.10, 10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT03');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT04', 'Oil Filter', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 120000, 0.10, 15, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT04');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT05', 'Engine Air Filter', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 180000, 0.10, 20, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT05');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT06', 'Cabin Air Filter', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 150000, 0.10, 5, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT06');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT07', 'Spark Plug', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 180000, 0.10, 10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT07');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT08', 'Battery 12V 60Ah', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 1800000, 0.10, 15, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT08');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT09', 'Coolant 1L', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 120000, 0.10, 20, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT09');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT10', 'Wiper Blade', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 200000, 0.10, 5, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT10');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT11', 'Headlight Bulb H7', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 150000, 0.10, 10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT11');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT12', 'Front Shock Absorber', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 1200000, 0.10, 15, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT12');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT13', 'Rear Shock Absorber', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 900000, 0.10, 20, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT13');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT14', 'Timing Belt', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 650000, 0.10, 5, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT14');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT15', 'Drive Belt', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 300000, 0.10, 10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT15');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT16', 'Fuel Filter', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 220000, 0.10, 15, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT16');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT17', 'Brake Fluid DOT4', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 180000, 0.10, 20, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT17');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT18', 'Radiator Hose', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 250000, 0.10, 5, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT18');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT19', 'Thermostat', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 400000, 0.10, 10, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT19');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT20', 'Wheel Bearing', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 650000, 0.10, 15, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT20');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT21', 'Cảm biến áp suất lốp', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 550000, 0.10, 20, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT21');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT22', 'Lọc dầu hộp số', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 350000, 0.10, 5, 'Available'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT22');

INSERT INTO tblSparePart2 (code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status)
SELECT 'PT23', 'Gioăng nắp máy', NULL, 'Phụ tùng mẫu; kiểm tra mã phụ tùng và thông số xe trước khi sử dụng.', 750000, 0.10, 10, 'Unavailable'
WHERE NOT EXISTS (SELECT 1 FROM tblSparePart2 WHERE code = 'PT23');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH004', 'Khách mẫu KH004', 'DEMO-KH004', 'kh004@example.com', 'Hà Nội'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH004');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH005', 'Khách mẫu KH005', 'DEMO-KH005', 'kh005@example.com', 'Đà Nẵng'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH005');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH006', 'Khách mẫu KH006', 'DEMO-KH006', 'kh006@example.com', 'TP. Hồ Chí Minh'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH006');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH007', 'Khách mẫu KH007', 'DEMO-KH007', 'kh007@example.com', 'Hà Nội'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH007');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH008', 'Khách mẫu KH008', 'DEMO-KH008', 'kh008@example.com', 'Đà Nẵng'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH008');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH009', 'Khách mẫu KH009', 'DEMO-KH009', 'kh009@example.com', 'TP. Hồ Chí Minh'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH009');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH010', 'Khách mẫu KH010', 'DEMO-KH010', 'kh010@example.com', 'Hà Nội'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH010');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH011', 'Khách mẫu KH011', 'DEMO-KH011', 'kh011@example.com', 'Đà Nẵng'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH011');

INSERT INTO tblCustomer2 (code, name, tel, email, address)
SELECT 'KH012', 'Khách mẫu KH012', 'DEMO-KH012', 'kh012@example.com', 'TP. Hồ Chí Minh'
WHERE NOT EXISTS (SELECT 1 FROM tblCustomer2 WHERE code = 'KH012');

-- Giá và thuế được chụp vào OrderDetail2 và Invoice2 tại lúc thêm dữ liệu.
-- Hóa đơn đã có được bỏ qua toàn bộ, bao gồm cả các dòng chi tiết.

-- HD007: KH001, 2026-09-01
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD007');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-01 09:00:00', 'DEMO-0001', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH001' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV04' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV04' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD007', '2026-09-01 09:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-09-01 10:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV04' AND p.code = 'PT02' AND staff.username = 'sales' AND @addInvoice;

-- HD008: KH002, 2026-09-03
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD008');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-03 10:00:00', 'DEMO-0002', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH002' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV09' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV09' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD008', '2026-09-03 10:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-09-03 11:30:00', 'Bank Transfer', 'DEMO-HD008', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV09' AND p.code = 'PT05' AND staff.username = 'sales' AND @addInvoice;

-- HD009: KH003, 2026-09-05
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD009');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-05 11:00:00', 'DEMO-0003', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH003' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV14' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV14' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD009', '2026-09-05 11:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-09-05 12:30:00', 'Card', 'DEMO-HD009', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV14' AND p.code = 'PT08' AND staff.username = 'sales' AND @addInvoice;

-- HD010: KH004, 2026-09-07
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD010');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-07 12:00:00', 'DEMO-0004', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH004' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV19' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV19' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD010', '2026-09-07 12:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-09-07 13:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV19' AND p.code = 'PT11' AND staff.username = 'sales' AND @addInvoice;

-- HD011: KH005, 2026-09-09
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD011');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-09 13:00:00', 'DEMO-0005', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH005' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV24' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV24' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD011', '2026-09-09 13:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-09-09 14:30:00', 'Bank Transfer', 'DEMO-HD011', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV24' AND p.code = 'PT14' AND staff.username = 'sales' AND @addInvoice;

-- HD012: KH006, 2026-09-11
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD012');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-11 14:00:00', 'DEMO-0006', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH006' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV07' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV07' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD012', '2026-09-11 14:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-09-11 15:30:00', 'Card', 'DEMO-HD012', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV07' AND p.code = 'PT17' AND staff.username = 'sales' AND @addInvoice;

-- HD013: KH007, 2026-09-13
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD013');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-13 15:00:00', 'DEMO-0007', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH007' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV12' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV12' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD013', '2026-09-13 15:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-09-13 16:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV12' AND p.code = 'PT20' AND staff.username = 'sales' AND @addInvoice;

-- HD014: KH008, 2026-09-15
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD014');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-15 09:00:00', 'DEMO-0008', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH008' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV17' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV17' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD014', '2026-09-15 09:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-09-15 10:30:00', 'Bank Transfer', 'DEMO-HD014', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV17' AND p.code = 'PT02' AND staff.username = 'sales' AND @addInvoice;

-- HD015: KH009, 2026-09-17
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD015');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-17 10:00:00', 'DEMO-0009', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH009' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV22' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV22' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD015', '2026-09-17 10:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-09-17 11:30:00', 'Card', 'DEMO-HD015', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV22' AND p.code = 'PT05' AND staff.username = 'sales' AND @addInvoice;

-- HD016: KH010, 2026-09-19
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD016');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-19 11:00:00', 'DEMO-0010', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH010' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV05' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV05' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD016', '2026-09-19 11:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-09-19 12:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV05' AND p.code = 'PT08' AND staff.username = 'sales' AND @addInvoice;

-- HD017: KH011, 2026-09-21
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD017');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-21 12:00:00', 'DEMO-0011', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH011' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV10' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV10' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD017', '2026-09-21 12:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-09-21 13:30:00', 'Bank Transfer', 'DEMO-HD017', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV10' AND p.code = 'PT11' AND staff.username = 'sales' AND @addInvoice;

-- HD018: KH012, 2026-09-23
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD018');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-09-23 13:00:00', 'DEMO-0012', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH012' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV15' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV15' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD018', '2026-09-23 13:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-09-23 14:30:00', 'Card', 'DEMO-HD018', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV15' AND p.code = 'PT14' AND staff.username = 'sales' AND @addInvoice;

-- HD019: KH001, 2026-10-02
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD019');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-02 14:00:00', 'DEMO-0013', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH001' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV20' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV20' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD019', '2026-10-02 14:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-10-02 15:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV20' AND p.code = 'PT17' AND staff.username = 'sales' AND @addInvoice;

-- HD020: KH002, 2026-10-04
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD020');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-04 15:00:00', 'DEMO-0014', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH002' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV25' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV25' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD020', '2026-10-04 15:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-10-04 16:30:00', 'Bank Transfer', 'DEMO-HD020', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV25' AND p.code = 'PT20' AND staff.username = 'sales' AND @addInvoice;

-- HD021: KH003, 2026-10-06
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD021');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-06 09:00:00', 'DEMO-0015', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH003' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV08' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV08' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD021', '2026-10-06 09:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-10-06 10:30:00', 'Card', 'DEMO-HD021', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV08' AND p.code = 'PT02' AND staff.username = 'sales' AND @addInvoice;

-- HD022: KH004, 2026-10-08
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD022');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-08 10:00:00', 'DEMO-0016', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH004' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV13' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV13' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD022', '2026-10-08 10:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-10-08 11:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV13' AND p.code = 'PT05' AND staff.username = 'sales' AND @addInvoice;

-- HD023: KH005, 2026-10-10
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD023');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-10 11:00:00', 'DEMO-0017', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH005' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV18' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV18' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD023', '2026-10-10 11:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-10-10 12:30:00', 'Bank Transfer', 'DEMO-HD023', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV18' AND p.code = 'PT08' AND staff.username = 'sales' AND @addInvoice;

-- HD024: KH006, 2026-10-12
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD024');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-12 12:00:00', 'DEMO-0018', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH006' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV23' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV23' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD024', '2026-10-12 12:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-10-12 13:30:00', 'Card', 'DEMO-HD024', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV23' AND p.code = 'PT11' AND staff.username = 'sales' AND @addInvoice;

-- HD025: KH007, 2026-10-14
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD025');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-14 13:00:00', 'DEMO-0019', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH007' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV06' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV06' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD025', '2026-10-14 13:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-10-14 14:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV06' AND p.code = 'PT14' AND staff.username = 'sales' AND @addInvoice;

-- HD026: KH008, 2026-10-16
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD026');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-16 14:00:00', 'DEMO-0020', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH008' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV11' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV11' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD026', '2026-10-16 14:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-10-16 15:30:00', 'Bank Transfer', 'DEMO-HD026', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV11' AND p.code = 'PT17' AND staff.username = 'sales' AND @addInvoice;

-- HD027: KH009, 2026-10-18
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD027');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-18 15:00:00', 'DEMO-0021', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH009' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV16' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV16' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD027', '2026-10-18 15:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-10-18 16:30:00', 'Card', 'DEMO-HD027', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV16' AND p.code = 'PT20' AND staff.username = 'sales' AND @addInvoice;

-- HD028: KH010, 2026-10-20
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD028');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-20 09:00:00', 'DEMO-0022', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH010' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV21' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV21' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD028', '2026-10-20 09:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-10-20 10:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV21' AND p.code = 'PT02' AND staff.username = 'sales' AND @addInvoice;

-- HD029: KH011, 2026-10-22
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD029');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-22 10:00:00', 'DEMO-0023', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH011' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV04' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV04' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD029', '2026-10-22 10:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-10-22 11:30:00', 'Bank Transfer', 'DEMO-HD029', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV04' AND p.code = 'PT05' AND staff.username = 'sales' AND @addInvoice;

-- HD030: KH012, 2026-10-24
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD030');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-24 11:00:00', 'DEMO-0024', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH012' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV09' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV09' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD030', '2026-10-24 11:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-10-24 12:30:00', 'Card', 'DEMO-HD030', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV09' AND p.code = 'PT08' AND staff.username = 'sales' AND @addInvoice;

-- HD031: KH001, 2026-10-27
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD031');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-27 12:00:00', 'DEMO-0025', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH001' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV14' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV14' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD031', '2026-10-27 12:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-10-27 13:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV14' AND p.code = 'PT11' AND staff.username = 'sales' AND @addInvoice;

-- HD032: KH002, 2026-10-28
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD032');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-28 13:00:00', 'DEMO-0026', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH002' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV19' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV19' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD032', '2026-10-28 13:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-10-28 14:30:00', 'Bank Transfer', 'DEMO-HD032', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV19' AND p.code = 'PT14' AND staff.username = 'sales' AND @addInvoice;

-- HD033: KH003, 2026-10-29
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD033');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-29 14:00:00', 'DEMO-0027', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH003' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV24' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV24' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD033', '2026-10-29 14:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-10-29 15:30:00', 'Card', 'DEMO-HD033', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV24' AND p.code = 'PT17' AND staff.username = 'sales' AND @addInvoice;

-- HD034: KH004, 2026-10-30
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD034');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-30 15:00:00', 'DEMO-0028', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH004' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV07' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV07' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD034', '2026-10-30 15:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-10-30 16:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV07' AND p.code = 'PT20' AND staff.username = 'sales' AND @addInvoice;

-- HD035: KH005, 2026-10-31
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD035');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-31 09:00:00', 'DEMO-0029', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH005' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV12' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV12' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD035', '2026-10-31 09:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-10-31 10:30:00', 'Bank Transfer', 'DEMO-HD035', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV12' AND p.code = 'PT02' AND staff.username = 'sales' AND @addInvoice;

-- HD036: KH006, 2026-10-27
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD036');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-27 10:00:00', 'DEMO-0030', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH006' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV17' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV17' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD036', '2026-10-27 10:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-10-27 11:30:00', 'Card', 'DEMO-HD036', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV17' AND p.code = 'PT05' AND staff.username = 'sales' AND @addInvoice;

-- HD037: KH007, 2026-10-28
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD037');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-28 11:00:00', 'DEMO-0031', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH007' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV22' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV22' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD037', '2026-10-28 11:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-10-28 12:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV22' AND p.code = 'PT08' AND staff.username = 'sales' AND @addInvoice;

-- HD038: KH008, 2026-10-29
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD038');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-10-29 12:00:00', 'DEMO-0032', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH008' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV05' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV05' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD038', '2026-10-29 12:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-10-29 13:30:00', 'Bank Transfer', 'DEMO-HD038', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV05' AND p.code = 'PT11' AND staff.username = 'sales' AND @addInvoice;

-- HD039: KH009, 2026-11-01
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD039');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-11-01 13:00:00', 'DEMO-0033', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH009' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV10' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV10' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT14' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD039', '2026-11-01 13:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-11-01 14:30:00', 'Card', 'DEMO-HD039', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV10' AND p.code = 'PT14' AND staff.username = 'sales' AND @addInvoice;

-- HD040: KH010, 2026-11-01
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD040');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-11-01 14:00:00', 'DEMO-0034', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH010' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV15' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV15' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT17' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD040', '2026-11-01 14:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       '2026-11-01 15:30:00', 'Cash', NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV15' AND p.code = 'PT17' AND staff.username = 'sales' AND @addInvoice;

-- HD041: KH011, 2026-11-01
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD041');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-11-01 15:00:00', 'DEMO-0035', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH011' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV20' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV20' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT20' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD041', '2026-11-01 15:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       '2026-11-01 16:30:00', 'Bank Transfer', 'DEMO-HD041', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV20' AND p.code = 'PT20' AND staff.username = 'sales' AND @addInvoice;

-- HD042: KH012, 2026-11-01
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD042');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-11-01 09:00:00', 'DEMO-0036', 'Hyundai', 'Accent', id
FROM tblCustomer2 WHERE code = 'KH012' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV25' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV25' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT02' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD042', '2026-11-01 09:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       '2026-11-01 10:30:00', 'Card', 'DEMO-HD042', @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV25' AND p.code = 'PT02' AND staff.username = 'sales' AND @addInvoice;

-- HD043: KH001, 2026-11-01 (chưa thanh toán)
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD043');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-11-01 10:00:00', 'DEMO-0037', 'Toyota', 'Vios', id
FROM tblCustomer2 WHERE code = 'KH001' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV08' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV08' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 1, id FROM tblSparePart2 WHERE code = 'PT05' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD043', '2026-11-01 10:00:00', (s.basePrice + 1 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)), (s.basePrice + 1 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(1 * p.sellingPrice * p.tax, 2)),
       NULL, NULL, NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV08' AND p.code = 'PT05' AND staff.username = 'sales' AND @addInvoice;

-- HD044: KH002, 2026-11-01 (chưa thanh toán)
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD044');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-11-01 11:00:00', 'DEMO-0038', 'Honda', 'City', id
FROM tblCustomer2 WHERE code = 'KH002' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV13' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV13' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 2, id FROM tblSparePart2 WHERE code = 'PT08' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD044', '2026-11-01 11:00:00', (s.basePrice + 2 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)), (s.basePrice + 2 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(2 * p.sellingPrice * p.tax, 2)),
       NULL, NULL, NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV13' AND p.code = 'PT08' AND staff.username = 'sales' AND @addInvoice;

-- HD045: KH003, 2026-11-01 (chưa thanh toán)
SET @addInvoice = NOT EXISTS (SELECT 1 FROM tblInvoice2 WHERE code = 'HD045');
INSERT INTO tblOrder2 (receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId)
SELECT '2026-11-01 12:00:00', 'DEMO-0039', 'Mazda', 'Mazda 3', id
FROM tblCustomer2 WHERE code = 'KH003' AND @addInvoice;
SET @orderId = LAST_INSERT_ID();
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, basePrice, @orderId FROM tblService2 WHERE code = 'SV18' AND @addInvoice;
SET @serviceDetailId = LAST_INSERT_ID();
INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId)
SELECT @serviceDetailId, name, 'Completed', id, NULL FROM tblService2 WHERE code = 'SV18' AND @addInvoice;
INSERT INTO tblOrderDetail2 (appliedTax, unitPrice, orderId)
SELECT tax, sellingPrice, @orderId FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
SET @partDetailId = LAST_INSERT_ID();
INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId)
SELECT @partDetailId, 3, id FROM tblSparePart2 WHERE code = 'PT11' AND @addInvoice;
INSERT INTO tblInvoice2 (code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId)
SELECT 'HD045', '2026-11-01 12:00:00', (s.basePrice + 3 * p.sellingPrice), (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)), (s.basePrice + 3 * p.sellingPrice) + (ROUND(s.basePrice * s.tax, 2) + ROUND(3 * p.sellingPrice * p.tax, 2)),
       NULL, NULL, NULL, @orderId, staff.id
FROM tblService2 s CROSS JOIN tblSparePart2 p CROSS JOIN tblStaff2 staff
WHERE s.code = 'SV18' AND p.code = 'PT11' AND staff.username = 'sales' AND @addInvoice;

COMMIT;
