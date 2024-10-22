<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<aside>
    <div class="sidebar-wrapper">

        <!-- 대시보드 메뉴 -->

        <!-- 내 사무실 이동 -->
        <div class="sidebar-item dashboard-item">
            <a href="${pageContext.request.contextPath}/myoffice" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-desktop-alt"></i>내 사무실</span>
            </a>
        </div>

        <!-- 내 회의실 이동 -->
        <div class="sidebar-item dashboard-item">
            <a href="${pageContext.request.contextPath}/cabinet" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-users-class"></i> 내 회의실</span>
            </a>
        </div>


        <!-- 내 사무실 메뉴 -->

        <!-- 인사 관리 -->
        <div class="sidebar-item myoffice-item">
            <a href="javascript:void(0)" data-cate="hr" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-user-friends"></i>인사 관리</span>
                <i id="hr-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="hr-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="hr_info">인사정보</a>
            </div>
        </div>

        <!-- 재무 관리 -->
        <div class="sidebar-item myoffice-item">
            <a href="javascript:void(0)" data-cate="financial" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-hand-holding-usd"></i> 재무 관리</span>
                <i id="financial-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="financial-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="financial_registration">급여 관리</a>
            </div>
        </div>

        <!-- 고객 관리 -->
        <div class="sidebar-item myoffice-item">
            <a href="javascript:void(0)" data-cate="customer" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-user-circle"></i>고객 관리</span>
                <i id="customer-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="customer-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="customer_registration">고객 관리</a>
            </div>
        </div>

        <!-- 구매 관리 -->
        <div class="sidebar-item myoffice-item">
            <a href="javascript:void(0)" data-cate="purchase" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-money-check"></i>구매 관리</span>
                <i id="purchase-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="purchase-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="purchase_registration">구매 관리</a>
            </div>
        </div>

        <!-- 게시판 -->
        <div class="sidebar-item myoffice-item">
            <a href="javascript:void(0)" data-cate="board" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-comments"></i>게시판</span>
                <i id="board-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="board-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="notice_notice">공지사항</a>
                <a href="javascript:void(0)" data-content="board_normal">커뮤니티</a>
            </div>
        </div>
    </div>
    
    <script>
        $(document).ready(function() {
            const currentPath = window.location.pathname;
            $('.dashboard-item').toggle(currentPath === '/dashboard');
            $('.myoffice-item').toggle(currentPath === '/myoffice');

            $('.sidebar-toggle').on('click', function () {
                const tabId = $(this).data('cate');
                $('#' + tabId + '-submenu').toggleClass('open');
                $('#' + tabId + '-icon').toggleClass('rotate');
                $('#' + tabId + '-title').toggleClass('active');
            });
        })
    </script>
</aside>