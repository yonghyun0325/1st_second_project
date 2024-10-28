package com.human.web.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinancialVO {
    private int eIdx;
    private double baseSalary;
    private double positionAllowance;
    private double tenureAllowance;
    private double fixedAllowance;
    private double dailyAttendanceAllowance;
    private double mealAllowance;
    private double overtimeAllowance;
    private double nightAllowance;
    private double holidayAllowance;            // 휴일수당
    private double holidayNightAllowance;       // 휴일야간수당
    private double holidayExtendedAllowance;    // 휴일연장수당
    private double maternityCare;               // 출산보육
    private double selfDrivingAllowance;        // 자가운전수당
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