package com.human.web.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinancialVO {
    private int e_idx;                       // 사원 ID
    private double base_salary;               // 기본 급여
    private double bonus;                     // 상여금
    private double annual_allowance;          // 연차수당
    private double position_allowance;        // 직책수당
    private double other_allowance;           // 기타수당
    private double weekly_allowance;          // 주휴수당
    private double long_term_allowance;       // 장기근속수당
    private double extended_allowance;        // 연장수당
    private double night_allowance;           // 야간수당
    private double holiday_allowance;         // 휴일수당
    private double holiday_night_allowance;   // 휴일야간수당
    private double holiday_extended_allowance;// 휴일연장수당
    private double meal_allowance;            // 식대
    private double maternity_care;            // 출산보육수당
    private double self_driving_allowance;    // 자가운전수당
    private double project_bonus;             // 프로젝트 보너스
    private double performance_bonus;         // 성과 보너스
    private double team_bonus;                // 팀 성과 보너스
    private double work_performance_bonus;    // 근무 성과 보너스
    private double income_tax;                // 소득세
    private double national_pension;          // 국민연금
    private double health_insurance;          // 건강보험
    private double employment_insurance;      // 고용보험
    private double long_term_care;            // 장기요양보험
    private double other_deductions;          // 기타 공제 항목
}