package vn.edu.garage.model;


public class PartDetail2 extends OrderDetail2 {
    private int quantity;
    private SparePart2 sparePart;

    public PartDetail2() { }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public SparePart2 getSparePart() { return sparePart; }
    public void setSparePart(SparePart2 sparePart) { this.sparePart = sparePart; }
}

