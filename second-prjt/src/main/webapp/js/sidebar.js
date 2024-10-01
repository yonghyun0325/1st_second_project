
$(document).ready(function () {
    // 카테고리 클릭했을 때 펼치기
    function toggleSubMenu(tabId) {
        $('#' + tabId + '-submenu').toggleClass('open');
        $('#' + tabId + '-icon').toggleClass('rotate');
    }

    function openCategoryFromPath() {
        const currentPath = window.location.pathname;
        let matchedCategory = '';

        if (currentPath.includes('finance')) {
            matchedCategory = 'finance';
        } else if (currentPath.includes('purchase')) {
            matchedCategory = 'purchase';
        } else if (currentPath.includes('hr')) {
            matchedCategory = 'hr';
        } else if (currentPath.includes('community')) {
            matchedCategory = 'community';
        }

        // 경로에 맞는 카테고리 자동으로 펼치기
        if (matchedCategory) {
            toggleSubMenu(matchedCategory);
        }
    }

    $('.sidebar-toggle').on('click', function () {
        const tabId = $(this).data('cate');
        toggleSubMenu(tabId);
    });

    openCategoryFromPath();
});