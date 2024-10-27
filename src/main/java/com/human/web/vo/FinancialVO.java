package com.human.web.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinancialVO {
    private int f_idx;
    private int e_idx;
    private double base_salary;
    private double position_allowance;
    private double tenure_allowance;
    private double fixed_allowance;
    private double daily_attendance_allowance;
    private double meal_allowance;
    private double overtime_allowance;
    private double night_allowance;
    private double extended_work_allowance;
    private double project_bonus;
    private double performance_bonus;
    private double team_bonus;
    private double work_performance_bonus;
    private double income_tax;
    private double national_pension;
    private double health_insurance;
    private double employment_insurance;
    private double long_term_care;
    private double other_deductions;
}