<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<section id="registration">
    <!-- 사원 목록 -->
    <div class="employees-list-section">
        <h2>사원 목록</h2>
        <table class="employees-list">
            <thead>
                <tr>
                    <th>사원번호</th>
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

    <!-- 상세 정보 -->
    <div class="employees-details-section">
        <h2>사원 상세 정보</h2>
        <table class="employees-details-table">
            <tr><th>사번</th><td><span id="detail-id">선택하세요</span></td><th>성명</th><td><span id="detail-name">선택하세요</span></td></tr>
            <tr><th>생년월일</th><td><span id="detail-birthdate">선택하세요</span></td><th>직급</th><td><span id="detail-position">선택하세요</span></td></tr>
            <tr><th>모바일</th><td><span id="detail-mobile">선택하세요</span></td><th>Email</th><td><span id="detail-email">선택하세요</span></td></tr>
            <tr><th>입사구분</th><td><span id="detail-entry-type">선택하세요</span></td><th>입사일자</th><td><span id="detail-entry-date">선택하세요</span></td></tr>
            <tr><th>퇴사일자</th><td><span id="detail-exit-date">선택하세요</span></td><th>주소</th><td><span id="detail-address">선택하세요</span></td></tr>
            <tr><th>외국어성명1</th><td><span id="detail-foreign-name1">선택하세요</span></td><th>외국어성명2</th><td><span id="detail-foreign-name2">선택하세요</span></td></tr>
            <tr><th>은행</th><td><span id="detail-bank">선택하세요</span></td><th>계좌번호</th><td><span id="detail-account-number">선택하세요</span></td></tr>
            <tr><th>예금주</th><td><span id="detail-account-holder">선택하세요</span></td><th>주민등록번호</th><td><span id="detail-jumin">선택하세요</span></td></tr>
        </table>

        <a href="javascript:void(0)" id="salary-toggle-btn">
            <h2> 급여 정보<i class="fas fa-chevron-right salary-toggle-ico"></i></h2>
        </a>
        <form id="salary-form" name="salary-form" style="display: none;">
            <table class="salary-details-table">
                <!-- 고정 수당 -->
                <thead><tr><th colspan="4">고정 수당</th></tr></thead>
                <tbody>
                    <tr>
                        <th>기본 급여</th><td><input type="number" id="base-salary"></td>
                        <th>직책 수당</th><td><input type="number" id="position-allowance"></td>
                    </tr>
                    <tr>
                        <th>근속 수당</th><td><input type="number" id="tenure-allowance"></td>
                        <th>기타 고정 수당</th><td><input type="number" id="fixed-allowance"></td>
                    </tr>
                </tbody>
        
                <!-- 일급 수당 -->
                <thead><tr><th colspan="4">일급 수당</th></tr></thead>
                <tbody>
                    <tr>
                        <th>출근 수당</th><td><input type="number" id="daily-attendance-allowance"></td>
                        <th>식대 수당</th><td><input type="number" id="meal-allowance"></td>
                    </tr>
                </tbody>
        
                <!-- 야근 수당 -->
                <thead><tr><th colspan="4">야근 수당</th></tr></thead>
                <tbody>
                    <tr>
                        <th>기본 야근 수당</th><td><input type="number" id="overtime-allowance"></td>
                        <th>심야 수당</th><td><input type="number" id="night-allowance"></td>
                    </tr>
                    <tr>
                        <th>연장 근무 수당</th><td><input type="number" id="extended-work-allowance"></td>
                    </tr>
                </tbody>
        
                <!-- 성과급 및 보너스 -->
                <thead><tr><th colspan="4">성과급 및 보너스</th></tr></thead>
                <tbody>
                    <tr>
                        <th>프로젝트 보너스</th><td><input type="number" id="project-bonus"></td>
                        <th>성과 보너스</th><td><input type="number" id="performance-bonus"></td>
                    </tr>
                    <tr>
                        <th>팀 성과 보너스</th><td><input type="number" id="team-bonus"></td>
                        <th>근무 성과 보너스</th><td><input type="number" id="work-performance-bonus"></td>
                    </tr>
                </tbody>
        
                <!-- 공제 항목 -->
                <thead><tr><th colspan="4">공제 항목</th></tr></thead>
                <tbody>
                    <tr>
                        <th>소득세</th><td><input type="number" id="income-tax"></td>
                        <th>국민연금</th><td><input type="number" id="national-pension"></td>
                    </tr>
                    <tr>
                        <th>건강보험</th><td><input type="number" id="health-insurance"></td>
                        <th>고용보험</th><td><input type="number" id="employment-insurance"></td>
                    </tr>
                    <tr>
                        <th>장기요양보험</th><td><input type="number" id="long-term-care"></td>
                        <th>기타 공제 항목</th><td><input type="number" id="other-deductions"></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" class="salary-form-save-btn" value="급여 정보 저장">
        </form>
    </div>
