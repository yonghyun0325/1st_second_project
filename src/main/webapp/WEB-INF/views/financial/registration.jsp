<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script src="${pageContext.request.contextPath}/resources/js/financial.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/financial.css">

<!-- 급여 관리 수당등록 화면 -->
<section id="salary_registration" class="section-common">

    <!-- 사원 목록 -->
    <div class="table-wrapper" style="flex: 1;">
        <h3>◇ 사원 목록</h3>
        <div class="table-list-section">
            <table class="employees-list table-common table-select-list">
                <thead>
                    <tr>
                        <th style="width: 30%;">사원번호</th>
                        <th>성명</th>
                        <th>직급</th>
                        <th>부서</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 사원 목록 표시부분 -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- 사원 상세 정보 -->
    <div class="table-wrapper" style="flex: 1;">
        <h3>◇ 상세 정보</h3>
        <div class="table-list-section">
            <table class="employees-details table-common">
                <thead>
                    <tr>
                        <th style="width:35%;">종류</th>
                        <th>내용</th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>사번</td><td><span id="e_idx">선택하세요</span></td></tr>
                    <tr><td>성명</td><td><span id="name">선택하세요</span></td></tr>
                    <tr><td>생년월일</td><td><span id="birthday">선택하세요</span></td></tr>
                    <tr><td>입사일자</td><td><span id="entry_date">선택하세요</span></td></tr>
                    <tr><td>퇴사일자</td><td><span id="exit_date">선택하세요</span></td></tr>
                    <tr><td>직급</td><td><span id="position">선택하세요</span></td></tr>
                    <tr><td>모바일</td><td><span id="mobile">선택하세요</span></td></tr>
                    <tr><td>Email</td><td><span id="email">선택하세요</span></td></tr>
                    <tr><td>입사구분</td><td><span id="entry_type">선택하세요</span></td></tr>
                    <tr><td>주소</td><td><span id="address">선택하세요</span></td></tr>
                    <tr><td>외국어성명1</td><td><span id="foreign_name1">선택하세요</span></td></tr>
                    <tr><td>외국어성명2</td><td><span id="foreign_name2">선택하세요</span></td></tr>
                    <tr><td>은행</td><td><span id="bank_name">선택하세요</span></td></tr>
                    <tr><td>계좌번호</td><td><span id="account_number">선택하세요</span></td></tr>
                    <tr><td>예금주</td><td><span id="account_holder">선택하세요</span></td></tr>
                    <tr><td>주민등록번호</td><td><span id="jumin">선택하세요</span></td></tr>
                </tbody>
            </table>
        </div>
    </div>

    
    <div class="table-wrapper" style="flex: 2;">
        <h3>◇ 급여 정보</h3>
        <div class="salary-info-section">
            <form id="salary-form" name="salary-form">
                <input type="hidden" id="e_idx" name="e_idx">
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
                        <tr>
                            <td>기본 급여</td>
                            <td><input type="text" id="base_salary" name="base_salary" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="base_salary-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>상여금</td>
                            <td><input type="text" id="bonus" name="bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>연차수당</td>
                            <td><input type="text" id="annual_allowance" name="annual_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="annual_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>직책수당</td>
                            <td><input type="text" id="position_allowance" name="position_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="position_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>기타수당</td>
                            <td><input type="text" id="other_allowance" name="other_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="other_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>주휴수당</td>
                            <td><input type="text" id="weekly_allowance" name="weekly_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="weekly_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>장기근속</td>
                            <td><input type="text" id="long_term_allowance" name="long_term_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="long_term_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>연장수당</td>
                            <td><input type="text" id="extended_allowance" name="extended_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="extended_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>야간수당</td>
                            <td><input type="text" id="night_allowance" name="night_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="night_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>휴일수당</td>
                            <td><input type="text" id="holiday_allowance" name="holiday_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="holiday_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>휴일야간수당</td>
                            <td><input type="text" id="holiday_night_allowance" name="holiday_night_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="holiday_night_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>휴일연장수당</td>
                            <td><input type="text" id="holiday_extended_allowance" name="holiday_extended_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="holiday_extended_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>식대</td>
                            <td><input type="text" id="meal_allowance" name="meal_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="meal_allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>출산보육</td>
                            <td><input type="text" id="maternity_care" name="maternity_care" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="maternity_care-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>자가운전수당</td>
                            <td><input type="text" id="self_driving_allowance" name="self_driving_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="self_driving_allowance-be" class="currency-input"></span>
                        </tr><tr>
                            <td>프로젝트 보너스</td>
                            <td><input type="text" id="project_bonus" name="project_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="project_bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>성과 보너스</td>
                            <td><input type="text" id="performance_bonus" name="performance_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="performance_bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>팀 성과 보너스</td>
                            <td><input type="text" id="team_bonus" name="team_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="team_bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>근무 성과 보너스</td>
                            <td><input type="text" id="work_performance_bonus" name="work_performance_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="work_performance_bonus-be" class="currency-input"></span>
                        </tr>
                    </tbody>

                    <thead>
                        <th>공제 항목</th>
                        <th colspan="3">금액</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>소득세</td>
                            <td colspan="3"><input type="text" id="income_tax" name="income_tax" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>국민연금</td>
                            <td colspan="3"><input type="text" id="national_pension" name="national_pension" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>건강보험</td>
                            <td colspan="3"><input type="text" id="health_insurance" name="health_insurance" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>고용보험</td>
                            <td colspan="3"><input type="text" id="employment_insurance" name="employment_insurance" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>장기요양보험</td>
                            <td colspan="3"><input type="text" id="long_term_care" name="long_term_care" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>기타 공제 항목</td>
                            <td colspan="3"><input type="text" id="other_deductions" name="other_deductions" class="currency-input"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="salary-button-bundle">
                    <input type="submit" class="salary-form-save-btn" value="저장">
                    <input type="reset" class="salary-form-save-btn" value="초기화">
                </div>
            </form>
        </div>
    </div>
</section>