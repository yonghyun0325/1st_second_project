<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 

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
                FUNFUN Office
            </div>
        </a>
    </div>
    <div class="header-left-side">
        <div class="header-left-item">
            <% 
                EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");
                if (employees != null && employees.getName() != null) {
                    int permission = employees.getPermission();
                    String role = "";
                    if (permission == 0) {
                        role = "사원";
                    } else if (permission == 1) {
                        role = "인사담당자";
                    } else if (permission == 2) {
                        role = "관리자";
                    }
                    out.print(" (" + role + ") ");

                    out.print(employees.getName() + " 님");
                } else {
                    out.print("로그인된 사용자가 없습니다.");
                }
            %>
        </div>
        <a href="/employees/logout.do" class="header-left-item">
            로그아웃
        </a>
    </div>
</header>