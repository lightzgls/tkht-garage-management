-- Nguồn: PlantUML - Design / 02 Database Diagram, đọc ngày 01/11/2026.
-- Chạy trên database mới; không tự sửa hoặc xóa database cũ.

CREATE TABLE IF NOT EXISTS tblStaff2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    tel VARCHAR(30) NOT NULL,
    email VARCHAR(255) NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL,
    role VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblCustomer2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    tel VARCHAR(30) NOT NULL,
    email VARCHAR(255) NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblSupplier2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    taxCode VARCHAR(50) NOT NULL UNIQUE,
    tel VARCHAR(30) NOT NULL,
    email VARCHAR(255) NULL,
    address VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblService2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(2000) NULL,
    basePrice DECIMAL(18, 2) NOT NULL,
    estimatedDuration INT NOT NULL,
    tax DECIMAL(5, 2) NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblSparePart2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    img VARCHAR(1000) NULL,
    compatibilityNote VARCHAR(2000) NULL,
    sellingPrice DECIMAL(18, 2) NOT NULL,
    tax DECIMAL(5, 2) NOT NULL,
    reorderLevel INT NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblAppointment2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contactName VARCHAR(255) NOT NULL,
    contactTel VARCHAR(30) NOT NULL,
    vehiclePlate VARCHAR(30) NOT NULL,
    vehicleBrand VARCHAR(100) NOT NULL,
    vehicleModel VARCHAR(100) NOT NULL,
    appointmentTime TIMESTAMP NOT NULL,
    note VARCHAR(2000) NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblOrder2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    receivedAt TIMESTAMP NOT NULL,
    vehiclePlate VARCHAR(30) NULL,
    vehicleBrand VARCHAR(100) NULL,
    vehicleModel VARCHAR(100) NULL,
    customerId INT NOT NULL,
    CONSTRAINT fk_tblOrder2_customerId FOREIGN KEY (customerId) REFERENCES tblCustomer2(id)
);

CREATE TABLE IF NOT EXISTS tblOrderDetail2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    appliedTax DECIMAL(5, 2) NOT NULL,
    unitPrice DECIMAL(18, 2) NOT NULL,
    orderId INT NOT NULL,
    CONSTRAINT fk_tblOrderDetail2_orderId FOREIGN KEY (orderId) REFERENCES tblOrder2(id)
);

CREATE TABLE IF NOT EXISTS tblServiceDetail2 (
    orderDetailId INT NOT NULL PRIMARY KEY,
    description VARCHAR(2000) NULL,
    status VARCHAR(30) NOT NULL,
    serviceId INT NOT NULL,
    technicalStaffId INT NULL,
    CONSTRAINT fk_tblServiceDetail2_serviceId FOREIGN KEY (serviceId) REFERENCES tblService2(id),
    CONSTRAINT fk_tblServiceDetail2_technicalStaffId FOREIGN KEY (technicalStaffId) REFERENCES tblStaff2(id),
    CONSTRAINT fk_tblServiceDetail2_orderDetailId FOREIGN KEY (orderDetailId) REFERENCES tblOrderDetail2(id)
);

CREATE TABLE IF NOT EXISTS tblPartDetail2 (
    orderDetailId INT NOT NULL PRIMARY KEY,
    quantity INT NOT NULL,
    sparePartId INT NOT NULL,
    CONSTRAINT fk_tblPartDetail2_sparePartId FOREIGN KEY (sparePartId) REFERENCES tblSparePart2(id),
    CONSTRAINT fk_tblPartDetail2_orderDetailId FOREIGN KEY (orderDetailId) REFERENCES tblOrderDetail2(id)
);

CREATE TABLE IF NOT EXISTS tblPartsReceipt2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    receivedAt TIMESTAMP NOT NULL,
    supplierId INT NOT NULL,
    warehouseStaffId INT NOT NULL,
    CONSTRAINT fk_tblPartsReceipt2_supplierId FOREIGN KEY (supplierId) REFERENCES tblSupplier2(id),
    CONSTRAINT fk_tblPartsReceipt2_warehouseStaffId FOREIGN KEY (warehouseStaffId) REFERENCES tblStaff2(id)
);

CREATE TABLE IF NOT EXISTS tblPartsReceiptDetail2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,
    unitPrice DECIMAL(18, 2) NOT NULL,
    partsReceiptId INT NOT NULL,
    sparePartId INT NOT NULL,
    CONSTRAINT fk_tblPartsReceiptDetail2_partsReceiptId FOREIGN KEY (partsReceiptId) REFERENCES tblPartsReceipt2(id),
    CONSTRAINT fk_tblPartsReceiptDetail2_sparePartId FOREIGN KEY (sparePartId) REFERENCES tblSparePart2(id)
);

CREATE TABLE IF NOT EXISTS tblInvoice2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    createdAt TIMESTAMP NOT NULL,
    subTotal DECIMAL(18, 2) NOT NULL,
    taxTotal DECIMAL(18, 2) NOT NULL,
    total DECIMAL(18, 2) NOT NULL,
    paidAt TIMESTAMP NULL,
    method VARCHAR(50) NULL,
    referenceCode VARCHAR(100) NULL,
    orderId INT NOT NULL UNIQUE,
    salesStaffId INT NOT NULL,
    CONSTRAINT fk_tblInvoice2_orderId FOREIGN KEY (orderId) REFERENCES tblOrder2(id),
    CONSTRAINT fk_tblInvoice2_salesStaffId FOREIGN KEY (salesStaffId) REFERENCES tblStaff2(id)
);


