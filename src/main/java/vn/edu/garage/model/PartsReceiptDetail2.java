package vn.edu.garage.model;


public class PartsReceiptDetail2 {
    private int quantity;
    private double unitPrice;
    private int id;
    private SparePart2 sparePart;

    public PartsReceiptDetail2() { }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public SparePart2 getSparePart() { return sparePart; }
    public void setSparePart(SparePart2 sparePart) { this.sparePart = sparePart; }
}

