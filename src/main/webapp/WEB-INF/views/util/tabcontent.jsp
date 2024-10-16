<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="content">
        
    <h2 class="content-title"> </h2>
    
    <div class="content-wrapper">
        <div id="tabs-container">
            <div id="tabs"></div>
        </div>
        <div id="content-wrapper"></div>
    </div>
</div>

<script>
    $(document).ready(function () {
        const tabContainer = $('#tabs-container');
        const contentWrapper = $('#content-wrapper');
    
        // 서브카테고리 클릭했을 때 현재 경로와 같으면 탭 추가
        $('.sidebar-submenu a').on('click', function (e) {
            e.preventDefault();
            const tabName = $(this).text();
            const contentId = $(this).data('content');

            const [category, subCategory] = contentId.split('_');
            let currentPath = window.location.pathname.split('/')[1];

            if (currentPath === category) {
                addTab(tabName, contentId, category);
            }
        });

        // 탭 추가
        function addTab(tabName, contentId, mainCategory) {
            const existingTab = $('#tabs').find('.tab').filter(function() {
                return $(this).attr('data-content-id') === contentId;
            });
        
            if (existingTab.length > 0) {
                showTab(contentId);
                return;
            }
        
            const newTab = $('<div class="tab" data-content-id="' + contentId + '">' + tabName + ' <i class="fas fa-times"></i>');
            $('#tabs').append(newTab);
            
            if (tabContainer[0].scrollWidth > tabContainer[0].clientWidth) {
                contentWrapper.css('border-top-right-radius', '0');
            } else {
                contentWrapper.css('border-top-right-radius', '10px');
            }
        
            newTab.on('click', function () {
                showTab(contentId);
            });
        
            newTab.find('.fa-times').on('click', function (e) {
                e.stopPropagation();
                removeTab(contentId);
            });
        
            $('.content-title').text(mainCategory);
        
            loadTabContent(tabName, contentId);
            showTab(contentId);
        }
    
        // 탭 추가될때 내용 생성
        function loadTabContent(tabName, contentId) {
            const contentDiv = $('<div class="content" id="content-' + contentId + '"></div>');
            $('#content-wrapper').append(contentDiv);
        
            // contentId에서 카테고리와 서브 페이지를 구분하기 위한 작업
            const parts = contentId.split('_');
            console.log("parts: " + parts)
            const category = parts[0]; // 카테고리 (예: 'community')
            const subPage = parts[1] || 'home'; // 서브 페이지가 없을 경우 기본값 'home' 사용
        
            // URL을 유동적으로 생성
            const url = '/' + category + '/' + subPage;
            console.log("Loading content from URL:", url); // 디버깅용
        
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
                contentWrapper.css('border-top-right-radius', '0');
            } else {
                contentWrapper.css('border-top-right-radius', '10px');
            }
        }
    
        // 탭 클릭시 내용 보여주기
        function showTab(contentId) {
            $('.content').removeClass('active');
            $('.tab').removeClass('active');
            $('#content-' + contentId).addClass('active');
            $('[data-content-id="' + contentId + '"]').addClass('active');
        }
    
        function openFirstCate() {
            // 기본적으로 1개는 열기
            const firstSubcategory = $('.sidebar-submenu:visible a:first');
            if (firstSubcategory.length > 0) {
                const tabName = firstSubcategory.text();
                const contentId = firstSubcategory.data('content');
                const mainCategory = firstSubcategory.closest('.sidebar-item').find('.sidebar-item-title').text().trim();
                addTab(tabName, contentId, mainCategory);
            }
        }
    
        openFirstCate();
    
        // 드래그 기능 구현
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
    
    });
</script>