package vn.edu.garage.model;

import java.time.*;

public class CustomerStatistics2 extends Customer2 {
    private int totalInvoice;
    private double totalRevenue;
    private LocalDate startDate;
    private LocalDate endDate;

    public CustomerStatistics2() { }

    public int getTotalInvoice() { return totalInvoice; }
    public void setTotalInvoice(int totalInvoice) { this.totalInvoice = totalInvoice; }

    public double getTotalRevenue() { return totalRevenue; }
    public void setTotalRevenue(double totalRevenue) { this.totalRevenue = totalRevenue; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }
}

