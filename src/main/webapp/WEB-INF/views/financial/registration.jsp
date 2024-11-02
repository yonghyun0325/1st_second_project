<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 급여 관리 수당등록 화면 -->
<section id="registration">

    <!-- 사원 목록 -->
    <div class="table-wrapper" style="flex: 1;">
        <h3>◇ 사원 목록</h3>
        <div class="employees-list-section">
            <table class="employees-list table-common">
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
    <div class="table-wrapper" style="flex: 1;">
        <h3>◇ 상세 정보</h3>
        <div class="employees-details-section">
            <table class="employees-details table-common">
                <thead>
                    <tr>
                        <th>종류<div class="resize-handle"></div></th>
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
                            <th>지급 항목<div class="resize-handle"></div></th>
                            <th>금액<div class="resize-handle"></div></th>
                            <th>구분<div class="resize-handle"></div></th>
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
                        $('.table-common tbody tr').removeClass('active');
                        $(this).addClass('active');
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
                    Object.keys(employee).forEach(function(key) {
                        const element = $('#' + key);
                    
                        if (element.length) {
                            if (key === "birthday" || key === "entry_date" || key === "exit_date") {
                                element.text(formatDate(employee[key]) || '정보 없음');
                            } else {
                                element.text(employee[key] || '정보 없음');
                            }
                        }
                    });
                },
                error: function() {
                    alert('사원 상세 정보를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        // 급여정보 불러오기
        function loadSalaryDetails(e_idx) {
            $.ajax({
                url: '/financial/getFinancialInfo/' + e_idx,
                method: 'GET',
                dataType: 'json',
                success: function(salary) {
                    console.log("급여 정보 로드 성공:", salary);
                    
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
                            $('#' + fieldName + '-be').text('');
                        } else {
                            field.val(''); 
                        }
                        initialValues[fieldName] = 0;
                    });
                }
            });
        }

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