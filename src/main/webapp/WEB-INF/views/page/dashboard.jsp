<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .gadget {
        border-radius: 10px;
        border: 1px solid #bbb;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        position: absolute;
        background: white;
        overflow: hidden;
    }

    .gadget.minimized {
        height: auto; 
        width: 230px; 
    }

    .gadget.minimized .gadget-body {
        display: none;
    }

    .gadget.minimized .gadget-header {
        border-bottom: none;
    }

    .gadget-header {    
        padding: 10px;
        border-bottom: 1px solid #bbb;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .gadget-title {
        font-size: 1em;
        text-align: left;
        margin: 0;
        flex-grow: 1;
        margin-left: 15px;
    }

    .gadget-toggle {
        cursor: pointer;
        font-size: 1.2em;
        background: none;
        border: none;
        outline: none;
        padding: 0;
        margin-left: 10px;
        color: black;
        padding: 2px 8px;
    }

    .gadget-toggle:hover {
        color: white;
    }

    .gadget-body {
        width: 100%;
        height: 100%;
        padding: 10px;
    }

    .gadget-content {
        width: 100%;
        height: 100%;
        overflow: auto;
        padding: 10px;
    }
    
    .gadget-content::-webkit-scrollbar {
        width: 6px;
        height: 6px;
    }

    .gadget-content::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 10px;
    }

    .gadget-content::-webkit-scrollbar-thumb {
        background-color: #b3b3b3;
        border-radius: 10px;
        transition: background-color 0.3s ease;
    }

    .gadget-content::-webkit-scrollbar-thumb:hover {
        background-color: #808080;
    }

    #noticeList {
        list-style: none;
        padding: 0;
    }

    #noticeList li {
        background-color: #ffffff;
        border-radius: 8px;
        padding: 10px;
        margin-bottom: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        cursor: pointer;
        transition: all 0.3s ease;
    }

    #noticeList li:hover {
        background-color: #e8f4ff;
        color: #0073e6;
        transform: scale(1.02);
    }

    #noticeList li::before {
        content: "📌 ";
        font-size: 1.2em;
        margin-right: 5px;
    }

    #favoriteRoomList {
        list-style: none;
        padding: 0;
    }

    #favoriteRoomList li {
        height: 150px;
        padding: 15px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        margin-bottom: 10px;
        cursor: pointer;
    }

    #favoriteRoomList li:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .cabinet-card-title {
        display: flex;
        justify-content: space-between;
    }

    .cabinet-card-title strong {
        font-size: 1.2em;
        color: #000000;
    }

    .cabinet-description {
        font-size: 0.9em;
        color: #666;
        margin-top: 10px;
    }

    .favorite-btn {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 1.2em;
        color: #ccc;
        transition: transform 0.3s ease;
        padding: 0;
    }

    .favorite-btn:hover {
        color: gold;
    }

</style>

<div class="gadget" id="calendar">
    <div class="gadget-header">
        <h3 class="gadget-title">나의 일정 관리</h3>
        <button class="gadget-toggle" onclick="toggleGadget('calendar')">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content">
            <%@ include file="../module/calendar.jsp" %>
        </div>
    </div>
</div>

<div class="gadget" id="topNotices">
    <div class="gadget-header">
        <h3 class="gadget-title">사내 공지사항</h3>
        <button class="gadget-toggle" onclick="toggleGadget('topNotices')">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content">
            <ul id="noticeList"></ul>
        </div>
    </div>
</div>

<div class="gadget" id="favoriteRooms">
    <div class="gadget-header">
        <h3 class="gadget-title">내 회의실</h3>
        <button class="gadget-toggle" onclick="toggleGadget('favoriteRooms')">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content">
            <ul id="favoriteRoomList"></ul>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        const e_idx = "${e_idx}";

        $(function() {
            $(".gadget").draggable({
                containment: "main",
                stack: ".gadget",
                grid: [5, 5],
                stop: function(event, ui) {
                    const id = $(this).attr("id");
                    localStorage.setItem(id + "_position", JSON.stringify(ui.position));
                }
            });

            $(".gadget").resizable({
                stop: function(event, ui) {
                    const id = $(this).attr("id");
                    localStorage.setItem(id + "_size", JSON.stringify(ui.size));
                }
            });

            $(".gadget").each(function() {
                const id = $(this).attr("id");
                const position = localStorage.getItem(id + "_position");
                const size = localStorage.getItem(id + "_size");

                if (position) {
                    const { top, left } = JSON.parse(position);
                    $(this).css({ top, left, position: "absolute" });
                }

                if (size) {
                    const { width, height } = JSON.parse(size);
                    $(this).css({ width, height });
                }
            });
        });

        $.ajax({
            url: '/board/noticeList',
            type: 'GET',
            success: function(data) {
                var noticeList = $('#noticeList');
                noticeList.empty();
                data.forEach(function(notice) {
                    var listItem = $('<li>').text(notice.title);
                    listItem.on('click', function() {
                        const tabs = JSON.parse(localStorage.getItem('tabs')) || [];
                        if (!tabs.some(tab => tab.contentId === 'board_notice')) {
                            tabs.push({ tabName: '공지사항', contentId: 'board_notice' });
                            localStorage.setItem('tabs', JSON.stringify(tabs));
                        }
                        window.location.href = '/myoffice';
                    });
                    noticeList.append(listItem);
                });
            },
            error: function() {
                $('#noticeList').html('<li>공지사항을 불러오는 데 실패했습니다.</li>');
            }
        });

        function loadFavoriteRooms() {
            $.ajax({
                url: '/cabinet/getFavoriteList',
                type: 'GET',
                data: { e_idx: e_idx },
                success: function (data) {
                    const favoriteRoomList = $('#favoriteRoomList');
                    favoriteRoomList.empty();
                    
                    if (data.length > 0) {
                        data.forEach(room => {
                            const listItem = $('<li>').addClass('cabinet-card').append(
                                $('<div>').addClass('cabinet-card-title').append(
                                    $('<strong>').text(room.title),
                                ),
                                $('<div>').addClass('cabinet-description').text(room.description)
                            );
                            favoriteRoomList.append(listItem);
                        });
                    } else {
                        favoriteRoomList.append('<li class="cabinet-card">즐겨찾기한 회의실이 없습니다.</li>');
                    }
                },
                error: function () {
                    $('#favoriteRoomList').html('<li class="cabinet-card">회의실 목록을 불러오는 데 실패했습니다.</li>');
                }
            });
        }

        loadFavoriteRooms();
        setInterval(loadFavoriteRooms, 30000);

    });

    function toggleGadget(id) {
        const gadget = $("#" + id);
        const buttonIcon = gadget.find(".gadget-toggle i");
        
        if (!gadget.hasClass("minimized")) {
            gadget.data("originalSize", { width: gadget.width(), height: gadget.height() });
            gadget.addClass("minimized");
            gadget.css({ width: "auto", height: "auto" });
            buttonIcon.removeClass("fa-compress-alt").addClass("fa-expand-alt");
            gadget.resizable("disable");
        } else {
            const originalSize = gadget.data("originalSize");
            gadget.removeClass("minimized");
            buttonIcon.removeClass("fa-expand-alt").addClass("fa-compress-alt");
            gadget.resizable("enable");
            if (originalSize) {
                gadget.css({ width: originalSize.width, height: originalSize.height });
            }
        }
    }

</script>