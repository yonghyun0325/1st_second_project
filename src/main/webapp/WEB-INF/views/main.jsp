<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 

<meta charset="UTF-8">
<!-- css, 스타일 초기화 적용  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<!-- css, 헤더, 사이드바, 캘린더, 탭 스타일  -->
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
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>FUNFUN Company</title>
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

        <div id="sidebar">
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
        </div>
        
        <div id="content">
            <div id="dashboard-content" style="display: none;">
                <%@ include file="calendar.jsp" %>
            </div>
            
            <div id="tab-content" style="display: none;">
                <div id="tab">
                    <h2 class="tab-title">내 사무실</h2>
                    
                    <div class="tab-wrapper">
                        <div id="tab-container">
                            <div id="tabs"></div>
                        </div>
                        <div id="tab-wrapper"></div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                
                // ** 사이드바 부분 스크립트
                const currentPath = window.location.pathname;
    
                if (currentPath === '/dashboard') {
                    // 대시보드일 때는 내 사무실만 보이게, 나머지 숨기기
                    $('.sidebar-item').not('.sidebar-item:has(a[href*="myoffice"])').hide();
                    $('.sidebar-item:has(a[href*="myoffice"])').show();
                    $('#dashboard-content').show();
                    $('#tab-content').hide();
                } else {
                    // 대시보드가 아닐 때는 내 사무실을 숨기고 나머지 보이게
                    $('.sidebar-item:has(a[href*="myoffice"])').hide();
                    $('.sidebar-item').not('.sidebar-item:has(a[href*="myoffice"])').show();
                    $('#dashboard-content').hide();
                    $('#tab-content').show();
                }
    
                // 사이드바 카테고리 클릭시 세부 카테고리 표시
                $('.sidebar-toggle').on('click', function () {
                    const tabId = $(this).data('cate');
                    $('#' + tabId + '-submenu').toggleClass('open');
                    $('#' + tabId + '-icon').toggleClass('rotate');
                    $('#' + tabId + '-title').toggleClass('active');
                });
    
                // 대시보드 화면에서 서브카테고리 클릭시 탭 관리 가능한 오피스 페이지로 이동
                $('.sidebar-submenu a').on('click', function (e) {
                    e.preventDefault();
                    const tabName = $(this).text();
                    let currentPath = window.location.pathname.split('/')[1];
    
                    if (currentPath !== 'myoffice') {
                        window.location.href = '/myoffice'; 
                    }
                });

                // ** 탭 부분 스크립트
                const tabContainer = $('#tab-container');
                const tabWrapper = $('#tab-wrapper');

                // 서브카테고리 클릭했을 때 탭 추가 메소드 호출
                $('.sidebar-submenu a').on('click', function (e) {
                    e.preventDefault();
                    const tabName = $(this).text();
                    const contentId = $(this).data('content');
                
                    const [category, subCategory] = contentId.split('_');
                
                    addTab(tabName, contentId);
                });
            
                // 탭 추가후 내용 불러오기
                function addTab(tabName, contentId) {
                    const existingTab = $('#tabs').find('.tab').filter(function() {
                        return $(this).attr('data-content-id') === contentId;
                    });
                
                    if (existingTab.length > 0) {
                        showTab(contentId);
                        return;
                    }
                    
                    // 새로운 탭 생성하고 tabs 컨테이너에 추가하기
                    const newTab = $('<div class="tab" data-content-id="' + contentId + '">' + tabName + ' <i class="fas fa-times"></i>');
                    $('#tabs').append(newTab);
                    
                    // 탭에 해당하는 고유한 div 생성
                    const contentDiv = $('<div class="content" id="content-' + contentId + '"></div>');
                    $('#tab-wrapper').append(contentDiv);
                        
                    // 디테일, 탭의 개수가 너무 많아지면 컨테이너 오른쪽 끝 둥근모서리 제거
                    if (tabContainer[0].scrollWidth > tabContainer[0].clientWidth) {
                        tabWrapper.css('border-top-right-radius', '0');
                    } else {
                        tabWrapper.css('border-top-right-radius', '10px');
                    }
                    
                    // 탭 클릭시 다시 내용 보여주기
                    newTab.on('click', function () {
                        showTab(contentId);
                    });
                    
                    // 탭 닫기 아이콘 클릭시 탭 닫기
                    newTab.find('.fa-times').on('click', function (e) {
                        e.stopPropagation();
                        removeTab(contentId);
                    });

                    // 탭 내용 불러오기
                    const parts = contentId.split('_');
                    const category = parts[0]; 
                    const subPage = parts[1];

                    const url = '/' + category + '/' + subPage;
                    console.log("request url: " + url)
                
                    $.ajax({
                        url: url,
                        method: 'GET',
                        success: function (data) {
                            $('#content-' + contentId).html(data);
                        },
                        error: function (jqXHR) {
                            if (jqXHR.status === 404) {
                                $('#content-' + contentId).html('<p>' + tabName + '에 대한 내용을 불러오는 탭입니다.</p>');
                            } else {
                                $('#content-' + contentId).html('<p> 내용을 불러오던 중 오류가 발생했습니다. (' + jqXHR.status + ')</p>');
                            }
                        }
                    });
                
                    // 추가 후 탭 보여주기 호출
                    showTab(contentId);
                }
            
                // 탭 닫기
                function removeTab(contentId) {
                    if ($('#tabs .tab').length <= 1) {
                        return;
                    }
                    $('[data-content-id="' + contentId + '"]').remove();
                    $('#content-' + contentId).remove();
                    showTab($('#tabs .tab:first').data('content-id'));
                
                    if (tabContainer[0].scrollWidth > tabContainer[0].clientWidth) {
                        tabWrapper.css('border-top-right-radius', '0');
                    } else {
                        tabWrapper.css('border-top-right-radius', '10px');
                    }
                }
            
                // 탭 클릭시 내용 보여주기
                function showTab(contentId) {
                    $('.content').removeClass('active');
                    $('.tab').removeClass('active');
                    $('#content-' + contentId).addClass('active');
                    $('[data-content-id="' + contentId + '"]').addClass('active');
                }
            
                // 탭 부분 많아질경우 드래그 가능
                let isDragging = false;
                let startX;
                let scrollLeft;
            
                tabContainer.on('mousedown', function (e) {
                    isDragging = true;
                    tabContainer.addClass('active');
                    startX = e.pageX - tabContainer.offset().left;
                    scrollLeft = tabContainer.scrollLeft();
                    e.preventDefault();
                });
            
                tabContainer.on('mouseleave mouseup', function () {
                    isDragging = false;
                    tabContainer.removeClass('active');
                });
            
                tabContainer.on('mousemove', function (e) {
                    if (!isDragging) return;
                    e.preventDefault();
                
                    const x = e.pageX - tabContainer.offset().left;
                    const walk = (x - startX);
                
                    tabContainer.scrollLeft(scrollLeft - walk);
                });
                
            })
        </script>
    </body>
</html>