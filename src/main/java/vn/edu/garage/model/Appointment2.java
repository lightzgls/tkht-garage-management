package vn.edu.garage.model;

import java.time.*;

public class Appointment2 {
    private int id;
    private LocalDateTime appointmentTime;
    private String note;
    private String status;
    private String contactName;
    private String contactTel;
    private String vehiclePlate;
    private String vehicleBrand;
    private String vehicleModel;

    public Appointment2() { }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public LocalDateTime getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(LocalDateTime appointmentTime) { this.appointmentTime = appointmentTime; }

    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getContactName() { return contactName; }
    public void setContactName(String contactName) { this.contactName = contactName; }

    public String getContactTel() { return contactTel; }
    public void setContactTel(String contactTel) { this.contactTel = contactTel; }

    public String getVehiclePlate() { return vehiclePlate; }
    public void setVehiclePlate(String vehiclePlate) { this.vehiclePlate = vehiclePlate; }

    public String getVehicleBrand() { return vehicleBrand; }
    public void setVehicleBrand(String vehicleBrand) { this.vehicleBrand = vehicleBrand; }

    public String getVehicleModel() { return vehicleModel; }
    public void setVehicleModel(String vehicleModel) { this.vehicleModel = vehicleModel; }
}

