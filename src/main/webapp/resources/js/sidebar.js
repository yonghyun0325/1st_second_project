
$(document).ready(function () {
    const userPermission = $('header').data('permission');
    let currentPath = window.location.pathname;

    let menus = {
        "/dashboard": [
            { title: "내 사무실", icon: "fas fa-desktop-alt", path: "/myoffice" },
            { title: "내 회의실", icon: "fas fa-users-class", path: "/cabinet" }
        ],
        "/myoffice": [
            {
                title: "인사 관리", icon: "fas fa-user-friends", submenu: [
                    { title: "인사 등록", dataContent: "hr_registration" },
                    { title: "인사 정보", dataContent: "hr_info" }
                ]
            },
            {
                title: "급여 관리", icon: "fas fa-hand-holding-usd", submenu: [
                    { title: "급여 등록", dataContent: "financial_registration" },
                    { title: "급여 정보", dataContent: "financial_info" }
                ]
            },
            {
                title: "고객 관리", icon: "fas fa-user-circle", submenu: [
                    { title: "고객 관리", dataContent: "customers_info" }
                ]
            },
            // {
            //     title: "구매 관리", icon: "fas fa-money-check", submenu: [
            //         { title: "구매 관리", dataContent: "purchase_registration" }
            //     ]
            // },
            {
                title: "게시판", icon: "fas fa-comments", submenu: [
                    { title: "공지사항", dataContent: "board_notice" },
                    { title: "커뮤니티", dataContent: "board_normal" },
                    { title: "분실물", dataContent: "board_lost" }
                ]
            },
            ...(userPermission === 2 ? [
                {
                    title: "관리자", icon: "fas fa-user-shield", submenu: [
                        { title: "문의 내역", dataContent: "admin_help" },
                        { title: "부서관리", dataContent: "admin_depaset" }
                    ]
                }
            ] : [])
        ],
        "/cabinet": [
            { title: "영업부", icon: "fas fa-briefcase", depa: "영업부" },
            { title: "인사부", icon: "fas fa-user-tie", depa: "인사부" },
            { title: "기획부", icon: "fas fa-lightbulb", depa: "기획부" },
            { title: "마케팅부", icon: "fas fa-bullhorn", depa: "마케팅부" },
            { title: "개발부", icon: "fas fa-code", depa: "개발부" },
            { title: "디자인부", icon: "fas fa-paint-brush", depa: "디자인부" }
        ]
    };

    let titleMap = { "/dashboard": "대시보드", "/myoffice": "내 사무실", "/cabinet": "내 회의실" };
    $('.workspace-title').text(titleMap[currentPath]);

    let menuContainer = $("#sidebar-menu");
    
    function generateMenu(menuItems) {
        menuItems.forEach(function(item) {
            let menuHTML = '<div class="sidebar-item myoffice-item">' +
                           '<a href="' + (item.path || 'javascript:void(0)') + '" class="sidebar-toggle">' +
                           '<span class="sidebar-item-title"><i class="' + item.icon + '"></i> ' + item.title + '</span>';

            if (item.submenu) {
                menuHTML += '<i class="fas fa-chevron-right"></i></a><div class="sidebar-submenu">';
                item.submenu.forEach(function(subitem) {
                    menuHTML += '<a href="javascript:void(0)" data-content="' + subitem.dataContent + '">' + subitem.title + '</a>';
                });
                menuHTML += '</div>';
            } else {
                menuHTML += '</a>';
            }

            menuHTML += '</div>';
            menuContainer.append(menuHTML);
        
            if (currentPath === "/cabinet" && item.depa) {
                $.ajax({
                    url: "/cabinet/" + encodeURIComponent(item.depa),
                    method: "GET",
                    success: function(data) {
                        if (data.length > 0) {
                            let submenuHTML = '<div class="sidebar-submenu">';
                            data.forEach(function(room) {
                                submenuHTML += '<a href="javascript:void(0)" data-content="cabinet_' + room.id + '">' + room.name + '</a>';
                            });
                            submenuHTML += '</div>';
                            menuContainer.find(".sidebar-item").last().append(submenuHTML);
                        }
                    },
                    error: function() {
                        console.error(item.depa + " 부서의 회의실을 불러오는 중 오류가 발생했습니다.");
                    }
                });
            }
        });
    }

    if (menus[currentPath]) {
        generateMenu(menus[currentPath]);
    }

    $('.sidebar-toggle').on('click', function () {
        $(this).next('.sidebar-submenu').toggleClass('open');
        $(this).find('.fa-chevron-right').toggleClass('rotate');
    });

    $('.sidbar-expand-btn').on('click', function () {
        $('aside').toggleClass('sidebar-collapsed');
        $('.hamburger').toggleClass('sidebar-collapsed')
    });
});