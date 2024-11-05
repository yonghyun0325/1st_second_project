<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    
/* -----------------------------------------
        사이드바 스타일시트: sidebar.css
----------------------------------------- */

/* 사이드 바 */

aside {
    width: 230px;
    font-size: 1.2em;
    font-weight: bold;
    background: var(--funfun-midnight);
}

.hamburger {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    gap: 4px;
    width: 28px;
    height: 28px;
    cursor: pointer;
    margin-right: 15px;
}

.bar {
    width: 100%;
    height: 4px;
    background-color: white;
    border-radius: 2px;
}

.half-bars {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.line-with-triangle {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    width: 100%;
    gap: 5px;
}

.triangle {
    width: 0;
    height: 0;
    border-radius: 2px;
    border-top: 6px solid transparent;
    border-bottom: 6px solid transparent;
    border-right: 9px solid white;
}

.sidebar-collapsed .triangle {
    transform: rotate(180deg);
}

aside.sidebar-collapsed {
    display: none;
}

.sidebar-wrapper {
    margin-bottom: 0;
    padding: 10px;
    display: flex;
    gap: 5px;
    flex-direction: column;
}

.sidebar-header {
    display: flex;
    gap: 20px;
    align-items: center;
    justify-content: center;
    padding: 10px 15px 15px 15px;
    border-bottom: 1px solid #ffffff33;
}

.sidebar-home-btn {
    padding: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: var(--funfun-white);
    border: 1px solid var(--funfun-white);
    border-radius: 10px;
    font-size: 24px;
    transition: background-color 0.3s ease;
}

.sidebar-home-btn:hover {
    background: #152a42
}

.workspace-title {
    color: var(--funfun-white);
    font-weight: bold;
    font-size: 24px;
}

.sidebar-item {
    color: var(--funfun-white);
    padding: 10px 15px;
    border-radius: 5px;
    transition: all .2s ease;
}

.sidebar-item:hover {
    background-color: #00000044;
}

.sidebar-item:last-of-type {
    margin-bottom: 0;
}

.sidebar-item-title {
    display: flex;
    gap: 10px;
    justify-content: space-between;
    align-items: center;
}

.sidebar-item-title i {
    width: 25px;
    text-align: center;
}

.sidebar-toggle {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.sidebar-submenu {
    display: none;
    padding-left: 20px;
    margin-top: 5px;
}

.sidebar-submenu.open {
    display: block;
}

.sidebar-submenu a::before {
    content: '';
    position: absolute;
    left: -15px;
    top: 50%;
    width: 10px;
}

.sidebar-submenu a {
    display: flex;
    font-size: 0.9em;
    align-items: center;
    text-decoration: none;
    margin-left: 3px;
    padding: 5px;
    position: relative;
    font-weight: 400;
}

.sidebar-submenu a:hover {
    font-weight: bold;
}

.sidebar-submenu a:last-child::before {
    content: '└';
    left: -20px;
    top: 50%;
    transform: translateY(-50%);
}

.sidebar-submenu a:not(:last-child)::before {
    content: '├';
    left: -20px;
    top: 50%;
    transform: translateY(-50%);
}

.rotate {
    transform: rotate(90deg);
    transition: transform 0.3s ease;
}

.fa-chevron-right {
    transition: transform 0.3s ease;
}

</style>

<% 
    int userPermission = (employees != null) ? employees.getPermission() : -1;
%>

<aside>
    <div class="sidebar-wrapper">
        <div class="sidebar-header">
            <div class="workspace-title"></div>
            <a href="/"><i class="fas fa-home-lg-alt sidebar-home-btn"></i></a>
        </div>
        
        <div id="sidebar-menu"></div>
    </div>
</aside>

<script>
    $(document).ready(function () {
        const userPermission = <%= userPermission %>;
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
                {
                    title: "구매 관리", icon: "fas fa-money-check", submenu: [
                        { title: "구매 관리", dataContent: "purchase_registration" }
                    ]
                },
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

        // 사이드바 확장/축소 토글
        $('.sidbar-expand-btn').on('click', function () {
            $('aside').toggleClass('sidebar-collapsed');
            $('.hamburger').toggleClass('sidebar-collapsed')
        });
    });
</script>
