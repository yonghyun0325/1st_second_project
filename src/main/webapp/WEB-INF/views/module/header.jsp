<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 

<% 
    EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");
    int e_idx = (employees != null) ? employees.getE_idx() : 0;
    int permission = (employees != null) ? employees.getPermission() : 0;
%>

<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">

<header data-eidx="<%= e_idx %>" data-permission="<%= permission %>">
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
                <img id="profileImage" src="/resources/img/icon/profile-default.svg" alt="기본 프로필 사진">
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
                <div class="header-profile-menu-img">
                    <img id="profileMenuImage" src="/resources/img/icon/profile-default.svg" alt="기본 프로필 사진">
                </div>
                <div class="profile-info">
                    <p id="profileName"></p>
                </div>
            </div>
            <table class="user-info-table">
                <tr>
                    <th>사원 번호</th>
                    <td><div id="profileEIdx"></div></td>
                </tr>
                <tr>
                    <th>직급</th>
                    <td><div id="profilePosition"></div></td>
                </tr>
                <tr>
                    <th>부서</th>
                    <td><div id="profileDepa"></div></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><div id="profileEmail"></div></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><div id="profileMobile"></div></td>
                </tr>
                <tr>
                    <th>사용자 구분</th> 
                    <td><div id="profileRole"></div></td>
                </tr>
            </table>
            <a href="/employees/logout.do" class="logout-btn">로그아웃</a>
        </div>
    </div>
</header>