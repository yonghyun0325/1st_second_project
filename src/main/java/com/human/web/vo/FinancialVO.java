package com.human.web.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinancialVO {
    private int e_idx;
    private double baseSalary;
    private double positionAllowance;
    private double tenureAllowance;
    private double fixedAllowance;
    private double dailyAttendanceAllowance;
    private double mealAllowance;
    private double overtimeAllowance;
    private double nightAllowance;
    private double holidayAllowance;          
    private double holidayNightAllowance;     
    private double holidayExtendedAllowance;  
    private double maternityCare;             
    private double selfDrivingAllowance;      
    private double extendedWorkAllowance;
    private double projectBonus;
    private double performanceBonus;
    private double teamBonus;
    private double workPerformanceBonus;
    private double incomeTax;
    private double nationalPension;
    private double healthInsurance;
    private double employmentInsurance;
    private double longTermCare;
    private double otherDeductions;
}