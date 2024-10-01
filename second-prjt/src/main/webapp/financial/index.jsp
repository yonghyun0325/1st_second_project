<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">
    <!-- noto sans 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    
    <!-- 폰트어썸 아이콘 -->
    <script src="https://kit.fontawesome.com/d7e414b2e7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
    
    <%-- JQuery --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script src="../js/sidebar.js"></script> <%-- 사이드바 스크립트 --%>
    <script src="../js/tab.js"></script> <%-- 사이드바 스크립트 --%>

    <%-- css --%>
    <link rel="stylesheet" href="style.css">

    <head>
        <title>급여 관리 페이지</title>
    </head>

    <body>
        <%-- 공통 헤더 적용 --%>
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
                    <% String userName=(String) session.getAttribute("userName"); if (userName !=null) { out.print(userName
                        + " 님" ); } else { out.print("로그인된 사용자가 없습니다."); } %>
                </div>
                <div class="header_logout">
                    <a href="../login/login.jsp" class="logout_item">
                        로그아웃
                    </a>
                </div>
            </div>
        </header>

        <div id="sidebar">
            <div class="sidebar-wrapper">
                <div class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/main/main.jsp" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-user-circle"></i> 대시보드</div>
                    </a>
                </div>
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="finance" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-hand-holding-usd"></i> 재무 관리</div>
                        <i id="finance-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="finance-submenu" class="sidebar-submenu">
                        <a href="javascript:void(0)" data-content="finance1">수당등록</a>
                        <a href="javascript:void(0)" data-content="finance2">공제등록</a>
                        <a href="javascript:void(0)" data-content="finance3">급여계산/대장</a>
                        <a href="javascript:void(0)" data-content="finance4">성과급/보너스</a>
                        <a href="javascript:void(0)" data-content="finance5">사원별 급여조회</a>
                        <a href="javascript:void(0)" data-content="finance6">급여현황</a>
                        <a href="javascript:void(0)" data-content="finance7">급여 명세서</a>
                        <a href="javascript:void(0)" data-content="finance8">근무확정현황</a>
                        <a href="javascript:void(0)" data-content="finance9">급여이체현황</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="purchase" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-money-check"></i>구매 관리</div>
                        <i id="purchase-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="purchase-submenu" class="sidebar-submenu">
                        <a href="#">구매 주문</a>
                        <a href="#">구매 보고서</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="hr" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-user-friends"></i>인사 관리</div>
                        <i id="hr-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="hr-submenu" class="sidebar-submenu">
                        <a href="#">인사정보등록</a>
                        <a href="#">인사기록</a>
                        <a href="#">교육관리</a>
                        <a href="#">교육평가</a>
                        <a href="#">인사발령</a>
                        <a href="#">사원정보</a>
                        <a href="#">상별현황</a>
                        <a href="#">입퇴사현황</a>
                        <a href="#">책정임금현황</a>
                        <a href="#">근속년수현황</a>
                        <a href="#">교육현황</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <a href="javascript:void(0)" data-cate="community" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-comments"></i>커뮤니티</div>
                        <i id="community-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="community-submenu" class="sidebar-submenu">
                        <a href="${pageContext.request.contextPath}/community/communityMain.jsp">커뮤니티 홈</a>
                        <a href="#">가입한 커뮤니티</a>
                        <a href="#">커뮤니티 만들기</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <a href="#" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-phone-alt"></i>문의하기</div>
                    </a>
                </div>
            </div>
        </div>

        <div id="content">
        
            <h2 class="content-title">재무 관리</h2>
            
            <div class="content-wrapper">
                <div id="tabs-container">
                    <div id="tabs"></div>
                </div>
                <div id="content-wrapper"></div>
            </div>
        </div>
    </body>
       
    </html>