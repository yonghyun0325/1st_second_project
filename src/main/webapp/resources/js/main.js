
$(document).ready(function() {
                
    // ------- 현재 경로에 따라 헤더 타이틀 변경
    const currentPath = window.location.pathname;

    if (currentPath === '/dashboard') {
        $('.sidebar-item').not('.sidebar-item:has(a[href*="myoffice"])').hide();
        $('.sidebar-item:has(a[href*="myoffice"])').show();
        $('#dashboard-content').show();
        $('#tab-content').hide();
        $('.workspace-title').text('대시보드');
    } else {
        $('.sidebar-item:has(a[href*="myoffice"])').hide();
        $('.sidebar-item').not('.sidebar-item:has(a[href*="myoffice"])').show();
        $('#dashboard-content').hide();
        $('#tab-content').show();
        $('.workspace-title').text('내 사무실');
    }
    
    // ------- 사이드바 부분 스크립트

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

    // -------- 탭 부분 스크립트
    const tabHead = $('#tab-head');
    const tabBody = $('#tab-body');

    // 페이지 로드시 로컬 스토리지에 저장된 탭 정보 복원
    restoreTabs();

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
        const existingTab = $('#tab-head').find('.tab').filter(function() {
            return $(this).attr('data-content-id') === contentId;
        });
    
        if (existingTab.length > 0) {
            showTab(contentId);
            return;
        }
        
        // 탭 머리와 몸통 생성해서 추가하기
        const newThead = $('<div class="tab" data-content-id="' + contentId + '">' + tabName + ' <i class="fas fa-times"></i>');
        const newTbody = $('<div class="tbody" id="tbody-' + contentId + '"></div>');
        $('#tab-head').append(newThead);
        $('#tab-body').append(newTbody);
            
        // 탭 클릭시 다시 내용 보여주기
        newThead.on('click', function () {
            showTab(contentId);
        });
        
        // 탭 닫기 아이콘 클릭시 탭 닫기
        newThead.find('.fa-times').on('click', function (e) {
            e.stopPropagation();
            removeTab(contentId);
        });

        // 탭 내용 불러오기
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
    
        // 추가 후 탭 보여주기 호출
        showTab(contentId);

        // 디테일, 탭의 개수가 너무 많아지면 컨테이너 오른쪽 끝 둥근모서리 제거
        if (tabHead[0].scrollWidth > tabHead[0].clientWidth) {
            tabBody.css('border-top-right-radius', '0');
        } else {
            tabBody.css('border-top-right-radius', '10px');
        }

        // 탭 추가될때마다 로컬 스토리지에 저장
        saveTabs();
    }
    
    // 탭 저장
    function saveTabs() {
        const tabs = [];
        $('#tab-head .tab').each(function() {
            const tabName = $(this).text().trim();
            const contentId = $(this).data('content-id');
            tabs.push({ tabName, contentId });
        });
        localStorage.setItem('tabs', JSON.stringify(tabs));
    }

    // 탭 복원
    function restoreTabs() {
        const savedTabs = localStorage.getItem('tabs');
        if (savedTabs) {
            const tabs = JSON.parse(savedTabs);
            tabs.forEach(tab => {
                addTab(tab.tabName, tab.contentId);
            });
        }
    }

    // 탭 닫기
    function removeTab(contentId) {
        if ($('#tab-head .tab').length <= 1) {
            return;
        }
        $('[data-content-id="' + contentId + '"]').remove();
        $('#tbody-' + contentId).remove();
        showTab($('#tab-head .tab:first').data('content-id'));
    
        if (tabHead[0].scrollWidth > tabHead[0].clientWidth) {
            tabBody.css('border-top-right-radius', '0');
        } else {
            tabBody.css('border-top-right-radius', '10px');
        }
        saveTabs();
    }

    // 탭 클릭시 내용 보여주기
    function showTab(contentId) {
        $('.tbody').removeClass('active');
        $('.tab').removeClass('active');
        $('#tbody-' + contentId).addClass('active');
        $('[data-content-id="' + contentId + '"]').addClass('active');
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