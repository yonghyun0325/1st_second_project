<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 

<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>FUNFUN Office</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- css  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

        <!-- js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery -->
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

        <!-- icon -->
        <script src="https://kit.fontawesome.com/d7e414b2e7.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
    </head>
    <body>
        <header>
            <!-- 대시보드 (홈) 으로 이동 -->
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

        <aside>
            <div class="sidebar-wrapper">
        
                <!-- 탭 관리페이지 이동 -->
                <div class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/myoffice" class="sidebar-toggle">
                        <span class="sidebar-item-title"><i class="fas fa-user-circle"></i> 내 사무실</span>
                    </a>
                </div>

                <!-- 재무 관리 -->
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="financial" class="sidebar-toggle">
                        <span class="sidebar-item-title"><i class="fas fa-hand-holding-usd"></i> 재무 관리</span>
                        <i id="financial-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="financial-submenu" class="sidebar-submenu">
                        <a href="javascript:void(0)" data-content="financial_registration">급여 관리</a>
                    </div>
                </div>
        
                <!-- 구매 관리 -->
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="purchase" class="sidebar-toggle">
                        <span class="sidebar-item-title"><i class="fas fa-money-check"></i>구매 관리</span>
                        <i id="purchase-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="purchase-submenu" class="sidebar-submenu">
                        <a href="#">구매 주문</a>
                        <a href="#">구매 보고서</a>
                    </div>
                </div>
        
                <!-- 인사 관리 -->
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="hr" class="sidebar-toggle">
                        <span class="sidebar-item-title"><i class="fas fa-user-friends"></i>인사 관리</span>
                        <i id="hr-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="hr-submenu" class="sidebar-submenu">
                        <a href="javascript:void(0)" data-content="hr_registration">인사등록</a>
                        <a href="javascript:void(0)" data-content="hr_info">인사정보</a>
                    </div>
                </div>
        
                <!-- 게시판 -->
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="board" class="sidebar-toggle">
                        <span class="sidebar-item-title"><i class="fas fa-comments"></i>게시판</span>
                        <i id="board-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="board-submenu" class="sidebar-submenu">
                        <a href="javascript:void(0)" data-content="board_notice">공지사항</a>
                        <a href="javascript:void(0)" data-content="board_normal">커뮤니티</a>
                        <a href="javascript:void(0)" data-content="board_lost">분실물 신고</a>
                    </div>
                </div>
        
                <!-- 문의하기 -->
                <div class="sidebar-item">
                    <a href="#" class="sidebar-toggle">
                        <span class="sidebar-item-title"><i class="fas fa-phone-alt"></i>문의하기</span>
                    </a>
                </div>
            </div>
        </aside>
        
        <div id="content">
            <div id="dashboard-content" style="display: none;">
                <%@ include file="calendar.jsp" %>
            </div>
            
            <div id="tab-content" style="display: none;">
                <div id="tab-head"></div>
                <div id="tab-body"></div>
            </div>
        </div>
    </body>
</html>