$(document).ready(function() {
    const e_idx = $('header').data('eidx');

    // 기본적으로 입력 불가 및 버튼 비활성화
    $('#employeeForm input').attr('readonly', true);
    $('.hr_registration_crud input[type="submit"], .hr_registration_crud input[type="reset"]').prop('disabled', true);
    $('#saveButton, input[type="reset"]').hide();

    // '수정' 버튼 클릭 시 입력 가능하게 설정
    $('.hr_registration_update, #editButton').on('click', function() {
        $('#employeeForm input, #employeeForm select').not('#depa').removeAttr('readonly');
        $('.hr_registration_crud input[type="submit"], .hr_registration_crud input[type="reset"]').prop('disabled', false);
        $('#saveButton, input[type="reset"]').show();
        $('#editButton').hide();
    });

    // 사원 목록 불러오기
    function loadEmployeesList() {
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
                        $('#employeeForm input').attr('readonly', true);
                        $('.hr_registration_crud input[type="submit"], .hr_registration_crud input[type="reset"]').prop('disabled', true);
                        loadEmployeeDetails(employee.e_idx);
                    });
                    tableBody.append(row);
                });
            },
            error: function() {
                alert('사원 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });
    }

    loadEmployeesList();

    // 부서 목록 불러오기
    function loadDepaOptions() {
        $.ajax({
            url: '/depa/getDepaList',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                const depaSelect = $('#depa');
                depaSelect.empty();
                depaSelect.append('<option value="">부서선택</option>');

                data.forEach(function(depa) {
                    depaSelect.append('<option value="' + depa.d_idx + '">' + depa.name + '</option>');
                });
            },
            error: function() {
                alert('부서 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });
    }

    loadDepaOptions();

    // 프로필 사진 미리보기
    $('#fileInput').on('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $('#previewImage').attr('src', e.target.result).show();
            };
            reader.readAsDataURL(file);
        }
    });

    $('#profileContainer').on('click', function() {
        $('#fileInput').trigger('click');
    });

    // 사원 상세 정보 불러오기
    function loadEmployeeDetails(e_idx) {
        $.ajax({
            url: '/employees/getEmployeeDetails/' + e_idx,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                const employee = data.employee;
                const photoUrl = data.photoUrl || '/resources/img/icon/profile-default.svg';

                $('#employeeForm #e_idx').val(employee.e_idx);
                $('#employeeForm #name').val(employee.name || '정보 없음');
                $('#employeeForm #tel').val(employee.tel || '정보 없음');
                $('#employeeForm #jumin').val(employee.jumin || '정보 없음');
                $('#employeeForm #address').val(employee.address || '정보 없음');
                $('#employeeForm #birthday').val(employee.birthday ? new Date(employee.birthday).toISOString().split('T')[0] : '');
                $('#employeeForm #email').val(employee.email || '정보 없음');
                $('#employeeForm #position').val(employee.position || '정보 없음');
                $('#employeeForm #entry_date').val(employee.entry_date ? new Date(employee.entry_date).toISOString().split('T')[0] : '');
                $('#employeeForm #retirement_date').val(employee.retirement_date ? new Date(employee.retirement_date).toISOString().split('T')[0] : '');
                $('#employeeForm #depa').val(employee.d_idx || "");
                $('#employeeForm #mobile').val(employee.mobile || '정보 없음');
                $('#employeeForm #entry_type').val(employee.entry_type || '정보 없음');
                $('#employeeForm #salary_type').val(employee.salary_type || '정보 없음');
                $('#employeeForm #postal_code').val(employee.postal_code || '정보 없음');
                $('#employeeForm #workplace_phone').val(employee.workplace_phone || '정보 없음');
                $('#previewImage').attr('src', photoUrl);

                // 추가 필드 업데이트
                $('#employeeForm #gender').val(employee.gender || "");
                $('#employeeForm #employee_type').val(employee.employee_type || "");
                $('#employeeForm #education').val(employee.education || "");
                $('#employeeForm #career_type').val(employee.career_type || "");
                $('#employeeForm #maritalStatus').val(employee.maritalStatus || "");
                $('#employeeForm #disability').val(employee.disability || "");
            },
            error: function() {
                alert('사원 상세 정보를 불러오는 중 오류가 발생했습니다.');
            }
        });
    }

    // 사원 등록하기
    $('#employeeForm').on('submit', function(e) {
        e.preventDefault();
        const formData = new FormData(this);

        $.ajax({
            url: '/hr/register',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                alert("사원이 성공적으로 등록되었습니다.");
                loadEmployeesList();
                $('#employeeForm')[0].reset();
                $('#previewImage').attr('src', '');
            },
            error: function(jqXHR) {
                console.error('Error:', jqXHR.statusText);
            }
        });
    });

    // 추가 버튼 클릭 이벤트 처리
    $('.hr_registration_addition').on('click', function() {
        $('.button-bundle a').hide();

        const tableBody = $('.employees-list tbody');
        const newRow = $('<tr>').addClass('new-row').append(
            $('<td>').append('<input type="text" name="new_e_idx" disabled value="자동 생성됨">'),
            $('<td>').append('<input type="text" name="new_name" required>'),
            $('<td>').append(`
                <select name="new_position" required>
                    <option value="">선택</option>
                    <option value="1">사원</option>
                    <option value="2">대리</option>
                    <option value="3">과장</option>
                    <option value="4">부장</option>
                </select>
            `),
            $('<td>').append($('#depa').clone())
        );

        tableBody.prepend(newRow);

        $('.button-bundle').append(`
            <a href="javascript:void(0)" class="hr_registration_complete">저장</a>
            <a href="javascript:void(0)" class="hr_registration_cancel">취소</a>
        `);
    });

    $(document).on('click', '.hr_registration_complete', function() {
        const name = $('input[name="new_name"]').val();
        const position = $('select[name="new_position"]').val();
        const depa = $('select[name="new_depa"]').val();

        if (!name || !position || !depa) {
            alert('모든 필수 항목을 작성해주세요.');
            return;
        }

        $.ajax({
            url: '/hr/register',
            method: 'POST',
            data: { name, position, depa },
            success: function(response) {
                alert("추가가 완료되었습니다.");
                loadEmployeesList();
                restoreButtons();
                $('#employeeForm input').removeAttr('readonly');
            },
            error: function() {
                alert('사원을 추가하는 중 오류가 발생했습니다.');
            }
        });
    });

    $(document).on('click', '.hr_registration_cancel', function() {
        restoreButtons();
        $('.new-row').remove();
    });

    function restoreButtons() {
        $('.button-bundle a').show();
        $('.hr_registration_complete, .hr_registration_cancel').remove();
    }
});
