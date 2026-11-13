package vn.edu.garage.model;

import java.time.*;
import java.util.List;

public class Order2 {
    private LocalDateTime receivedAt;
    private String vehiclePlate;
    private String vehicleBrand;
    private String vehicleModel;
    private int id;
    private List<OrderDetail2> orderDetails;
    private Customer2 customer;

    public Order2() { }

    public LocalDateTime getReceivedAt() { return receivedAt; }
    public void setReceivedAt(LocalDateTime receivedAt) { this.receivedAt = receivedAt; }

    public String getVehiclePlate() { return vehiclePlate; }
    public void setVehiclePlate(String vehiclePlate) { this.vehiclePlate = vehiclePlate; }

    public String getVehicleBrand() { return vehicleBrand; }
    public void setVehicleBrand(String vehicleBrand) { this.vehicleBrand = vehicleBrand; }

    public String getVehicleModel() { return vehicleModel; }
    public void setVehicleModel(String vehicleModel) { this.vehicleModel = vehicleModel; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public List<OrderDetail2> getOrderDetails() { return orderDetails; }
    public void setOrderDetails(List<OrderDetail2> orderDetails) { this.orderDetails = orderDetails; }

    public Customer2 getCustomer() { return customer; }
    public void setCustomer(Customer2 customer) { this.customer = customer; }
}

