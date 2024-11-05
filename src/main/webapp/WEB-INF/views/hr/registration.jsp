<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/resources/js/hr.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hr.css">

<!-- css, 인사등록 스타일  -->
<section id="hr_registration" class="section-common">
    <div class="table-wrapper" style="width: 330px;">
        <div class="list-title-wrapper">
            <h3>◇ 사원 목록</h3>
            <div class="button-bundle">
                <a href="javascript:void(0)" class="hr_registration_addition">추가</a>
                <a href="javascript:void(0)" class="hr_registration_update">수정</a>
                <a href="javascript:void(0)" class="hr_registration_delete">삭제</a>
            </div>
        </div>
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