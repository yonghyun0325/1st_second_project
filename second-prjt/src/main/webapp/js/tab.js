
$(document).ready(function () {

    // 탭 컨테이너 선언
    const tabContainer = $('#tabs-container');
    // 탭이 많아지면서 스크롤바가 생길때 둥근모서리 해제를 위한 콘텐츠 랩퍼 선언
    const contentWrapper = $('#content-wrapper');
    
    // 탭 추가
    function addTab(tabName, contentId) {
        const existingTab = $('#tabs').find('.tab').filter(function() {
            return $(this).attr('data-content-id') === contentId;
        });
        
        if (existingTab.length > 0) {
            showTab(contentId);
            return;
        } 

        const newTab = $('<div class="tab" data-content-id="' + contentId + '">' + tabName + ' <i class="fas fa-times"></i>');
        $('#tabs').append(newTab);
        
        // 탭 개수가 넘어가면 둥근모서리 해제
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

        generateTabContent(contentId, tabName);
        showTab(contentId);
    }

    // 서브카테고리 클릭했을 때 탭으로 추가
    $('.sidebar-submenu a').on('click', function () {
        const tabName = $(this).text();
        const contentId = $(this).data('content');
        const pageUrl = $(this).attr('href');

        // 다른 서브카테고리 클릭시 속한 카테고리 페이지로 이동하고
        // 아니면 탭 추가
        addTab(tabName, contentId);
    });

    // 기본 탭 한개 생성
    addTab('수당등록', 'finance1');
    
    // 탭 추가될때 내용 생성
    function generateTabContent(contentId, tabName) {
        // const contentWrapper = $('#content-wrapper');
        // const newContent = $('<div class="content" id="content-' + tabId + '"></div>')
        // contentWrapper.append(newContent);

        const contentHtml = `
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
        $('#content-wrapper').append('<div class="content" id="content-' + contentId + '">' + contentHtml + '</div>');
    }

    // 탭 닫기
    function removeTab(contentId) {
        if ($('#tabs .tab').length <= 1) {
            return;
        }
        $('[data-content-id="' + contentId + '"]').remove();
        $('#content-' + contentId).remove();
        showTab($('#tabs .tab:first').data('content-id')); 

        // 탭 개수가 넘어가면 둥근모서리 해제
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