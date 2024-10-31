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

<div class="gadget" id="chatWidget">
    <div class="gadget-header">
        <h3 class="gadget-title">채팅</h3>
        <button class="gadget-toggle" onclick="toggleGadget('chatWidget')">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content" id="chatContent">
            <ul id="chatMessages"></ul>
        </div>
        <div class="chat-input-container">
            <input type="text" id="chatUsername" placeholder="이름" />
            <input type="text" id="chatMessage" placeholder="메시지를 입력하세요" />
            <button id="sendMessage">전송</button>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

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


        // 채팅 메시지 가져오기 함수
        function loadChatMessages() {
            $.ajax({
                url: '/loadChatMessages', // 서버에 저장된 채팅 메시지를 가져오는 엔드포인트
                method: 'GET',
                success: function (data) {
                    const chatMessages = $('#chatMessages');
                    chatMessages.empty();
                    data.forEach(msg => {
                        const message = $('<li>').text(msg.username + ": " + msg.message);
                        chatMessages.append(message);
                    });
                    $('#chatContent').scrollTop($('#chatContent')[0].scrollHeight);
                },
                error: function () {
                    console.error("채팅 메시지를 가져오는 중 오류가 발생했습니다.");
                }
            });
        }

        // 메시지 전송 버튼 클릭 시
        $('#sendMessage').on('click', function () {
            const username = $('#chatUsername').val().trim();
            const message = $('#chatMessage').val().trim();

            if (username === '' || message === '') {
                alert('이름과 메시지를 입력하세요.');
                return;
            }

            $.ajax({
                url: '/sendMessage', // 서버에 메시지를 전송하는 엔드포인트
                method: 'POST',
                data: { username: username, message: message },
                success: function () {
                    $('#chatMessage').val(''); // 메시지 입력 필드 초기화
                    loadChatMessages(); // 메시지 목록 갱신
                },
                error: function () {
                    alert("메시지 전송에 실패했습니다.");
                }
            });
        });

        // 5초마다 새로운 채팅 메시지 불러오기
        setInterval(loadChatMessages, 5000);
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