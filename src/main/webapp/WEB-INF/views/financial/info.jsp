<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/resources/js/financial.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/financial.css">

<!-- 급여 정보 조회 화면 -->
<section id="salary_info" class="section-common">

    <div class="table-wrapper" style="flex: 2;">
        <h3>내 급여 정보</h3>
        <div class="table-list-section">
            <table class="salary-details table-common">
                <thead>
                    <tr>
                        <th>지급 항목</th>
                        <th>금액</th>
                        <th>구분</th>
                        <th>비과세한도</th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>기본 급여</td><td><span id="base_salary">0 원</span></td><td>과세</td><td><span id="base_salary-be">0 원</span></td></tr>
                    <tr><td>상여금</td><td><span id="bonus">0 원</span></td><td>과세</td><td><span id="bonus-be">0 원</span></td></tr>
                    <tr><td>연차수당</td><td><span id="annual_allowance">0 원</span></td><td>과세</td><td><span id="annual_allowance-be">0 원</span></td></tr>
                    <tr><td>직책수당</td><td><span id="position_allowance">0 원</span></td><td>과세</td><td><span id="position_allowance-be">0 원</span></td></tr>
                    <tr><td>기타수당</td><td><span id="other_allowance">0 원</span></td><td>과세</td><td><span id="other_allowance-be">0 원</span></td></tr>
                    <tr><td>주휴수당</td><td><span id="weekly_allowance">0 원</span></td><td>과세</td><td><span id="weekly_allowance-be">0 원</span></td></tr>
                    <tr><td>장기근속</td><td><span id="long_term_allowance">0 원</span></td><td>과세</td><td><span id="long_term_allowance-be">0 원</span></td></tr>
                    <tr><td>연장수당</td><td><span id="extended_allowance">0 원</span></td><td>비과세</td><td><span id="extended_allowance-be">1,800,000 원</span></td></tr>
                    <tr><td>야간수당</td><td><span id="night_allowance">0 원</span></td><td>비과세</td><td><span id="night_allowance-be">1,800,000 원</span></td></tr>
                    <tr><td>휴일수당</td><td><span id="holiday_allowance">0 원</span></td><td>비과세</td><td><span id="holiday_allowance-be">1,800,000 원</span></td></tr>
                    <tr><td>휴일야간수당</td><td><span id="holiday_night_allowance">0 원</span></td><td>비과세</td><td><span id="holiday_night_allowance-be">1,800,000 원</span></td></tr>
                    <tr><td>휴일연장수당</td><td><span id="holiday_extended_allowance">0 원</span></td><td>비과세</td><td><span id="holiday_extended_allowance-be">1,800,000 원</span></td></tr>
                    <tr><td>식대</td><td><span id="meal_allowance">0 원</span></td><td>비과세</td><td><span id="meal_allowance-be">1,800,000 원</span></td></tr>
                    <tr><td>출산보육</td><td><span id="maternity_care">0 원</span></td><td>비과세</td><td><span id="maternity_care-be">1,800,000 원</span></td></tr>
                    <tr><td>자가운전수당</td><td><span id="self_driving_allowance">0 원</span></td><td>비과세</td><td><span id="self_driving_allowance-be">1,800,000 원</span></td></tr>
                    <tr><td>프로젝트 보너스</td><td><span id="project_bonus">0 원</span></td><td>과세</td><td><span id="project_bonus-be">0 원</span></td></tr>
                    <tr><td>성과 보너스</td><td><span id="performance_bonus">0 원</span></td><td>과세</td><td><span id="performance_bonus-be">0 원</span></td></tr>
                    <tr><td>팀 성과 보너스</td><td><span id="team_bonus">0 원</span></td><td>과세</td><td><span id="team_bonus-be">0 원</span></td></tr>
                    <tr><td>근무 성과 보너스</td><td><span id="work_performance_bonus">0 원</span></td><td>과세</td><td><span id="work_performance_bonus-be">0 원</span></td></tr>
                </tbody>

                <thead>
                    <tr>
                        <th>공제 항목</th>
                        <th colspan="3">금액</th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>소득세</td><td colspan="3"><span id="income_tax">0 원</span></td></tr>
                    <tr><td>국민연금</td><td colspan="3"><span id="national_pension">0 원</span></td></tr>
                    <tr><td>건강보험</td><td colspan="3"><span id="health_insurance">0 원</span></td></tr>
                    <tr><td>고용보험</td><td colspan="3"><span id="employment_insurance">0 원</span></td></tr>
                    <tr><td>장기요양보험</td><td colspan="3"><span id="long_term_care">0 원</span></td></tr>
                    <tr><td>기타 공제 항목</td><td colspan="3"><span id="other_deductions">0 원</span></td></tr>
                </tbody>
            </table>
        </div>
    </div>
</section>