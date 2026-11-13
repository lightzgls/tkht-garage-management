package vn.edu.garage.model;

import java.time.*;
import java.util.List;

public class PartsReceipt2 {
    private LocalDateTime receivedAt;
    private int id;
    private WarehouseStaff2 warehouseStaff;
    private Supplier2 supplier;
    private List<PartsReceiptDetail2> partReceiptDetails;

    public PartsReceipt2() { }

    public LocalDateTime getReceivedAt() { return receivedAt; }
    public void setReceivedAt(LocalDateTime receivedAt) { this.receivedAt = receivedAt; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public WarehouseStaff2 getWarehouseStaff() { return warehouseStaff; }
    public void setWarehouseStaff(WarehouseStaff2 warehouseStaff) { this.warehouseStaff = warehouseStaff; }

    public Supplier2 getSupplier() { return supplier; }
    public void setSupplier(Supplier2 supplier) { this.supplier = supplier; }

    public List<PartsReceiptDetail2> getPartReceiptDetails() { return partReceiptDetails; }
    public void setPartReceiptDetails(List<PartsReceiptDetail2> partReceiptDetails) { this.partReceiptDetails = partReceiptDetails; }
}

