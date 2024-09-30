<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <!-- noto sans 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    
    <!-- 폰트어썸 아이콘 -->
    <script src="https://kit.fontawesome.com/d7e414b2e7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
    
    <%-- JQuery --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <head>
        <title>급여 관리 페이지</title>
        <script>
            $(document).ready(function () {
                // 임시, 현재 페이지에 맞는 서브 카테고리 기본으로 펼쳐짐
                toggleSubMenu('finance');
                addTab('급여계산/대장', 'salary');

                // 서브 메뉴 펼치기, 접기
                function toggleSubMenu(tabId) {
                    $('#' + tabId + '-submenu').toggleClass('open');
                    $('#' + tabId + '-icon').toggleClass('rotate');
                }

                // 탭 추가
                function addTab(tabName, contentId) {
                    if ($('#' + contentId + '-tab').length) {
                        showTab(contentId);
                        return;
                    }

                    const newTab = $('<div class="tab" id="' + contentId + '-tab">' + tabName + ' <span class="close-icon">x</span></div>');
                    $('#tabs').append(newTab);

                    newTab.on('click', function () {
                        showTab(contentId);
                    });

                    newTab.find('.close-icon').on('click', function (e) {
                        e.stopPropagation();
                        removeTab(contentId);
                    });

                    generateTabContent(contentId, tabName);
                    showTab(contentId);
                }

                // 탭 추가될때 내용 생성
                function generateTabContent(contentId, tabName) {
                    const contentHtml = `
                        <h2>${tabName}</h2>
                        <table>
                            <thead>
                                <tr><th>사원 이름</th><th>급여</th><th>지급 날짜</th></tr>
                            </thead>
                            <tbody>
                                <tr><td>홍길동</td><td>3,000,000 원</td><td>2024-09-30</td></tr>
                                <tr><td>이순신</td><td>4,000,000 원</td><td>2024-09-30</td></tr>
                            </tbody>
                        </table>
                    `;
                    $('#content-wrapper').append(`<div class="content" id="${contentId}">${contentHtml}</div>`);
                }

                // 탭 닫기
                function removeTab(contentId) {
                    if ($('#tabs .tab').length <= 1) {
                        return;
                    }
                    $('#' + contentId + '-tab').remove();
                    $('#' + contentId).remove();
                    showTab($('#tabs .tab:first').attr('id').replace('-tab', ''));
                }

                // 탭 클릭시 내용 보여주기
                function showTab(contentId) {
                    $('.content').removeClass('active');
                    $('.tab').removeClass('active');
                    $('#' + contentId).addClass('active');
                    $('#' + contentId + '-tab').addClass('active');
                }

                $('.sidebar-toggle').on('click', function () {
                    const tabId = $(this).data('tab');
                    toggleSubMenu(tabId);
                });

                $('.sidebar-submenu a').on('click', function () {
                    const tabName = $(this).text();
                    const contentId = $(this).data('content');
                    addTab(tabName, contentId);
                });
            });
        </script>
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
                    <a href="javascript:void(0)" onclick="toggleSubMenu('finance')" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-hand-holding-usd"></i> 재무 관리</div>
                        <i id="finance-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="finance-submenu" class="sidebar-submenu">
                        <a href="javascript:void(0)" onclick="addTab('수당등록', 'salary')">수당등록</a>
                        <a href="javascript:void(0)" onclick="addTab('공제등록', 'salary')">공제등록</a>
                        <a href="javascript:void(0)" onclick="addTab('급여계산/대장', 'salary')">급여계산/대장</a>
                        <a href="javascript:void(0)" onclick="addTab('성과급/보너스', 'salary')">성과급/보너스</a>
                        <a href="javascript:void(0)" onclick="addTab('사원별 급여조회', 'salary')">사원별 급여조회</a>
                        <a href="javascript:void(0)" onclick="addTab('급여계산/대장', 'salary')">급여현황</a>
                        <a href="javascript:void(0)" onclick="addTab('급여현황', 'salary')">급여 명세서</a>
                        <a href="javascript:void(0)" onclick="addTab('근무확정현황', 'salary')">근무확정현황</a>
                        <a href="javascript:void(0)" onclick="addTab('급여이체현황', 'salary')">급여이체현황</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <a href="javascript:void(0)" onclick="toggleSubMenu('purchase')" class="sidebar-toggle">
                        <div class="sidebar-item-title"><i class="fas fa-money-check"></i>구매 관리</div>
                        <i id="purchase-icon" class="fas fa-chevron-right"></i>
                    </a>
                    <div id="purchase-submenu" class="sidebar-submenu">
                        <a href="#">구매 주문</a>
                        <a href="#">구매 보고서</a>
                    </div>
                </div>
                <div class="sidebar-item">
                    <a href="javascript:void(0)" onclick="toggleSubMenu('hr')" class="sidebar-toggle">
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
                    <a href="javascript:void(0)" onclick="toggleSubMenu('community')" class="sidebar-toggle">
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
        
            <h2 class="content-title">재무 관리 페이지</h2>
            
            <div class="content-wrapper">
                <div id="tabs">
                    <div id="salary-tab" class="tab active" onclick="showTab('salary')">급여계산/대장</div>
              </div>
            </div>
        </div>
    </body>
       
    </html>