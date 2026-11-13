package vn.edu.garage.model;


public class SparePart2 {
    private String name;
    private String img;
    private String compatibilityNote;
    private double sellingPrice;
    private double tax;
    private int reorderLevel;
    private String status;
    private String code;
    private int id;

    public SparePart2() { }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getImg() { return img; }
    public void setImg(String img) { this.img = img; }

    public String getCompatibilityNote() { return compatibilityNote; }
    public void setCompatibilityNote(String compatibilityNote) { this.compatibilityNote = compatibilityNote; }

    public double getSellingPrice() { return sellingPrice; }
    public void setSellingPrice(double sellingPrice) { this.sellingPrice = sellingPrice; }

    public double getTax() { return tax; }
    public void setTax(double tax) { this.tax = tax; }

    public int getReorderLevel() { return reorderLevel; }
    public void setReorderLevel(int reorderLevel) { this.reorderLevel = reorderLevel; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
}

