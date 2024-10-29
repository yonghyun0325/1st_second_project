<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 급여 관리 수당등록 화면 -->
<section id="registration">

    <!-- 사원 목록 -->
    <div class="employees-info-wrapper" style="flex: 1;">
        <h4>◇ 사원 목록</h4>
        <div class="employees-list-section">
            <table class="employees-list">
                <thead>
                    <tr>
                        <th>사원번호<div class="resize-handle"></div></th>
                        <th>성명<div class="resize-handle"></div></th>
                        <th>직급<div class="resize-handle"></div></th>
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
    <div class="employees-info-wrapper" style="flex: 1;">
        <h4>◇ 상세 정보</h4>
        <div class="employees-details-section">
            <table class="employees-details">
                <thead>
                    <tr>
                        <th>종류<div class="resize-handle"></div></th>
                        <th>내용</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>사번</td>
                        <td><span id="detail-id">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>성명</td>
                        <td><span id="detail-name">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td><span id="detail-birthdate">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>주민등록번호</td>
                        <td><span id="detail-jumin">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>직급</td>
                        <td><span id="detail-position">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>모바일</td>
                        <td><span id="detail-mobile">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><span id="detail-email">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>입사구분</td>
                        <td><span id="detail-entry-type">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>입사일자</td>
                        <td><span id="detail-entry-date">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>퇴사일자</td>
                        <td><span id="detail-exit-date">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td><span id="detail-address">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>외국어성명1</td>
                        <td><span id="detail-foreign-name1">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>외국어성명2</td>
                        <td><span id="detail-foreign-name2">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>은행</td>
                        <td><span id="detail-bank">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>계좌번호</td>
                        <td><span id="detail-account-number">선택하세요</span></td>
                    </tr>
                    <tr>
                        <td>예금주</td>
                        <td><span id="detail-account-holder">선택하세요</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    
    <div class="employees-info-wrapper" style="flex: 2;">
        <h4>◇ 급여 정보</h4>
        <div class="salary-info-section">
            <form id="salary-form" name="salary-form">
                <input type="hidden" id="e_idx" name="e_idx">
                <table class="salary-details">
                    <thead>
                        <tr>
                            <th>지급 항목<div class="resize-handle"></div></th>
                            <th>금액<div class="resize-handle"></div></th>
                            <th>구분<div class="resize-handle"></div></th>
                            <th>비과세한도</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>기본 급여</td>
                            <td><input type="text" id="base-salary" name="base_salary" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="base-salary-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>상여금</td>
                            <td><input type="text" id="bonus" name="bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>연차수당</td>
                            <td><input type="text" id="annual-allowance" name="annual_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="annual-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>직책수당</td>
                            <td><input type="text" id="position-allowance" name="position_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="position-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>기타수당</td>
                            <td><input type="text" id="other-allowance" name="other_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="other-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>주휴수당</td>
                            <td><input type="text" id="weekly-allowance" name="weekly_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="weekly-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>장기근속</td>
                            <td><input type="text" id="long-term-allowance" name="long_term_allowance" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="long-term-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>연장수당</td>
                            <td><input type="text" id="extended-allowance" name="extended_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="extended-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>야간수당</td>
                            <td><input type="text" id="night-allowance" name="night_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="night-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>휴일수당</td>
                            <td><input type="text" id="holiday-allowance" name="holiday_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="holiday-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>휴일야간수당</td>
                            <td><input type="text" id="holiday-night-allowance" name="holiday_night_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="holiday-night-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>휴일연장수당</td>
                            <td><input type="text" id="holiday-extended-allowance" name="holiday_extended_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="holiday-extended-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>식대</td>
                            <td><input type="text" id="meal-allowance" name="meal_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="meal-allowance-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>출산보육</td>
                            <td><input type="text" id="maternity-care" name="maternity_care" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="maternity-care-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>자가운전수당</td>
                            <td><input type="text" id="self-driving-allowance" name="self_driving_allowance" class="currency-input"></td>
                            <td>비과세</td>
                            <td><span id="self-driving-allowance-be" class="currency-input"></span>
                        </tr><tr>
                            <td>프로젝트 보너스</td>
                            <td><input type="text" id="project-bonus" name="project_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="project-bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>성과 보너스</td>
                            <td><input type="text" id="performance-bonus" name="performance_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="performance-bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>팀 성과 보너스</td>
                            <td><input type="text" id="team-bonus" name="team_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="team-bonus-be" class="currency-input"></span>
                        </tr>
                        <tr>
                            <td>근무 성과 보너스</td>
                            <td><input type="text" id="work-performance-bonus" name="work_performance_bonus" class="currency-input"></td>
                            <td>과세</td>
                            <td><span id="work-performance-bonus-be" class="currency-input"></span>
                        </tr>
                    </tbody>

                    <thead>
                        <th>공제 항목</th>
                        <th colspan="3">금액</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>소득세</td>
                            <td colspan="3"><input type="text" id="income-tax" name="income_tax" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>국민연금</td>
                            <td colspan="3"><input type="text" id="national-pension" name="national_pension" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>건강보험</td>
                            <td colspan="3"><input type="text" id="health-insurance" name="health_insurance" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>고용보험</td>
                            <td colspan="3"><input type="text" id="employment-insurance" name="employment_insurance" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>장기요양보험</td>
                            <td colspan="3"><input type="text" id="long-term-care" name="long_term_care" class="currency-input"></td>
                        </tr>
                        <tr>
                            <td>기타 공제 항목</td>
                            <td colspan="3"><input type="text" id="other-deductions" name="other_deductions" class="currency-input"></td>
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
<script>
    $(document).ready(function() {
        let e_idx;
        window.initialValues = {};

        // 자릿수 구분 콤마랑 뒤에 '원' 표시 메소드
        function formatCurrency(value) {
            const numberValue = value.replace(/[^0-9]/g, '');
            return numberValue ? parseInt(numberValue, 10).toLocaleString() + ' 원' : '';
        }

        // 입력란, 버튼 활성화/비활성화 메소드, 기본적으로 비활성화
        function disableAllowanceFields() { 
            $('.currency-input').prop('disabled', true); 
            $('.salary-form-save-btn, input[type="reset"]').prop('disabled', true); }
        function enableAllowanceFields() { 
            $('.currency-input').prop('disabled', false); 
            $('.salary-form-save-btn, input[type="reset"]').prop('disabled', false); }
        disableAllowanceFields();

        const taxFreeLimit = 1800000;
        const taxFreeItems = ["extended_allowance", "night_allowance", "holiday_allowance", "holiday_night_allowance", "holiday_extended_allowance", "meal_allowance", "maternity_care", "self_driving_allowance"];
        const taxableItems = ["base_salary", "bonus", "annual_allowance", "position_allowance", "other_allowance", "weekly_allowance", "long_term_allowance"];

        taxableItems.forEach(item => {
            $('#' + item + '-be').val('0').prop('readonly', true);
        });

        taxFreeItems.forEach(item => {
            $('#' + item + '-be').val(taxFreeLimit.toLocaleString() + ' 원').prop('readonly', true);
        });

        // 입력란 벗어나면 자릿수 구분 콤마랑 '원' 표시
        $('.currency-input').on('blur', function() {
            let value = $(this).val().replace(/[^0-9]/g, '');
            if (value === '' || isNaN(value)) {
                $(this).val('0 원');
            } else {
                $(this).val(formatCurrency(value));
            }
        });

        // 만약 입력란 활성화시 '원'과 콤마표시 삭제
        $('.currency-input').on('focus', function() {
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });

        // 초기화 버튼 클릭시 확인
        $('input[type="reset"]').on('click', function(e) {
            e.preventDefault();

            if (confirm("정말로 내용을 초기화하시겠습니까?")) {
                $('.currency-input').each(function() {
                    $(this).val('0 원');
                });
            }
        });

        // 사원 선택 안된상태에서 클릭시 사원 선택 메시지
        $('.salary-form-save-btn').on('click', function(e) {
            if (e_idx === undefined) {
                e.preventDefault();
                alert('사원을 선택하세요.');
            }
        });

        // ajax 요청으로 사원 목록 불러오기
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
                        enableAllowanceFields();
                    });
                    
                    tableBody.append(row);
                });
            },
            error: function() {
                window.alert('사원 목록을 불러오는 중 오류가 발생했습니다.');
            }
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
                    $('#e_idx').val(employee.e_idx);
                },
                error: function() {
                    alert('사원 상세 정보를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        function loadSalaryDetails(e_idx) {
    $.ajax({
            url: '/financial/getFinancialInfo/' + e_idx,
            method: 'GET',
            dataType: 'json',
            success: function(salary) {
                $('.salary-details .currency-input').each(function() {
                    const field = $(this);
                    const fieldName = field.attr('name');
                    const value = salary[fieldName] || 0;

                    if (taxFreeItems.includes(fieldName)) {
                        $('#' + fieldName + '-be').text(taxFreeLimit ? formatCurrency(taxFreeLimit.toString()) : '');
                    } else {
                        field.val(value ? formatCurrency(value.toString()) : '');
                    }

                    initialValues[fieldName] = value;
                });
            },
            error: function() {
                $('.salary-details .currency-input').each(function() {
                    const field = $(this);
                    const fieldName = field.attr('name');

                    if (taxFreeItems.includes(fieldName)) {
                        $('#' + fieldName + '-be').text('');  // 비과세 항목 빈칸 표시
                    } else {
                        field.val('');  // 과세 항목 초기화
                    }
                    initialValues[fieldName] = 0;
                });
            }
        });
    }

        // 급여정보 부분 펼치고 접기 토글버튼
        $('#salary-toggle-btn').on('click', function() {
            $('#salary-form').slideToggle(300);
            $(this).find('i').toggleClass('rotate');
        });

        // 급여 정보 저장
        $('#salary-form').on('submit', function(e) {
            e.preventDefault();

            $('.currency-input').each(function() {
                const pureNumber = $(this).val().replace(/[^0-9]/g, '');
                $(this).val(pureNumber);
            });

            let formData = new FormData(this);

            $.ajax({
                url: '/financial/saveFinancialInfo.do',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('저장되었습니다.');
                        loadSalaryDetails(e_idx);
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

        // 날짜 포멧 지정
        function formatDate(timestamp) {
            if (!timestamp) return '정보 없음';
            const date = new Date(timestamp);
            return date.toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric' });
        }

        // 표 너비 직접 조정
        $('.resize-handle').on('mousedown', function (e) {
            e.preventDefault();
            let $th = $(this).parent();
            let startX = e.pageX;
            let startWidth = $th.width();

            $(document).on('mousemove.resizeColumn', function (e) {
                let newWidth = startWidth + (e.pageX - startX);
                $th.css('width', newWidth + 'px');
            });
        
            $(document).on('mouseup.resizeColumn', function () {
                $(document).off('.resizeColumn');
            });
        });
    });
</script>