<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .hr-employees-info {
        table-layout: fixed;
        text-align: center;
    }

</style>
<!-- css, 인사등록 스타일  -->
<section id="hr_registration">
    <div class="table-wrapper" style="width: 330px;">
        <div class="list-title-wrapper">
            <h3>◇ 사원 목록</h3>
            <div class="button-bundle">
                <a href="javascript:void(0)" class="hr_registration_addition">추가</a>
                <a href="javascript:void(0)" class="hr_registration_update">수정</a>
                <a href="javascript:void(0)" class="hr_registration_delete">삭제</a>
            </div>
        </div>
        <div class="employees-list-section">
            <table class="employees-list table-common">
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
    
    <div class="table-wrapper" style="flex: 1;">
        <div class="list-title-wrapper">
            <h3>◇ 사원 정보</h3>
        </div>
        <!-- 사원등록 폼 시작 -->
        <form name="employeeForm" id="employeeForm" action="${pageContext.request.contextPath}/hr/register" method="post">
            <table class="hr-employees-info table-common">
                <!-- 사진 등록 부분을 테이블 첫 번째 행으로 추가 -->
                <tr>
                    <td rowspan="6" colspan="2" id="profile-td" style="cursor: pointer; padding: 10px;">
                        <div id="profileContainer">
                            <img id="previewImage" src="/resources/img/icon/profile-default.svg" alt="기본 프로필 사진" style="width: 100%; height: 100%; border-radius: 50%; background: var(--funfun-blue);">
                            <input type="file" id="fileInput" accept="image/*" name="photo" style="display: none;">
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>성명</td>
                    <td><input type="text" id="name" name="name" required></td>
                    <td>사원번호</td>
                    <td colspan="2"><input type="text" id="e_idx" name="e_idx" disabled></td>
                    <td>생년월일</td>
                    <td colspan="2"><input type="date" id="birthday" name="birthday"></td>
                </tr>
                
                <tr>
                    <td>전화번호</td>
                    <td colspan="2"><input type="text" id="mobile" name="mobile" required></td>
                    <td>주민번호</td>
                    <td colspan="2"><input type="text" id="jumin" name="jumin" required></td>
                    <td>성별</td>
                    <td>
                        <select name="gender">
                           <option value="">선택</option>
                           <option value="male">남자</option>
                           <option value="female">여자</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>E-mail</td>
                    <td colspan="3"><input type="email" id="email" name="email"></td>
                    <td>부서</td>
                    <td>
                        <select id="depa" name="depa" required>
                            <option value="">부서선택</option>
                        </select>
                    </td>
                    <td>직위</td>
                    <td><input type="text" id="position" name="position"></td>
                </tr>

                <tr>
                    <td>근무지</td>
                    <td colspan="3"><input type="text" id="workplace" name="workplace"></td>
                    <td>직원구분</td>
                    <td>
                        <select name="employee_type">
                            <option value="">선택</option>
                            <option value="moderator">임원</option>
                            <option value="full-time">정규직</option>
                            <option value="contract-worker">계약직</option>
                         </select>
                    </td>
                    <td>급여구분</td>
                    <td><input type="text" id="salary_type" name="salary_type"></td>
                </tr>

                <tr>
                    <td colspan="2">입사일자</td>
                    <td colspan="2"><input type="date" id="entry_date" name="entry_date"></td>
                    <td colspan="2">퇴사일자</td>
                    <td colspan="2"><input type="date" id="retirement_date" name="retirement_date"></td>
                </tr>

                <tr>
                    <td>주소</td>
                    <td colspan="6"><input type="text" id="address" name="address"></td>
                    <td>우편번호</td>
                    <td colspan="2"><input type="text" id="postal_code" name="postal_code"></td>
                </tr>

                <tr>
                    <td colspan="2">내선 전화번호</td>
                    <td colspan="2"><input type="text" id="tel" name="tel"></td>
                    <td>최종학력</td>
                    <td colspan="2">
                        <select name="education">
                            <option>고등학교</option>
                            <option>대학교</option>
                            <option>대학원</option>
                        </select>
                    </td>
                    <td>채용구분</td>
                    <td colspan="2">
                        <select name="career_type">
                            <option value="">선택하세요</option>
                            <option value="NEW">신입</option>
                            <option value="CAREER">경력</option>
                         </select>
                    </td>
                </tr>

                <tr>
                    <td>결혼여부</td>
                    <td>
                        <select name="maritalStatus">
                           <option value="">선택</option>
                           <option value="single">미혼</option>
                           <option value="married">기혼</option>
                        </select>
                    </td>

                    <td>장애여부</td>
                    <td>
                        <select name="disability">
                           <option value="">선택</option>
                           <option value="Y">Y</option>
                           <option value="N">N</option>
                        </select>
                    </td>
                </tr>
                
            </table>
            <div class="hr_registration_crud">
                <input type="submit" value="저장">
                <input type="reset" value="다시 작성">
            </div>
        </form>
    </div>
