<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 
<header>
    <a href="${pageContext.request.contextPath}/" class="header-right-side">
        <div class="header_logo">
            <i class="far fa-laugh"></i>
        </div>
        <div class="header-title">
            FUNFUN Office
        </div>
        <div class="workspace-title"></div>
    </a>
    <div class="header-left-side">
        <div class="header_UserName">
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
        <div class="header_logout">
            <button onclick="window.location.href='/employees/logout.do'">
                로그아웃
            </button>
        </div>
    </div>
</header>
<script>
    $(document).ready(function() {
        const title = window.location.pathname === '/dashboard' ? '대시보드' : window.location.pathname === '/myoffice' ? '내 사무실' : '내 회의실'
        $('.workspace-title').text(title);
    })
</script>