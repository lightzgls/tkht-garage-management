package vn.edu.garage.model;

import java.time.*;

public class SparePartStatistic2 extends SparePart2 {
    private LocalDate startDate;
    private LocalDate endDate;

    public SparePartStatistic2() { }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }
}