</section>
<script>
    $(document).ready(function() {

        // 기본적으로 입력할 수 없게 설정
        $('#employeeForm input').attr('readonly', true);
        $('.hr_registration_crud input[type="submit"], .hr_registration_crud input[type="reset"]').prop('disabled', true);

        $('.hr_registration_update').on('click', function() {
            $('#employeeForm input').removeAttr('readonly');
            $('.hr_registration_crud input[type="submit"], .hr_registration_crud input[type="reset"]').prop('disabled', false);
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
                    window.alert('사원 목록을 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        loadEmployeesList()

        function loadDepaOptions() {
            $.ajax({
                url: '/depa/getDepaList',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    const depaSelect = $('#depa');
                    depaSelect.empty();
                    depaSelect.append('<option value="">부서선택</option>');
                    
                    // 부서 목록 옵션 추가
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

        // 프로필 사진 변경시 섬네일 보여주기
        $('#fileInput').on('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    $('#previewImage').attr('src', e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });

        // 프로필 사진 클릭 시 파일 선택 창 열기
        $('#profileContainer').off('click').on('click', function(event) {
            if (event.target !== $('#fileInput')[0]) { 
                $('#fileInput').trigger('click');
            }
        });

        function loadEmployeeDetails(e_idx) {
            $.ajax({
                url: '/employees/getEmployeeDetails/' + e_idx,
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    const employee = data.employee;
                    const photoUrl = data.photoUrl;
                    console.log(employee)

                    $('#hr_registration #e_idx').val(employee.e_idx);
                    $('#hr_registration #name').val(employee.name || '정보 없음');
                    $('#hr_registration #tel').val(employee.tel || '정보 없음');
                    $('#hr_registration #jumin').val(employee.jumin || '정보 없음');
                    $('#hr_registration #address').val(employee.address || '정보 없음');
                    $('#hr_registration #birthday').val(employee.birthday ? new Date(employee.birthday).toISOString().split('T')[0] : '');
                    $('#hr_registration #email').val(employee.email || '정보 없음');
                    $('#hr_registration #position').val(employee.position || '정보 없음');
                    $('#hr_registration #entry_date').val(employee.entry_date ? new Date(employee.entry_date).toISOString().split('T')[0] : '');
                    $('#hr_registration #retirement_date').val(employee.retirement_date ? new Date(employee.retirement_date).toISOString().split('T')[0] : '');
                    $('#hr_registration #depa').val(employee.depa);
                    $('#hr_registration #mobile').val(employee.mobile || '정보 없음');
                    $('#hr_registration #entry_type').val(employee.entry_type || '정보 없음');
                    $('#hr_registration #salary_type').val(employee.salary_type || '정보 없음');
                    $('#hr_registration #postal_code').val(employee.postal_code || '정보 없음');
                    $('#hr_registration #workplace_phone').val(employee.workplace_phone || '정보 없음');

                    $('#hr_registration #gender').val(employee.gender || "");              
                    $('#hr_registration #employee_type').val(employee.employee_type || "");
                    $('#hr_registration #education').val(employee.education || "");        
                    $('#hr_registration #career_type').val(employee.career_type || "");    
                    $('#hr_registration #maritalStatus').val(employee.maritalStatus || "");
                    $('#hr_registration #disability').val(employee.disability || "");      
                    $('#hr_registration #depa').val(employee.d_idx || "");      

                    if (photoUrl) {
                        $('#hr_registration #previewImage').attr('src', photoUrl);
                    } else {
                        $('#hr_registration #previewImage').attr('src', '/resources/img/icon/profile-default.svg');
                    }
                },
                error: function() {
                    alert('사원 상세 정보를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        // 사원 등록하기
        $('#employeeForm').on('submit', function(e) {
            e.preventDefault();
            const form = $('#employeeForm')[0];
            const formData = new FormData(form);

            $.ajax({
                url: '/hr/register',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    addEmployeeRow(response);
                    alert("사원이 성공적으로 등록되었습니다.");
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
                data: {
                    name: name,
                    position: position,
                    depa: depa
                },
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
</script>