<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <%@ include file="module/head.jsp" %>
    <title>FUNFUN Office - 내 사무실</title>

    <body>
        <!-- 헤더 -->
        <%@ include file="module/header.jsp" %>

        <!-- 사이드 바 -->
        <%@ include file="module/sidebar.jsp" %>
        
        <main>
            <div id="tab-head"></div>
            <div id="tab-body"></div>
        </main>
    </body>

    <script>
        $(document).ready(function() {
            const tabHead = $('#tab-head');
            const tabBody = $('#tab-body');
        
            // 페이지 로드시 로컬 스토리지에 저장된 탭 정보 복원
            restoreTab();
        
            // 서브카테고리 클릭했을 때 탭 추가 메소드 호출
            $('.sidebar-submenu a').on('click', function (e) {
                e.preventDefault();
                const tabName = $(this).text();
                const contentId = $(this).data('content');
                const existingTab = $('#tab-head').find('.tab').filter(function() {
                    return $(this).attr('data-content-id') === contentId;
                });
            
                if (existingTab.length > 0) {
                    showTab(contentId);
                    return;
                }
            
                addTab(tabName, contentId);
            });
        
            // 탭 추가후 내용 불러오기
            function addTab(tabName, contentId) {
                const newThead = $('<div class="tab" data-content-id="' + contentId + '">' + tabName + ' <i class="fas fa-times"></i>');
                const newTbody = $('<div class="tbody" id="tbody-' + contentId + '"></div>');
                $('#tab-head').append(newThead);
                $('#tab-body').append(newTbody);

                // 탭 일정개수 늘어나면 둥근모서리 효과 삭제
                let radius = tabHead[0].scrollWidth > tabHead[0].clientWidth ? '0' : '10px'
                tabBody.css('border-top-right-radius', radius);
                
                // 탭 클릭시 다시 내용 보여주기
                newThead.on('click', function () {
                    showTab(contentId);
                });

                // 탭 닫기 아이콘 클릭시 탭 닫기
                newThead.find('.fa-times').on('click', function (e) {
                    e.stopPropagation();
                    removeTab(contentId);
                });
            
                // 내용 불러오고 탭 보여주기
                loadTab(tabName, contentId);
                showTab(contentId);
                saveTab();
            }
        
            // 탭 내용 불러오기
            function loadTab(tabName, contentId) {
                const parts = contentId.split('_');
                const category = parts[0]; 
                const subPage = parts[1];
            
                const url = '/' + category + '/' + subPage;
                console.log("(main.jsp) 요청 url: " + url)
            
                $.ajax({
                    url: url,
                    method: 'GET',
                    success: function (data) {
                        $('#tbody-' + contentId).html(data);
                        console.log("(main.jsp) " + subPage + ".jsp 페이지 데이터 받음")
                    },
                    error: function (jqXHR) {
                        if (jqXHR.status === 404) {
                            $('#tbody-' + contentId).html('<p>' + tabName + '에 대한 내용을 불러오는 탭입니다.</p>');
                        } else {
                            $('#tbody-' + contentId).html('<p> 내용을 불러오던 중 오류가 발생했습니다. (' + jqXHR.status + ')</p>');
                        }
                    }
                });
            }

            // 탭 닫기
            function removeTab(contentId) {
                if ($('#tab-head .tab').length <= 1) return;
            
                $('[data-content-id="' + contentId + '"]').remove();
                $('#tbody-' + contentId).remove();
            
                showTab($('#tab-head .tab:first').data('content-id'));
                saveTab();
            
                // 탭 일정개수 늘어나면 둥근모서리 효과 추가
                let radius = tabHead[0].scrollWidth > tabHead[0].clientWidth ? '0' : '10px'
                tabBody.css('border-top-right-radius', radius);
            }
        
            // 탭 클릭시 내용 보여주기
            function showTab(contentId) {
                $('.tbody').removeClass('active');
                $('.tab').removeClass('active');
                $('#tbody-' + contentId).addClass('active');
                $('[data-content-id="' + contentId + '"]').addClass('active');
            }
        
            // 탭 저장
            function saveTab() {
                const tabs = [];
                $('#tab-head .tab').each(function() {
                    const tabName = $(this).text().trim();
                    const contentId = $(this).data('content-id');
                    tabs.push({ tabName, contentId });
                });
                localStorage.setItem('tabs', JSON.stringify(tabs));
            }
        
            // 탭 복원
            function restoreTab() {
                const savedTabs = localStorage.getItem('tabs');
                if (savedTabs) {
                    const tabs = JSON.parse(savedTabs);
                    tabs.forEach(tab => {
                        addTab(tab.tabName, tab.contentId);
                    });
                }
            }
        
            // 탭 부분 많아질경우 드래그 가능
            let isDragging = false;
            let startX;
            let scrollLeft;
        
            tabHead.on('mousedown', function (e) {
                isDragging = true;
                tabHead.addClass('active');
                startX = e.pageX - tabHead.offset().left;
                scrollLeft = tabHead.scrollLeft();
                e.preventDefault();
            });
        
            tabHead.on('mouseleave mouseup', function () {
                isDragging = false;
                tabHead.removeClass('active');
            });
        
            tabHead.on('mousemove', function (e) {
                if (!isDragging) return;
                e.preventDefault();
            
                const x = e.pageX - tabHead.offset().left;
                const walk = (x - startX);
            
                tabHead.scrollLeft(scrollLeft - walk);
            });
        })
    </script>
</html>