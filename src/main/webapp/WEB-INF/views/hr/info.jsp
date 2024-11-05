<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%>

<%
    EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");
    int e_idx = (employees != null) ? employees.getE_idx() : 0;
%>

<!-- css, 인사정보 스타일 -->
<section id="hr_info" class="section-common">
    <div class="table-wrapper" style="flex: 1;">
        <!-- 로그인 사용자 정보를 표시하고 수정할 수 있는 폼 -->
        <form name="employeeForm" id="employeeForm_info" method="post">
            <table class="hr-employees-info table-common">

                <!-- 성명, 사원번호, 생년월일 등 기본 정보 -->
                <tr>
                    <td>성명</td>
                    <td colspan="2"><input type="text" id="name" name="name" required></td>
                    <td>사원번호</td>
                    <td colspan="2"><input type="text" id="e_idx" name="e_idx" disabled></td>
                    <td>생년월일</td>
                    <td colspan="3"><input type="date" id="birthday" name="birthday"></td>
                </tr>

                <!-- 기타 필드 -->
                <tr>
                    <td>전화번호</td>
                    <td colspan="3"><input type="text" id="mobile" name="mobile" required></td>
                    <td>주민번호</td>
                    <td colspan="3"><input type="text" id="jumin" name="jumin" required></td>
                    <td>성별</td>
                    <td>
                        <select name="gender" id="gender">
                            <option value="">선택</option>
                            <option value="male">남자</option>
                            <option value="female">여자</option>
                        </select>
                    </td>
                </tr>

                <!-- 이메일, 부서, 직위 -->
                <tr>
                    <td>E-mail</td>
                    <td colspan="3"><input type="email" id="email" name="email"></td>
                    <td>부서</td>
                    <td><input type="text" id="depa" name="depa" readonly></td>
                    <td>직위</td>
                    <td><input type="text" id="position" name="position"></td>
                </tr>

                <!-- 기타 정보 입력 -->
                <tr>
                    <td>근무지</td>
                    <td colspan="3"><input type="text" id="workplace" name="workplace"></td>
                    <td>직원구분</td>
                    <td colspan="2">
                        <select name="employee_type" id="employee_type">
                            <option value="">선택</option>
                            <option value="moderator">임원</option>
                            <option value="full-time">정규직</option>
                            <option value="contract-worker">계약직</option>
                         </select>
                    </td>
                    <td>급여구분</td>
                    <td colspan="2"><input type="text" id="salary_type" name="salary_type"></td>
                </tr>

                <tr>
                    <td colspan="2">입사일자</td>
                    <td colspan="3"><input type="date" id="entry_date" name="entry_date"></td>
                    <td colspan="2">퇴사일자</td>
                    <td colspan="3"><input type="date" id="retirement_date" name="retirement_date"></td>
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
                        <select name="education" id="education">
                            <option>고등학교</option>
                            <option>대학교</option>
                            <option>대학원</option>
                        </select>
                    </td>
                    <td>채용구분</td>
                    <td colspan="2">
                        <select name="career_type" id="career_type">
                            <option value="">선택하세요</option>
                            <option value="NEW">신입</option>
                            <option value="CAREER">경력</option>
                         </select>
                    </td>
                </tr>

                <tr>
                    <td>결혼여부</td>
                    <td>
                        <select name="maritalStatus" id="maritalStatus">
                           <option value="">선택</option>
                           <option value="single">미혼</option>
                           <option value="married">기혼</option>
                        </select>
                    </td>

                    <td>장애여부</td>
                    <td>
                        <select name="disability" id="disability">
                           <option value="">선택</option>
                           <option value="Y">Y</option>
                           <option value="N">N</option>
                        </select>
                    </td>
                </tr>
                
            </table>
            <div class="hr_registration_crud">
                <button type="button" id="editButton">수정</button>
                <button type="button" id="saveButton" style="display: none;">저장</button>
                <input type="reset" value="다시 작성" style="display: none;">
            </div>
        </form>
    </div>
</section>

<script>
    $(document).ready(function() {

        const e_idx = <%= e_idx %>;

        function loadEmployeeInfo() {
            $.ajax({
                url: '/employees/getEmployeeDetails/' + e_idx,
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    const employee = data.employee;

                    $('#hr_info #e_idx').val(employee.e_idx);
                    $('#hr_info #name').val(employee.name);
                    $('#hr_info #birthday').val(employee.birthday ? new Date(employee.birthday).toISOString().split('T')[0] : '');
                    $('#hr_info #mobile').val(employee.mobile);
                    $('#hr_info #jumin').val(employee.jumin);
                    $('#hr_info #gender').val(employee.gender);
                    $('#hr_info #email').val(employee.email);
                    $('#hr_info #depa').val(employee.depa).prop('readonly', true);
                    $('#hr_info #position').val(employee.position);
                    $('#hr_info #workplace').val(employee.workplace);
                    $('#hr_info #employee_type').val(employee.employeeType);
                    $('#hr_info #salary_type').val(employee.salaryType);
                    $('#hr_info #entry_date').val(employee.entryDate ? new Date(employee.entryDate).toISOString().split('T')[0] : '');
                    $('#hr_info #retirement_date').val(employee.retirementDate ? new Date(employee.retirementDate).toISOString().split('T')[0] : '');
                    $('#hr_info #address').val(employee.address);
                    $('#hr_info #postal_code').val(employee.postalCode);
                    $('#hr_info #tel').val(employee.tel);
                    $('#hr_info #education').val(employee.education);
                    $('#hr_info #career_type').val(employee.careerType);
                    $('#hr_info #maritalStatus').val(employee.maritalStatus);
                    $('#hr_info #disability').val(employee.disability);
                },
                error: function() {
                    alert('사용자 정보를 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        loadEmployeeInfo();

        $('#editButton').on('click', function() {
            $('#employeeForm input, #employeeForm select').not('#depa').prop('readonly', false);
            $('#fileInput, #saveButton, input[type="reset"]').show();
            $(this).hide();
        });

        $('#saveButton').on('click', function() {
            const formData = new FormData($('#employeeForm')[0]);

            $.ajax({
                url: '/employees/updateProcess.do',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    alert("저장되었습니다.");
                    loadEmployeeInfo();
                    $('#editButton').show();
                    $('#fileInput, #saveButton, input[type="reset"]').hide();
                    $('#employeeForm input, #employeeForm select').prop('readonly', true);
                },
                error: function() {
                    alert("저장 중 오류가 발생했습니다.");
                }
            });
        });

        $('#profileContainer').on('click', function() {
            $('#fileInput').trigger('click');
        });

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
    });
</script>
