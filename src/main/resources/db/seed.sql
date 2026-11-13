-- Dữ liệu minh họa theo mockup trong tab Design, dùng cho database mới.
-- Thông tin không có trong mockup (địa chỉ, mật khẩu, chi tiết HD002-HD006) là dữ liệu demo.
SET NAMES utf8mb4;

INSERT INTO tblStaff2 (id, name, tel, email, username, password, status, role) VALUES
(1, 'Management Staff', 'DEMO-STAFF01', NULL, 'xxx', '123456', 'Active', 'Management Staff'),
(2, 'Staff ABC', 'DEMO-STAFF02', NULL, 'sales', '123456', 'Active', 'Sales Staff');

INSERT INTO tblCustomer2 (id, code, name, tel, email, address) VALUES
(1, 'KH001', 'Khách mẫu KH001', 'DEMO-KH001', NULL, 'Hà Nội'),
(2, 'KH002', 'Khách mẫu KH002', 'DEMO-KH002', NULL, 'Hà Nội'),
(3, 'KH003', 'Khách mẫu KH003', 'DEMO-KH003', NULL, 'Hà Nội');

INSERT INTO tblService2 (id, code, name, description, basePrice, estimatedDuration, tax, status) VALUES
(1, 'SV01', 'Brake Inspection', 'Inspect braking components', 200000, 30, 0.10, 'Available'),
(2, 'SV02', 'Brake Pad Replacement', 'Replace worn brake pads and inspect braking components', 500000, 60, 0.10, 'Available'),
(3, 'SV03', 'Brake System Inspection', 'Inspect the brake system', 300000, 30, 0.10, 'Available');

INSERT INTO tblSparePart2 (id, code, name, img, compatibilityNote, sellingPrice, tax, reorderLevel, status) VALUES
(1, 'PT01', 'Front Brake Pads', NULL, 'Check vehicle compatibility before use', 600000, 0.10, 5, 'Available');

INSERT INTO tblOrder2 (id, receivedAt, vehiclePlate, vehicleBrand, vehicleModel, customerId) VALUES
(1, '2026-08-05 08:00:00', NULL, NULL, NULL, 1),
(2, '2026-08-15 08:00:00', NULL, NULL, NULL, 1),
(3, '2026-08-26 08:00:00', NULL, NULL, NULL, 1),
(4, '2026-08-10 08:00:00', NULL, NULL, NULL, 2),
(5, '2026-08-20 08:00:00', NULL, NULL, NULL, 2),
(6, '2026-08-31 08:00:00', NULL, NULL, NULL, 3);

INSERT INTO tblOrderDetail2 (id, appliedTax, unitPrice, orderId) VALUES
(1, 0.10, 500000, 1), (2, 0.10, 600000, 1), (3, 0.10, 300000, 1),
(4, 0.10, 1500000, 2), (5, 0.06, 2500000, 3),
(6, 0.10, 2000000, 4), (7, 0.00, 2000000, 5), (8, 0.00, 1800000, 6);

INSERT INTO tblServiceDetail2 (orderDetailId, description, status, serviceId, technicalStaffId) VALUES
(1, 'Brake Pad Replacement', 'Completed', 2, NULL),
(3, 'Brake System Inspection', 'Completed', 3, NULL),
(4, 'Demo detail for HD002', 'Completed', 2, NULL),
(5, 'Demo detail for HD003', 'Completed', 2, NULL),
(6, 'Demo detail for HD004', 'Completed', 2, NULL),
(7, 'Demo detail for HD005', 'Completed', 2, NULL),
(8, 'Demo detail for HD006', 'Completed', 2, NULL);

INSERT INTO tblPartDetail2 (orderDetailId, quantity, sparePartId) VALUES (2, 2, 1);

INSERT INTO tblInvoice2 (id, code, createdAt, subTotal, taxTotal, total, paidAt, method, referenceCode, orderId, salesStaffId) VALUES
(1, 'HD001', '2026-08-05 10:00:00', 2000000, 200000, 2200000, '2026-08-05 10:30:00', 'Bank Transfer', 'TT001', 1, 2),
(2, 'HD002', '2026-08-15 10:00:00', 1500000, 150000, 1650000, '2026-08-15 10:30:00', 'Cash', NULL, 2, 2),
(3, 'HD003', '2026-08-26 10:00:00', 2500000, 150000, 2650000, '2026-08-26 10:30:00', 'Cash', NULL, 3, 2),
(4, 'HD004', '2026-08-10 10:00:00', 2000000, 200000, 2200000, '2026-08-10 10:30:00', 'Cash', NULL, 4, 2),
(5, 'HD005', '2026-08-20 10:00:00', 2000000, 0, 2000000, '2026-08-20 10:30:00', 'Cash', NULL, 5, 2),
(6, 'HD006', '2026-08-31 10:00:00', 1800000, 0, 1800000, '2026-08-31 23:59:59', 'Cash', NULL, 6, 2);
