<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- noto sans 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- 폰트어썸 아이콘 -->
<script src="https://kit.fontawesome.com/d7e414b2e7.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<header>
    <div class="header-right-side">
        <div class="header_logo">
            <i class="far fa-laugh"></i>
        </div>
        <div class="header-title">
            FUNFUN Office
        </div>
    </div>
    <div class="header-left-side">
        <div class="header_UserName">
            <% 
                EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");
                if (employees != null && employees.getEmp_name() != null) {
                    out.print(employees.getEmp_name() + " 님");
                } else {
                    out.print("로그인된 사용자가 없습니다.");
                }
            %>
        </div>
        <div class="header_logout">
            <a href="/member/logout.do" class="logout_item">
                로그아웃
            </a>
        </div>
    </div>
</header>