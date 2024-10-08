<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="main.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <header>
        <div class="header_logo">
            <a href="./main.jsp">
                로고
            </a>
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
            <div class="side_item"><a href="./main.jsp">마이페이지</a></div>
            <div class="side_item"><a href="#">재무 관리</a></div>
            <div class="side_item"><a href="#">구매 관리</a></div>
            <div class="side_item">
                <a href="#" id="hrMenu">인사 관리</a>
                <ul id="hrSubMenu" class="submenu" style="display:none;">
                    <li><a href="../category_Hr/employeeRegister.jsp" id="employeeRegisterLink">사원 등록</a></li>
                </ul>
            </div>
            <div class="side_item"><a href="#">고객 관리</a></div>
            <div class="side_item"><a href="#">커뮤니티</a></div>
            <div class="side_item"><a href="#">문의 하기</a></div>
            <div class="side_item"><a href="#">공지사항</a></div>
        </div>
        <div id="contentArea" class="calender">
            <h2>10월</h2>
            <table border="1">
                <tr>
                	<th style="color:red">일요일</th>
                    <th>월요일</th>
                    <th>화요일</th>
                    <th>수요일</th>
                    <th>목요일</th>
                    <th>금요일</th>
                    <th style="color:blue">토요일</th>
                </tr>
                <tr>
                    <td class="day">30</td>
                    <td class="day">1</td>
                    <td class="day">2</td>
                    <td class="day">3</td>
                    <td class="day">4</td>
                    <td class="day">5</td>
                    <td class="day">6</td>
                </tr>
                <tr>
                    <td class="day">7</td>
                    <td class="day">8</td>
                    <td class="day">9</td>
                    <td class="day">10</td>
                    <td class="day">11</td>
                    <td class="day">12</td>
                    <td class="day">13</td>
                </tr>
                <tr>
                    <td class="day">14</td>
                    <td class="day">15</td>
                    <td class="day">16</td>
                    <td class="day">17</td>
                    <td class="day">18</td>
                    <td class="day">19</td>
                    <td class="day">20</td>
                </tr>
                <tr>
                    <td class="day">21</td>
                    <td class="day">22</td>
                    <td class="day">23</td>
                    <td class="day">24</td>
                    <td class="day">25</td>
                    <td class="day">26</td>
                    <td class="day">27</td>
                </tr>
                <tr>
                    <td class="day">28</td>
                    <td class="day">29</td>
                    <td class="day">30</td>
                    <td class="day">31</td>
                    <td class="day">1</td>
                    <td class="day">2</td>
                    <td class="day">3</td>
                </tr>
            </table>
        </div>
        <!-- 할 일 입력 모달 -->
        <div id="modal" class="modal">
            <div class="modal_content">
                <h3>할일 목록</h3>
                <hr>
                <textarea id="taskDescription"></textarea>
                <button id="saveTask">저장</button>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
        var selectedDay;
        
        // 인사관리 클릭시 토글 생성
        $('#hrMenu').click(function(event){
            event.preventDefault();
            $('#hrSubMenu').slideToggle();
        });
        
        // 모든 td 클릭 이벤트 설정 (날짜 클릭 시)
        $('.day').click(function() {
            var selectedDate = $(this).text();  // 클릭한 날짜 값 가져오기
            console.log("날짜 클릭됨: " + selectedDate);
            selectedDay = $(this);
            $('#taskDescription').val('1. ');  // 설명 초기화
            $('#modal').addClass('active');  // 모달 열기
        });

        // 자동 번호 매기기 (엔터 칠 때마다 숫자 증가)
        $('#taskDescription').keydown(function(event) {
            if (event.key === 'Enter') {
                event.preventDefault();  // 기본 엔터 동작 방지
                var lines = $(this).val().split('\n').length;  // 줄 개수 확인
                $(this).val($(this).val() + '\n' + (lines + 1) + ". ");  // 번호 추가
            }
        });

        // "1. "은 삭제하지 못하게 설정
        $('#taskDescription').on('input', function(event) {
            if (!$(this).val().startsWith('1. ')) {
                $(this).val('1. ');  // 강제로 "1. "이 항상 첫 줄에 있도록 설정
            }
        });

        // 모달 창 닫기 (클릭 이벤트)
        $(document).click(function(event) {
            if (!$(event.target).closest('.modal_content').length && !$(event.target).closest('.day').length) {
                $('#modal').removeClass('active');  // 모달 닫기
            }
        });

        // ESC 키로 모달 닫기
        $(document).keydown(function(event) {
            if (event.key === "Escape") {
                $('#modal').removeClass('active');  // ESC 키로 모달 닫기
            }
        });

        // 저장 버튼 클릭 시
        $('#saveTask').click(function() {
            if (selectedDay) {
                var taskDescription = $('#taskDescription').val();
                var taskContent = "<br><span class='task'>" + taskDescription.replace(/\n/g, "<br>") + "</span>";
                selectedDay.append(taskContent);  // 달력 셀에 할 일 저장

                // jQuery를 이용한 AJAX 요청
                $.ajax({
                    url: 'calendarProcess.jsp',  // 서버에 보낼 JSP 파일
                    type: 'POST',  // POST 요청
                    data: {
                        taskDescription: taskDescription,  // 할 일 내용
                        selectedDate: selectedDay.text()   // 선택된 날짜
                    },
                    success: function(response) {
                        console.log("서버 응답: " + response);
                        if (response === "Success") {
                            alert("할 일이 저장되었습니다.");
                            $('#modal').removeClass('active');  // 저장 후 모달 닫기
                        } else {
                            alert("할 일 저장에 실패했습니다.");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX 오류: " + error);
                    }
                });
            }
        });
    });
    </script>
</body>
</html>