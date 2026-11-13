package vn.edu.garage.model;

import java.time.*;

public class Invoice2 {
    private LocalDateTime createdAt;
    private double subTotal;
    private double taxTotal;
    private double total;
    private LocalDateTime paidAt;
    private String method;
    private String referenceCode;
    private int id;
    private String code;
    private Order2 order;
    private SalesStaff2 salesStaff;

    public Invoice2() { }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public double getSubTotal() { return subTotal; }
    public void setSubTotal(double subTotal) { this.subTotal = subTotal; }

    public double getTaxTotal() { return taxTotal; }
    public void setTaxTotal(double taxTotal) { this.taxTotal = taxTotal; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public LocalDateTime getPaidAt() { return paidAt; }
    public void setPaidAt(LocalDateTime paidAt) { this.paidAt = paidAt; }

    public String getMethod() { return method; }
    public void setMethod(String method) { this.method = method; }

    public String getReferenceCode() { return referenceCode; }
    public void setReferenceCode(String referenceCode) { this.referenceCode = referenceCode; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public Order2 getOrder() { return order; }
    public void setOrder(Order2 order) { this.order = order; }

    public SalesStaff2 getSalesStaff() { return salesStaff; }
    public void setSalesStaff(SalesStaff2 salesStaff) { this.salesStaff = salesStaff; }
}

