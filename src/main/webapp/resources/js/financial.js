$(document).ready(function() {
    const e_idx = $('header').data('eidx');
    window.initialValues = {};

    // 자릿수 구분 콤마랑 뒤에 '원' 표시 메소드
    function formatCurrency(value) {
        const numberValue = value ? parseInt(value.replace(/[^0-9]/g, ''), 10) : 0;
        return numberValue.toLocaleString() + ' 원';
    }

    // 날짜 포멧 지정
    function formatDate(timestamp) {
        if (!timestamp) return '정보 없음';
        const date = new Date(timestamp);
        return date.toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric' });
    }

    // 입력란, 버튼 활성화/비활성화 메소드, 기본적으로 비활성화
    function disableAllowanceFields() { 
        $('.currency-input').prop('disabled', true); 
        $('.salary-form-save-btn, input[type="reset"]').prop('disabled', true);
    }

    function enableAllowanceFields() { 
        $('.currency-input').prop('disabled', false); 
        $('.salary-form-save-btn, input[type="reset"]').prop('disabled', false); 
    }

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

    // 입력란 포맷팅 및 초기화 버튼
    $('.currency-input').on('blur', function() {
        $(this).val(formatCurrency($(this).val()));
    }).on('focus', function() {
        $(this).val($(this).val().replace(/[^0-9]/g, ''));
    });

    $('input[type="reset"]').on('click', function(e) {
        if (!$('#tab-body .tbody.active').length) return;
        e.preventDefault();
        if (confirm("정말로 내용을 초기화하시겠습니까?")) {
            $('.currency-input').val('0 원');
        }
    });

    // 사원 선택 안된 상태에서 클릭시 메시지
    $('.salary-form-save-btn').on('click', function(e) {
        if (!$('#tab-body .tbody.active').length) return;
        if (e_idx === undefined) {
            e.preventDefault();
            alert('사원을 선택하세요.');
        }
    });

    // 사원 목록 불러오기
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
                    if (!$('#tab-body .tbody.active').length) return;
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
            alert('사원 목록을 불러오는 중 오류가 발생했습니다.');
        }
    });

    // 사원 상세 정보 불러오기
    function loadEmployeeDetails(e_idx) {
        if (!$('#tab-body .tbody.active').length) return;
        $.ajax({
            url: '/employees/getEmployeeDetails/' + e_idx,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                const employee = data.employee;
                $('#salary_registration #e_idx').text(employee.e_idx || '정보 없음');
                $('#salary_registration #name').text(employee.name || '정보 없음');
                $('#salary_registration #birthday').text(formatDate(employee.birthday));
                $('#salary_registration #entry_date').text(formatDate(employee.entry_date));
                $('#salary_registration #exit_date').text(formatDate(employee.retirement_date));
                $('#salary_registration #position').text(employee.position || '정보 없음');
                $('#salary_registration #mobile').text(employee.mobile || '정보 없음');
                $('#salary_registration #email').text(employee.email || '정보 없음');
                $('#salary_registration #entry_type').text(employee.entry_type || '정보 없음');
                $('#salary_registration #address').text(employee.address || '정보 없음');
                $('#salary_registration #foreign_name1').text(employee.foreign_name1 || '정보 없음');
                $('#salary_registration #foreign_name2').text(employee.foreign_name2 || '정보 없음');
                $('#salary_registration #bank_name').text(employee.bank_name || '정보 없음');
                $('#salary_registration #account_number').text(employee.account_number || '정보 없음');
                $('#salary_registration #account_holder').text(employee.account_holder || '정보 없음');
                $('#salary_registration #jumin').text(employee.jumin || '정보 없음');
            },
            error: function() {
                alert('사원 상세 정보를 불러오는 중 오류가 발생했습니다.');
            }
        });
    }

    // 급여 정보 불러오기 및 표시
    function loadSalaryDetails(e_idx) {
        if (!$('#tab-body .tbody.active').length) return;
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
                        field.val(value ? formatCurrency(value.toString()) : '0 원');
                    }

                    initialValues[fieldName] = value;
                });
            },
            error: function() {
                $('.salary-details .currency-input').val(''); 
            }
        });
    }

    // 급여 정보 저장
    $('#salary-form').on('submit', function(e) {
        if (!$('#tab-body .tbody.active').length) return;
        e.preventDefault();

        $('.currency-input').each(function() {
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });

        let formData = new FormData(this);

        $.ajax({
            url: '/financial/saveFinancialInfo.do',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                if (response.status === 'success') {
                    alert('저장되었습니다.');
                    loadSalaryDetails(e_idx);
                } else {
                    alert('급여 정보 저장에 실패했습니다.');
                }
            },
            error: function(jqXHR) {
                alert('급여 정보 저장중 오류가 발생했습니다. (' + jqXHR.status + ')');
            }
        });
    });

    loadSalaryDetails(e_idx); // 페이지 로딩 시 급여 정보 불러오기
});
