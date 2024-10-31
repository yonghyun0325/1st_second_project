<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- css, 인사등록 스타일  -->
<section id="hr_registration">
    <div class="employees-info-wrapper" style="max-width: 380px;">
        <div class="employees-info-title-wrapper">
            <h4>◇ 사원 목록</h4>
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
    </div>

    <div class="employees-info-wrapper" style="flex: 1;">
        <div class="employees-info-title-wrapper">
            <h4>◇ 사원 정보</h4>
        </div>
        <!-- 사원등록 폼 시작 -->
        <form name="employeeForm" id="employeeForm" action="${pageContext.request.contextPath}/hr/register" method="post">
            <table class="hr-employees-info table-common">
                <!-- 사진 등록 부분을 테이블 첫 번째 행으로 추가 -->
                <tr>
                    <td rowspan="6" colspan="2" id="profile-td" style="cursor: pointer;">
                        <div id="profileContainer">
                            <img id="previewImage" src="" alt="" style="width: 100%; height: 100%; border-radius: 50%; display: none;">
                            <i class="fas fa-user-circle" style="font-size: 100px; color: #ccc;"></i>
                            <input type="file" id="fileInput" accept="image/*" name="photo" style="display: none;">
                        </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">성명</td>
                    <td colspan="2"><input type="text" id="name" name="name" required></td>
                    <td colspan="2">사원번호</td>
                    <td colspan="2"><input type="text" id="e_idx" name="e_idx" disabled></td>
                </tr>
                
                <tr>
                    <td colspan="2">전화번호</td>
                    <td colspan="2"><input type="text" id="tel" name="tel" required></td>
                    <td colspan="2">주민등록번호</td>
                    <td colspan="2"><input type="text" id="jumin" name="jumin" required></td>
                </tr>

                <tr>
                    <td>생년월일</td>
                    <td colspan="2"><input type="date" id="birthday" name="birthday"></td>
                    <td>E-mail</td>
                    <td colspan="4"><input type="email" id="email" name="email"></td>
                </tr>

                <tr>
                    <td colspan="2">입사일자</td>
                    <td colspan="2"><input type="date" id="entry_date" name="entry_date"></td>
                    <td colspan="2">퇴사일자</td>
                    <td colspan="2"><input type="date" id="retirement_date" name="retirement_date"></td>
                </tr>

                <tr>
                    <td>근무지</td>
                    <td colspan="2"><input type="text" id="workplace" name="workplace"></td>
                    <td>부서</td>
                    <td colspan="2"><input type="text" id="depa" name="depa"></td>
                    <td>직위</td>
                    <td><input type="text" id="position" name="position"></td>
                </tr>

                <tr>
                    <td>주소</td>
                    <td colspan="6"><input type="text" id="address" name="address"></td>
                    <td>우편번호</td>
                    <td colspan="2"><input type="text" id="postal_code" name="postal_code"></td>
                </tr>

                <tr>
                    <td colspan="2">내선 전화번호</td>
                    <td colspan="2"><input type="text" id="workplace_phone" name="workplace_phone"></td>
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
                            <option value="" selected>선택하세요</option>
                            <option value="NEW">신입</option>
                            <option value="CAREER">경력</option>
                         </select>
                    </td>
                </tr>

                <tr>
                    <td>직원구분</td>
                    <td colspan="2">
                        <select name="employee_type">
                            <option value="" selected>선택하세요</option>
                            <option value="moderator">임원</option>
                            <option value="full-time">정규직</option>
                            <option value="contract-worker">계약직</option>
                         </select>
                    </td>
                    <td>급여구분</td>
                    <td colspan="2"><input type="text" id="salary_type" name="salary_type"></td>
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

        // 프로필 사진 변경시 섬네일 보여주기
        $('#fileInput').on('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    $('#previewImage').attr('src', e.target.result).show();
                    $('.fas.fa-user-circle').hide();
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
                url: '/employees/getEmployee/' + e_idx,
                method: 'GET',
                dataType: 'json',
                success: function(employee) {
                    $('#e_idx').val(employee.e_idx);
                    $('#name').val(employee.name);
                    $('#tel').val(employee.tel);
                    $('#jumin').val(employee.jumin);
                    $('#address').val(employee.address);
                    $('#birthday').val(employee.birthday ? new Date(employee.birthday).toISOString().split('T')[0] : '');
                    $('#email').val(employee.email);
                    $('#position').val(employee.position);
                    $('#entry_date').val(employee.entry_date ? new Date(employee.entry_date).toISOString().split('T')[0] : '');
                    $('#retirement_date').val(employee.retirement_date ? new Date(employee.retirement_date).toISOString().split('T')[0] : '');
                    $('#depa').val(employee.depa);
                    $('#mobile').val(employee.mobile);
                    $('#entry_type').val(employee.entry_type);
                    $('#bank_name').val(employee.bank_name);
                    // If photo field is part of response, show preview (optional)
                    if (employee.photo) {
                        $('#previewImage').attr('src', '/path/to/photo/' + employee.photo); // Adjust path as needed
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

});
</script>