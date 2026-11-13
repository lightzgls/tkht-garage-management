package vn.edu.garage.model;


public class Service2 {
    private int id;
    private String code;
    private String name;
    private String description;
    private double basePrice;
    private int estimatedDuration;
    private double tax;
    private String status;

    public Service2() { }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getBasePrice() { return basePrice; }
    public void setBasePrice(double basePrice) { this.basePrice = basePrice; }

    public int getEstimatedDuration() { return estimatedDuration; }
    public void setEstimatedDuration(int estimatedDuration) { this.estimatedDuration = estimatedDuration; }

    public double getTax() { return tax; }
    public void setTax(double tax) { this.tax = tax; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}

