<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인사 정보</title>
    <link rel="stylesheet" href="employeeRegister.css">
</head>
<body>
    <header>
        <div class="header_logo">
            로고
        </div>
        <div class="header_UserName">
            <% 
                String userName = (String) session.getAttribute("userName");
                if (userName != null) {
                    out.print(userName + " 님");
                } else {
                    out.print("로그인된 사용자가 없습니다.");
                }
            %>
        </div>
        <div class="header_logout">
            <a href="../login/login.jsp" class="logout_item">
                로그아웃
            </a>
        </div>
    </header>

    <div class="contain">
        <div class="contain_sidebar">
            <div class="side_item"><a href="main.jsp">마이페이지</a></div>
            <div class="side_item"><a href="#">재무 관리</a></div>
            <div class="side_item"><a href="#">구매 관리</a></div>
            <div class="side_item">
                <a href="#" id="hrMenu">인사 관리</a>
                <ul id="hrSubMenu" class="submenu" style="display:none;">
                    <li><a href="./employeeRegister.jsp" id="employeeRegisterLink">사원 등록</a></li>
                </ul>
            </div>
            <div class="side_item"><a href="#">고객 관리</a></div>
            <div class="side_item"><a href="#">커뮤니티</a></div>
            <div class="side_item"><a href="#">문의 하기</a></div>
            <div class="side_item"><a href="#">공지사항</a></div>
        </div>
        <div class="hr_main">
            <h1>인사정보</h1>
            <div class="hr_main_top">
                <div>
                    <table class="type_list_box">
                        <tbody>
                            <tr>
                                <td class="profile_image" rowspan="4">
                                    <span class="img_profile">
                                        <!-- 이미지 사진 -->
                                        <img src="../resources/js/토심이.PNG" alt="토심이">
                                    </span>
                                </td>
                                <th>이름</th>
                                <th>소속</th>
                                <td class="last" colspan="3">휴먼그룹</td>
                            </tr>
                            <tr>
                                <td class="name_txt" rowspan="3">
                                    <p class="kor">토심이</p>
                                    <p> </p>
                                    <p> </p>
                                    <p> </p>
                                    <p> </p>
                                </td>
                                <th class="number">사번</th>
                                <td class="number_txt"></td>
                                <th class="telephone">내선번호</th>
                                <td class="telephone_txt">070-1234-5678</td>
                            </tr>
                            <tr>
                                <th class="email">이메일</th>
                                <td class="email_txt">tosim1004@naver.com</td>
                                <th class="mobile">휴대번호</th>
                                <td class="mobile_txt">010-1234-5678</td>
                            </tr>
                            <tr>
                                <th class="rank">직위 / 직책</th>
                                <td class="rank_txt">대표이사 / </td>
                                <th class="phone">대표전화</th>
                                <td class="phone_txt last"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 인사정보 nav -->
            <div class="tab_menu_wrap">
                <div>
                    <ul class="tab_menu">
                        <li id="basic" class="active" style="display: list-item;">
                            <span>
                                <span class="txt">기본</span>
                            </span>
                        </li>
                        <li id="detail" style="display: list-item;" class="">
                            <span>
                                <span class="txt">신상</span>
                            </span>
                        </li>
                        <li id="duty" style="display: list-item;" class="">
                            <span>
                                <span class="txt">직무/담당</span>
                            </span>
                        </li>
                        <li id="appoint" style="display: list-item;" class="">
                            <span>
                                <span class="txt">발령</span>
                            </span>
                        </li>
                        <li id="career" style="display: list-item;" class="">
                            <span>
                                <span class="txt">경력</span>
                            </span>
                        </li>
                        <li id="reward" style="display: list-item;" class="">
                            <span>
                                <span class="txt">포상/징계</span>
                            </span>
                        </li>
                        <li id="evaluation" style="display: list-item;" class="">
                            <span>
                                <span class="txt">인사평가</span>
                            </span>
                        </li>
                        <li id="edu" style="display: list-item;" class="">
                            <span>
                                <span class="txt">교육</span>
                            </span>
                        </li>
                        <li id="license" style="display: list-item;" class="">
                            <span>
                                <span class="txt">자격</span>
                            </span>
                        </li>
                        <li id="language" style="display: list-item;" class="">
                            <span>
                                <span class="txt">어학</span>
                            </span>
                        </li>
                        <li id="military" style="display: list-item;" class="">
                            <span>
                                <span class="txt">병역</span>
                            </span>
                        </li>
                        <li id="abroad" style="display: list-item;" class="">
                            <span>
                                <span class="txt">해외출장</span>
                            </span>
                        </li>
                        <li id="academic" style="display: list-item;" class="">
                            <span>
                                <span class="txt">학력</span>
                            </span>
                        </li>
                        <li id="family" style="display: list-item;" class="">
                            <span>
                                <span class="txt">가족</span>
                            </span>
                        </li>
                    </ul>
                    <div class="tool_bar">
                        <span class="btn_wrap">
                            <span class="ic_classic ic_close" id="foldTab" style="display: inline-block;">▼</span>
                            <span class="ic_classic ic_open" id="unfoldTab" style="display: inline-block;">▲</span>
                        </span>
                    </div>
                </div>
            </div>
            <!-- 각 뷰화면 -->
             <div class="hr_main_second_page">
                <div>
                    <div class="hr_basic_viewForm">
                        <form id="data_form">
                            <table>
                                <tbody>
                                    <tr>
                                        <th class="col1">
                                            <span class="title_txt">입사일</span>
                                        </th>
                                        <td class="col2">
                                            <span class="wrap_date">
                                                <span class="ic ic_calendar">📅</span>
                                                <input id="hireDate" class="txt wfix_small hasDatepicker" type="date" name="hireDate" value="2024-06-17" data-prev="2024-06-17">
                                            </span>
                                         </td>
                                         <th class="col3">
                                            <span class="title_txt">직무</span>
                                        </th>
                                        <td class="col4">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="jobDuty" id="jobDuty" value="" style="display:none;">
                                        </td>
                                        <th class="col5">
                                            <span class="title_txt">직종</span>
                                        </th>
                                        <td class="col6">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="jobClassification" value="" style="display:none;">
                                        </td>
                                        <th class="col7">
                                            <span class="title_txt">직군</span>
                                        </th>
                                        <td class="col8">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="jobGroup" value="" style="display:none;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="col1">
                                            <span class="title_txt">채용구분</span>
                                        </th>
                                        <td class="col2">
                                           <span class="wrap_select">
                                              <select class="wfix_small" name="careerType">
                                                 <option value="">선택하세요</option>
                                                 <option value="NEW">신입</option>
                                                 <option value="CAREER" selected="">경력</option>
                                              </select>
                                           </span>
                                        </td>
                                        <th class="col3">
                                            <span class="title_txt">직원구분</span>
                                        </th>
                                        <td class="col4">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="employeeDiv" value="" style="display:none;">
                                        </td>
                                        <th class="col5">
                                            <span class="title_txt">급여구분</span>
                                        </th>
                                        <td class="col6">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="salaryDiv" value="" style="display:none;">
                                        </td>
                                        <th class="col7">
                                            <span class="title_txt">추천자</span>
                                        </th>
                                        <td class="col8">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="recommender" value="" style="display:none;">
                                        </td>
                                     </tr>
                                     <tr>
                                        <th class="col1">
                                            <span class="title_txt">상태</span>
                                        </th>
                                        <td class="col2">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="status" value="" style="display:none;">
                                        </td>
                                        <th class="col3">
                                            <span class="title_txt">생년월일</span>
                                        </th>
                                        <td class="col4">
                                           <div class="birthday_wrap">
                                               <span class="wrap_date">
                                                    <span class="ic ic_calendar">📅</span>
                                                    <input id="birthDay" class="txt wfix_small hasDatepicker" type="date" name="birthDay" value="2007-05-23">
                                               </span>
                                               <span class="wrap_select">
                                                  <select class="wfix_small" name="phase" style="width:40%;">
                                                     <option value="">선택하세요</option>
                                                     <option value="SOLAR">양력</option>
                                                     <option value="LUNAR">음력</option>
                                                  </select>
                                               </span>
                                           </div>
                                        </td>
                                        <th class="col5">
                                            <span class="title_txt">성별</span>
                                        </th>
                                        <td class="col6">
                                           <span class="wrap_select">
                                              <select class="wfix_small" name="gender">
                                                 <option value="">선택하세요</option>
                                                 <option value="MALE" selected="">남자</option>
                                                 <option value="FEMALE">여자</option>
                                              </select>
                                           </span>
                                        </td>            
                                        <th class="col7">
                                            <span class="title_txt">결혼여부</span>
                                        </th>
                                        <td class="col8">
                                           <span class="wrap_select">
                                              <select class="wfix_small" name="maritalStatus">
                                                 <option value="">선택하세요</option>
                                                 <option value="SINGLE" selected="">미혼</option>
                                                 <option value="MARRIED">기혼</option>
                                              </select>
                                           </span>
                                        </td>
                                     </tr>
                                     <tr>
                                        <th class="col1">
                                            <span class="title_txt">장애여부</span>
                                        </th>
                                        <td class="col2">
                                           <span class="wrap_select">
                                              <select class="wfix_small" name="disability">
                                                 <option value="">선택하세요</option>
                                                 <option value="Y">Y</option>
                                                 <option value="N" selected="">N</option>
                                              </select>
                                           </span>
                                        </td>
                                        <th class="col3">
                                            <span class="title_txt">보훈여부</span>
                                        </th>
                                        <td class="col4">
                                           <span class="wrap_select">
                                              <select class="wfix_small" name="veteransStatus">
                                                 <option value="">선택하세요</option>
                                                 <option value="Y">Y</option>
                                                 <option value="N">N</option>
                                              </select>
                                           </span>
                                        </td>
                                        <th class="col5">
                                            <span class="title_txt">퇴사일</span>
                                        </th>
                                        <td class="col6">
                                           <span class="wrap_date">
                                                <span class="ic ic_calendar">📅</span>
                                                <input id="leaveDate" class="txt wfix_small hasDatepicker" type="text" name="leaveDate" value="">
                                           </span>
                                           </span>
                                        </td>
                                        <th class="col7">
                                            <span class="title_txt">퇴직사유</span>
                                        </th>
                                        <td class="col8">
                                            <span class="txt"></span>
                                            <input class="txt w_max" type="text" name="leaveReason" value="" style="display:none;">
                                        </td>
                                     </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
             </div>
             <div class="page_action_wrap">
                <span class="btn_major" data-role="button" id="hrcard_btn_submit"><span class="txt">저장</span></span>
                <span class="btn_minor" data-role="button" id="hrcard_btn_cancel"><span class="txt">취소</span></span>   
             </div>
             
             <section>
                <div>
                    <div class="reply-wrap">
                        <header class="single_title">
                            <span class="txt">변경이력</span>
                         </header>
                         <div class="aside_wrapper_body">

                         </div>
                    </div>
                </div>
             </section>
        </div>
    </div>
