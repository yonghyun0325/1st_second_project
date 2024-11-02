<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 

<% 
    EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");
%>

<style>
    /* -----------------------------------------
            헤더 스타일시트: header.css
    ----------------------------------------- */

    header {
        width: 100%;
        height: 60px;
        background-color: var(--funfun-blue);
        display: flex;
        flex-shrink: 0;
        color: var(--funfun-white);
        justify-content: space-between;
        align-items: center;
    }

    .header_logo {
        text-align: center;
    }

    .header_logo i {
        padding: 5px;
    }

    .header_UserName {
        text-align: center;
        font-size: 1em;
    }

    .header_logout {
        font-size: 1em;
    }

    .header-right-side {
        font-size: 1.8em;
        align-items: center;
        font-weight: bold;
        display: flex;
        gap: 10px;
        margin-left: 20px;
    }

    .header_title {
        align-items: center;
        display: flex;
        gap: 10px;
    }

    .header-left-side {
        display: flex;
        align-items: center;
        margin-right: 20px;
        gap: 20px;
    }

    .header-left-item {
        padding: 6px 13px;
        border: 1px solid #ffffff88;
        border-radius: 5px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        transition: background-color 0.3s ease;
    }

    .header-left-item:hover {
        background: var(--funfun-blue-dark);
    }

    .header-left-item i {
        font-size: 27px;
    }


    #clock-container {
        display: flex;
        align-items: center;
        cursor: pointer;
    }

    #clock {
        font-size: 18px;
        color: #fff;
        display: none; /* 처음에는 숨김 상태 */
    }

    .header-profile-icon {
        cursor: pointer;
        font-size: 20px;
    }

    .header-profile-img {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        overflow: hidden;
        border: 2px solid #fff;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .header-profile-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border: none;
    }

    .header-profile-name {
        font-size: 18px;
        margin-left: 10px;
    }

    .header-profile-menu {
        display: none;
        position: absolute;
        right: 10px;
        top: 60px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        width: 250px;
        padding: 15px;
        z-index: 100;
        text-align: left;
    }

    .header-profile-menu.show {
        display: block;
    }

    .header-menu-profile-img {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        overflow: hidden;
        background: var(--funfun-blue);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .profile-header {
        display: flex;
        align-items: center;
        gap: 20px;
        margin-bottom: 20px;
    }

    .profile-info p {
        margin: 0;
        color: #333;
    }

    .permission {
        color: #888;
        font-size: 14px;
    }

    .user-info-table {
        width: 100%;
        margin: 10px 0;
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        border-collapse: collapse;
    }

    .user-info-table th, .user-info-table td {
        padding: 5px;
        font-size: 14px;
        line-height: 1.2;
        font-weight: 400;
    }

    .user-info-table th {
        text-align: left;
        color: #333;
        font-weight: normal;
    }

    .user-info-table td {
        text-align: right;
        color: #666;
    }

    .logout-btn {
        display: block;
        width: 100%;
        padding: 8px;
        margin-top: 20px;
        background-color: var(--funfun-blue);
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 18px;
        text-align: center;
    }

</style>

<header>
    <div class="header-right-side">
        <a href="javascript:void(0)" class="sidbar-expand-btn">
            <div class="hamburger">
                <span class="bar"></span>
                <div class="line-with-triangle">
                    <div class="triangle"></div>
                    <div class="half-bars">
                        <span class="bar"></span>
                        <span class="bar"></span>
                    </div>
                </div>
                <span class="bar"></span>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/" class="header_title">
            <i class="far fa-laugh"></i>
            <div class="header-title">
                FFOffice DEMO
            </div>
        </a>
    </div>
    <div class="header-left-side">

        <div id="clock-container" class="header-left-item" onclick="toggleClockDisplay()">
            <i class="fal fa-clock"></i>
            <div id="clock"></div>
        </div>


        <div id="header-profile-btn" class="header-left-item">
            <div class="header-profile-img">
                <img src="/resources/img/icon/profile-default.svg" alt="기본 프로필 사진">
            </div>
            <span class="header-profile-name">
                <% 
                    if (employees != null && employees.getName() != null) {
                        out.print(employees.getName() + " 님");
                    } else {
                        out.print("FUNFUN 님");
                    }
                %>
            </span>
        </div>

        <div class="header-profile-menu" id="header-profile-menu">
            <div class="profile-header">
                <div class="header-menu-profile-img">
                    <img src="/resources/img/icon/profile-default.svg" alt="기본 프로필 사진">
                </div>
                <div class="profile-info">
                    <p>
                        <% if (employees != null && employees.getName() != null) {
                            out.print(employees.getName());
                        } %>
                    </p>
                </div>
            </div>
            <table class="user-info-table">
                <tr>
                    <th>사원 번호</th>
                    <td><% out.print(employees.getE_idx()); %></td>
                </tr>
                <tr>
                    <th>직급</th>
                    <td><% out.print(employees.getPosition()); %></td>
                </tr>
                <tr>
                    <th>부서</th>
                    <td><% out.print(employees.getDepa()); %></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><% out.print(employees.getEmail()); %></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><% out.print(employees.getTel()); %></td>
                </tr>
                <tr>
                    <th>사용자 구분</th> 
                    <td>
                        <% 
                            if (employees != null) {
                                String role = "";
                                switch (employees.getPermission()) {
                                    case 0: role = "사원"; break;
                                    case 1: role = "인사담당자"; break;
                                    case 2: role = "관리자"; break;
                                }
                                out.print(role);
                            } 
                        %>
                    </td>
                </tr>
            </table>
            <a href="/employees/logout.do" class="logout-btn">로그아웃</a>
        </div>
    </div>
</header>
<script>

    function updateClock() {
        const now = new Date();
        const koreaTime = new Date(now.toLocaleString("en-US", { timeZone: "Asia/Seoul" }));
        const year = koreaTime.getFullYear();
        const month = String(koreaTime.getMonth() + 1).padStart(2, '0');
        const day = String(koreaTime.getDate()).padStart(2, '0');
        const hours = String(koreaTime.getHours()).padStart(2, '0');
        const minutes = String(koreaTime.getMinutes()).padStart(2, '0');
        const seconds = String(koreaTime.getSeconds()).padStart(2, '0');
        
        const formattedTime = year + "년 " + month + "월 " + day + "일 " + hours + "시 " + minutes + "분 " + seconds + "초";
        
        $('#clock').text(formattedTime);
    }

    $(document).ready(function() {
        setInterval(updateClock, 1000);
        updateClock();

        $('#header-profile-btn').on('click', function(event) {
            $('#header-profile-menu').toggleClass('show');
            event.stopPropagation();
        });

        $(document).on('click', function(event) {
            const $dropdown = $('#header-profile-menu');
            if (!$dropdown.is(event.target) && $dropdown.has(event.target).length === 0 && !$('.header-left-item').is(event.target)) {
                $dropdown.removeClass('show');
            }
        });

        $('#clock-container').on('click', function() {
            $('#clock').toggle();
            $(this).find('i').toggle();
        });
    });
</script>