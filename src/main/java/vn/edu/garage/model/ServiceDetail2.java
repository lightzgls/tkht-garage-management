package vn.edu.garage.model;


public class ServiceDetail2 extends OrderDetail2 {
    private String description;
    private String status;
    private TechnicalStaff2 technicalStaff;
    private Service2 service;

    public ServiceDetail2() { }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public TechnicalStaff2 getTechnicalStaff() { return technicalStaff; }
    public void setTechnicalStaff(TechnicalStaff2 technicalStaff) { this.technicalStaff = technicalStaff; }

    public Service2 getService() { return service; }
    public void setService(Service2 service) { this.service = service; }
}

