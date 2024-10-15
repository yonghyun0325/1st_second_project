<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="sidebar">
    <div class="sidebar-wrapper">
        <div class="sidebar-item">
            <a href="${pageContext.request.contextPath}/" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-user-circle"></i> 대시보드</span>
            </a>
        </div>
        <div class="sidebar-item">
            <a href="javascript:void(0)" data-cate="financial" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-hand-holding-usd"></i> 재무 관리</span>
                <i id="financial-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="financial-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="financial_1">수당등록</a>
                <a href="javascript:void(0)" data-content="financial_2">공제등록</a>
                <a href="javascript:void(0)" data-content="financial_3">급여계산/대장</a>
                <a href="javascript:void(0)" data-content="financial_4">성과급/보너스</a>
                <a href="javascript:void(0)" data-content="financial_5">사원별 급여조회</a>
                <a href="javascript:void(0)" data-content="financial_6">급여 현황</a>
                <a href="javascript:void(0)" data-content="financial_7">급여 명세서</a>
                <a href="javascript:void(0)" data-content="financial_8">근무 확정현황</a>
                <a href="javascript:void(0)" data-content="financial_9">급여 이체현황</a>
                <a href="javascript:void(0)" data-content="financial_10">비과세 관리</a>
                <a href="javascript:void(0)" data-content="financial_11">초과 근무</a>
            </div>
        </div>
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
        <div class="sidebar-item">
            <a href="javascript:void(0)" data-cate="hr" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-user-friends"></i>인사 관리</span>
                <i id="hr-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="hr-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="hr_1">인사정보</a>
                <a href="javascript:void(0)" data-content="hr_2">인사정보등록</a>
                <a href="javascript:void(0)" data-content="hr_3">인사기록</a>
                <a href="javascript:void(0)" data-content="hr_4">교육관리</a>
                <a href="javascript:void(0)" data-content="hr_5">교육평가</a>
                <a href="javascript:void(0)" data-content="hr_6">인사발령</a>
                <a href="javascript:void(0)" data-content="hr_7">사원정보</a>
                <a href="javascript:void(0)" data-content="hr_8">상별현황</a>
                <a href="javascript:void(0)" data-content="hr_9">입퇴사현황</a>
                <a href="javascript:void(0)" data-content="hr_10">책정임금현황</a>
                <a href="javascript:void(0)" data-content="hr_11">근속년수현황</a>
                <a href="javascript:void(0)" data-content="hr_12">교육현황</a>
            </div>
        </div>
        <div class="sidebar-item">
            <a href="javascript:void(0)" data-cate="community" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-comments"></i>커뮤니티</span>
                <i id="community-icon" class="fas fa-chevron-right"></i>
            </a>
            <div id="community-submenu" class="sidebar-submenu">
                <a href="javascript:void(0)" data-content="community_1">커뮤니티 홈</a>
                <a href="javascript:void(0)" data-content="community_2">가입한 커뮤니티</a>
                <a href="javascript:void(0)" data-content="community_3">커뮤니티 만들기</a>
            </div>
        </div>
        <div class="sidebar-item">
            <a href="#" class="sidebar-toggle">
                <span class="sidebar-item-title"><i class="fas fa-phone-alt"></i>문의하기</span>
            </a>
        </div>
    </div>
</div>

<script>
    // 사이드바 모듈화에 따른 동적 기능 추가
    $(document).ready(function () {
        // 카테고리 클릭했을 때 펼치기
        $('.sidebar-toggle').on('click', function () {
            const tabId = $(this).data('cate');
            $('#' + tabId + '-submenu').toggleClass('open');
            $('#' + tabId + '-icon').toggleClass('rotate');
            $('#' + tabId + '-title').toggleClass('active');
        });
        
        // 서브카테고리 클릭했을때 현재 경로와 다르면 이동
        $('.sidebar-submenu a').on('click', function (e) {
            e.preventDefault();

            let targetPage = $(this).data('content');

            if (targetPage) {
                let newPath = "/" + targetPage.split('_')[0];
                console.log(newPath)
                
                if (!newPath.endsWith('/')) {
                    newPath += '/';
                }
                const currentPath = window.location.pathname;

                if (currentPath !== newPath) {
                    window.location.href = newPath;
                }
            }
        });
        
        // 주소에서 카테고리 추출
        function getPath() {
            const currentPath = window.location.pathname;
            const pathSegments = currentPath.split('/');

            if (pathSegments.length >= 2) {
                return pathSegments[1].split('_')[0];
            }
            return '';
        }
        
        // 주소와 맞는 카테고리 자동 펼치기
        function openDefaultCate() {
            const matchedCategory = getPath();
        
            if (matchedCategory) {
                $('#' + matchedCategory + '-submenu').addClass('open'); 
                $('#' + matchedCategory + '-icon').addClass('rotate');
                $('#' + matchedCategory + '-title').addClass('active');
            }
        }
        
        openDefaultCate();
    });
</script>