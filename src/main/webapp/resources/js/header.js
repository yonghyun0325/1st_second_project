$(document).ready(function() {
    const currentPath = window.location.pathname;
    const title = currentPath === '/dashboard' ? '대시보드' : currentPath === '/myoffice' ? '내 사무실' : '내 회의실'
    $('.workspace-title').text(title);

    $('.dashboard-item').toggle(currentPath === '/dashboard');
    $('.myoffice-item').toggle(currentPath === '/myoffice');
    
    $('.header_logo').on('click', function() {
        const mainWrapper = $('#main-wrapper');
        mainWrapper.toggleClass('sidebar-hidden');
        $(this).toggleClass('sidebar-hidden');
    });

    $('.sidebar-toggle').on('click', function () {
        const tabId = $(this).data('cate');
        $('#' + tabId + '-submenu').toggleClass('open');
        $('#' + tabId + '-icon').toggleClass('rotate');
    });
})