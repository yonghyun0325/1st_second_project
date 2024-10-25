
$(document).ready(function() {
    const tabHead = $('#tab-head');
    const tabBody = $('#tab-body');

    // 페이지 로드시 로컬 스토리지에 저장된 탭 정보 복원
    restoreTab();

    // 서브카테고리 클릭했을 때 탭 추가 메소드 호출
    $('.sidebar-submenu a').on('click', function (e) {
        e.preventDefault();
        const tabName = $(this).text();
        const contentId = 'thead-' + $(this).data('content');
        const existingTab = $('#tab-head').find('#' + contentId); 
    
        if (existingTab.length > 0) {
            showTab(contentId.replace('thead-', ''));
            return;
        }
    
        addTab(tabName, contentId.replace('thead-', ''));
    });

    // 탭 추가후 내용 불러오기
    function addTab(tabName, contentId, isActive = true) {
        const newThead = $('<div class="tab" id="thead-' + contentId + '">' + tabName + ' <i class="fas fa-times"></i>');
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
        if (isActive) showTab(contentId);
        
        saveTab();
    }

    // 탭 내용 불러오기
    function loadTab(tabName, contentId) {
        const [maincate, subcate] = contentId.split('_');
    
        $.ajax({
            url: '/' + maincate + '/' + subcate,
            method: 'GET',
            success: function (data) {
                $('#tbody-' + contentId).html(data);
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
    
        const activeTabId = $('#tab-head .tab.active').attr('id').replace('thead-', '');

        $('#thead-' + contentId).remove();
        $('#tbody-' + contentId).remove();

        if (contentId === activeTabId) {
            const lastTab = $('#tab-head .tab:last').attr('id').replace('thead-', '');
            showTab(lastTab);
        } else {
            showTab(activeTabId);
        }
        
        // 탭 일정개수 늘어나면 둥근모서리 효과 추가
        let radius = tabHead[0].scrollWidth > tabHead[0].clientWidth ? '0' : '10px'
        tabBody.css('border-top-right-radius', radius);

        saveTab();
    }

    // 탭 클릭시 내용 보여주기
    function showTab(contentId) {
        $('.tbody').removeClass('active');
        $('.tab').removeClass('active');
        $('#tbody-' + contentId).addClass('active');
        $('#thead-' + contentId).addClass('active');
    }

    // 탭 저장
    function saveTab() {
        const tabs = [];
        $('#tab-head .tab').each(function() {
            const tabName = $(this).text().trim();
            const contentId = $(this).attr('id').replace('thead-', '');
            tabs.push({ tabName, contentId });
        });
        localStorage.setItem('tabs', JSON.stringify(tabs));
    }

    // 탭 복원
    function restoreTab() {
        const savedTabs = localStorage.getItem('tabs');
        if (savedTabs) {
            const tabs = JSON.parse(savedTabs);

            if (tabs.length > 0) {
                const lastIndex = tabs.length - 1;
                tabs.forEach((tab, index) => {
                    addTab(tab.tabName, tab.contentId, index === lastIndex);
                });
            }
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