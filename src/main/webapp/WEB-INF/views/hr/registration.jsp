<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .hr_registration_list{
        width: 500px;
        height: 700px;
        overflow-y: auto;
    }
    td{
        height: 40px;
    }
    .hr_registration_post{
        width: 700px;
        height: 700px;
        border: 1px solid black;
    }
    .hr_registration_post_basic{
        width: 700px;
        height: 300px;
        border: 1px solid black;
        display: flex;
    }
    .form-group label {
        display: inline-block;
        width: 120px;
    }
    .form-group input[type="text"],
    .form-group input[type="date"],
    .form-group input[type="email"],
    .form-group select {
        width: 200px;
        padding: 5px;
    }
    .form-group img {
        width: 150px;
        height: 170px;
        border: 1px solid #ccc;
        margin-right: 10px;
    }
    .form-group button {
        padding: 5px 10px;
    }
    .tabs {
        margin-top: 20px;
    }
    .tabs button {
        padding: 10px;
        background-color: #eee;
        border: 1px solid #ccc;
        margin-right: 5px;
        cursor: pointer;
    }
    .tabs button.active {
        background-color: #ddd;
    }
    img{
        display: block; 
        margin-bottom: 10px; 
        width: 150px; 
        height: 170px; 
        border: 1px solid #ccc;
        margin-left: 55px;
    }
    .hr_registration_content_wrap{
        margin-bottom: 20px;
    }
    .hr_registration_crud{
        display: flex;
        justify-content: end;
        margin: 10px;
    }
</style>
<!-- css, 인사등록 스타일  -->
<section id="registration">
    
    <div class="hr_registration_header">
        <div class="hr_registration_addition">
            추가
        </div>
        <div class="hr_registration_update">
            수정
        </div>
        <div class="hr_registration_delete">
            삭제
        </div>
    </div>

    <div class="employees-info-wrapper" style="flex: 1;">
        <h4>◇ 사원 목록</h4>
        <%@ include file="../module/employeeList.jsp" %>
    </div>

    <div class="employees-info-wrapper" style="flex: 1;">
        <!-- 사원등록 폼 시작 -->
    <form name="employeeForm" id="employeeForm" action="${pageContext.request.contextPath}/hr/register" method="post">
        <div class="hr_registration_content_second">
            <h3>사원등록</h3><br>
            <div class="hr_registration_content_wrap">
                <div class="form-group">
                    <div class="form-wrap">
                        <table>
                            <!-- 사진 등록 부분을 테이블 첫 번째 행으로 추가 -->
                            <tr>
                                <td rowspan="8" style="text-align: center;">
                                    <img id="previewImage" src="" alt="">
                                    <input type="file" id="fileInput" accept="image/*" name="photo" style="margin-top: 10px;">
                                </td>
                            </tr>
                            <tr>
                                <td><label>성명</label></td>
                                <td><input type="text" name="name" required></td>
                            </tr>
                            <tr>
                                <td><label>전화번호</label></td>
                                <td><input type="text" name="phone" required></td>
                            </tr>
                            <tr>
                                <td><label>주민번호</label></td>
                                <td><input type="text" name="ssn" required></td>
                            </tr>
                            <tr>
                                <td><label>주소</label></td>
                                <td><input type="text" name="address"></td>
                            </tr>
                            <tr>
                                <td><label>생년월일</label></td>
                                <td><input type="date" name="birth_date"></td>
                            </tr>
                            <tr>
                                <td><label>E-mail</label></td>
                                <td><input type="email" name="email"></td>
                            </tr>
                            <tr>
                                <td><label>최종학력</label></td>
                                <td>
                                    <select name="education">
                                        <option>고등학교</option>
                                        <option>대학교</option>
                                        <option>대학원</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="form-group-second">
                <table>
                    <tr>
                        <td>인사코드</td>
                        <td><input type="text" class="code-input" name="hrCode" value="20250001"></td>
                        <td>근무지</td>
                        <td><input type="text" class="highlight" name="workplace" value="(주)휴먼교육"></td>
                    </tr>
                    <tr>
                        <td>입사일자</td>
                        <td><input type="date" name="hire_date" value="2024-06-17"></td>
                        <td>근무부서</td>
                        <td><input type="text" class="highlight" name="department" value="대표이사"></td>
                    </tr>
                    <tr>
                        <td>변동일자</td>
                        <td><input type="date" name="change_date"></td>
                        <td>직무</td>
                        <td><input type="text" class="highlight" name="job"></td>
                    </tr>
                    <tr>
                        <td>근무지 전화</td>
                        <td><input type="text" name="workplace_phone"></td>
                        <td>직책</td>
                        <td><input type="text" class="highlight" name="position" value="대표이사"></td>
                    </tr>
                    <tr>
                        <td>근무지 담당</td>
                        <td><input type="text" name="manager"></td>
                        <td>비고사항</td>
                        <td><input type="text" class="comment" name="remarks"></td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td><input type="text" name="postal_code"></td>
                        <td>근무지 주소</td>
                        <td><input type="text" name="workplace_address"></td>
                    </tr>
                </table>
            </div>
            <div class="hr_registration_crud">
                <button type="submit">저장</button>
                <button type="reset">초기화</button>
            </div>
        </div>
    </form>
    </div>
</section>
<script>
    $(document).ready(function() {
    // 파일 입력 필드에 change 이벤트 추가
    document.getElementById('fileInput').addEventListener('change', function(event) {
        // 파일이 선택되면
        const file = event.target.files[0];
        if (file) {
            // FileReader 객체 생성
            const reader = new FileReader();
            
            // 파일 읽기가 완료되면 실행되는 함수
            reader.onload = function(e) {
                // img 태그의 src 속성에 파일 데이터를 설정
                document.getElementById('previewImage').src = e.target.result;
            };
            
            // 이미지 파일을 읽기 (data URL 형식으로)
            reader.readAsDataURL(file);
        }

        
        $('#employeeForm').on('submit', function(e) {
            e.preventDefault();
            saveEmployee();
        })

        function saveEmployee() {
            const form = $('#employeeForm')[0];  // jQuery로 폼 객체를 선택
            const formData = new FormData(form);  // FormData 객체 생성

            $.ajax({
                url: '/hr/register',
                method: 'POST',  // POST 방식으로 설정
                data: formData,
                processData: false,  // 데이터를 쿼리 스트링으로 변환하지 않도록 설정
                contentType: false,  // 기본 Content-Type을 사용하지 않도록 설정
                success: function (response) {
                    addEmployeeRow(response);  // 테이블에 새 행 추가
                    alert("사원이 성공적으로 등록되었습니다.");
                    $('#employeeForm')[0].reset();  // 폼 초기화
                    $('#previewImage').attr('src', '');  // 이미지 미리보기 초기화
                },
                error: function (jqXHR) {
                    console.error('Error:', jqXHR.statusText);  // 오류 발생 시 콘솔에 출력
                }
            });
        }

        // 테이블에 새 사원 행을 추가하는 함수
        function addEmployeeRow(employee) {
            const tableBody = document.querySelector('.hr_registration_list table tbody');
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${employee.hrCode}</td>
                <td>${employee.name}</td>
                <td>${employee.foreignStatus}</td>
                <td>${employee.ssn}</td>
            `;
            tableBody.appendChild(row);
        }
    });
});
</script>