</section>
<script>
    $(document).ready(function() {
        let e_idx;

        $.ajax({
            url: '/employees/getEmployeesList.do',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                const tableBody = $('.employees-list tbody');
                tableBody.empty();
                
                data.forEach(function(employee) {
                    const row = $('<tr>').append(
                        $('<td>').text(employee.e_idx),
                        $('<td>').text(employee.name),
                        $('<td>').text(employee.position),
                        $('<td>').text(employee.depa)
                    );
                    
                    row.on('click', function() {
                        loadEmployeeDetails(employee.e_idx);
                        loadSalaryDetails(employee.e_idx);
                        e_idx = employee.e_idx;
                    });
                    
                    tableBody.append(row);
                });
            },
            error: function() {
                window.alert('사원 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });

        $('#salary-toggle-btn').on('click', function() {
            $('#salary-form').slideToggle(300);
            $(this).find('i').toggleClass('rotate');
        });

        // 사원 정보 불러오기
        function loadEmployeeDetails(e_idx) {
            $.ajax({
                url: '/employees/getEmployee/' + e_idx,
                method: 'GET',
                dataType: 'json',
                success: function(employee) {
                    $('#detail-id').text(employee.e_idx || '정보 없음');
                    $('#detail-name').text(employee.name || '정보 없음');
                    $('#detail-birthdate').text(formatDate(employee.birthday));
                    $('#detail-entry-date').text(formatDate(employee.entry_date));
                    $('#detail-exit-date').text(formatDate(employee.exit_date));
                    $('#detail-position').text(employee.position || '정보 없음');
                    $('#detail-mobile').text(employee.mobile || '정보 없음');
                    $('#detail-email').text(employee.email || '정보 없음');
                    $('#detail-entry-type').text(employee.entry_type || '정보 없음');
                    $('#detail-address').text(employee.address || '정보 없음');
                    $('#detail-foreign-name1').text(employee.foreign_name1 || '정보 없음');
                    $('#detail-foreign-name2').text(employee.foreign_name2 || '정보 없음');
                    $('#detail-bank').text(employee.bank_name || '정보 없음');
                    $('#detail-account-number').text(employee.account_number || '정보 없음');
                    $('#detail-account-holder').text(employee.account_holder || '정보 없음');
                    $('#detail-jumin').text(employee.jumin || '정보 없음');
                    $('#employee-id').val(employee.e_idx);
                },
                error: function() {
                    alert('사원 상세 정보를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        // 급여 정보 불러오기
        function loadSalaryDetails(e_idx) {
            $.ajax({
                url: '/financial/getFinancialInfo/' + e_idx,
                method: 'GET',
                dataType: 'json',
                success: function(salary) {
                    $('#base-salary').val(salary?.base_salary || 0);
                    $('#position-allowance').val(salary?.position_allowance || 0);
                    $('#tenure-allowance').val(salary?.tenure_allowance || 0);
                    $('#fixed-allowance').val(salary?.fixed_allowance || 0);
                    $('#daily-attendance-allowance').val(salary?.daily_attendance_allowance || 0);
                    $('#meal-allowance').val(salary?.meal_allowance || 0);
                    $('#overtime-allowance').val(salary?.overtime_allowance || 0);
                    $('#night-allowance').val(salary?.night_allowance || 0);
                    $('#extended-work-allowance').val(salary?.extended_work_allowance || 0);
                    $('#project-bonus').val(salary?.project_bonus || 0);
                    $('#performance-bonus').val(salary?.performance_bonus || 0);
                    $('#team-bonus').val(salary?.team_bonus || 0);
                    $('#work-performance-bonus').val(salary?.work_performance_bonus || 0);
                    $('#income-tax').val(salary?.income_tax || 0);
                    $('#national-pension').val(salary?.national_pension || 0);
                    $('#health-insurance').val(salary?.health_insurance || 0);
                    $('#employment-insurance').val(salary?.employment_insurance || 0);
                    $('#long-term-care').val(salary?.long_term_care || 0);
                    $('#other-deductions').val(salary?.other_deductions || 0);
                },
                error: function() {
                    alert('급여 정보를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        // 급여 정보 저장
        $('.salary-form-save-btn').on('click', function(e) {
            const formElement = document.querySelector('#salary-form');
            const formData = new FormData(formElement);
            e.preventDefault();

            $.ajax({
                url: '/financial/saveFinancialInfo.do',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('저장되었습니다.');
                    } else if (response.status === 'fail') {
                        alert('급여 정보 저장에 실패했습니다.');
                    } else if (response.status === 'error') {
                        alert('오류가 발생했습니다: ' + response.message);
                    }
                },
                error: function (jqXHR) {
                    alert('급여 정보 저장중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        function formatDate(timestamp) {
            if (!timestamp) return '정보 없음';
            const date = new Date(timestamp);
            return date.toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric' });
        }
    });
</script>