</body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    const tabs = document.querySelectorAll('.tab_menu li');
    const contents = document.querySelectorAll('.tab_content');

    tabs.forEach((tab, index) => {
        tab.addEventListener('click', function() {
            // 모든 탭과 내용을 비활성화
            tabs.forEach(item => item.classList.remove('active'));
            contents.forEach(content => content.classList.remove('active'));

            // 선택된 탭과 내용 활성화
            tab.classList.add('active');
            contents[index].classList.add('active');
        });
    });
    
    const foldTab = document.getElementById('foldTab');
    const unfoldTab = document.getElementById('unfoldTab');
    const tabMenuWrap = document.querySelector('.tab_menu_wrap');

    foldTab.addEventListener('click', function() {
        // 메뉴 숨기기
        tabMenuWrap.classList.add('collapsed');
        foldTab.style.display = 'none'; // ▲ 버튼 숨기기
        unfoldTab.style.display = 'inline-block'; // ▼ 버튼 표시
    });

    unfoldTab.addEventListener('click', function() {
        // 메뉴 보이기
        tabMenuWrap.classList.remove('collapsed');
        unfoldTab.style.display = 'none'; // ▼ 버튼 숨기기
        foldTab.style.display = 'inline-block'; // ▲ 버튼 표시
    });
});
</script>
