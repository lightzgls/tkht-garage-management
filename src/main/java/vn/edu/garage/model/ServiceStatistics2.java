package vn.edu.garage.model;

import java.time.*;

public class ServiceStatistics2 extends Service2 {
    private LocalDate startDate;
    private LocalDate endDate;

    public ServiceStatistics2() { }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }
}

