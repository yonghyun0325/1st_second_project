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

    .gadget.minimized .gadget-toggle {
        color: var(--funfun-blue);
    }

    .gadget.pinned .gadget-pin {
        color: var(--funfun-blue);
    }

    .gadget-header {    
        padding: 0 10px;
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

    .gadget-btn {
        cursor: pointer;
        font-size: 1.2em;
        background: none;
        border: none;
        outline: none;
        padding: 0;
        margin-left: 25px;
        margin-right: 5px;
        color: black;
        padding: 2px;
        transition: all 0.3s ease;
    }

    .gadget-btn:last-of-type {
        margin-left: 3px;
        margin-right: 5px;
    }

    .gadget-btn:hover {
        color: var(--funfun-blue);
        background: none;
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
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        cursor: pointer;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    #noticeList li:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.35);
    }

    #noticeList li::before {
        content: "📢 ";
        font-size: 1.2em;
        margin-right: 5px;
    }

    #favoriteRoomList {
        list-style: none;
        padding: 0;
    }

    #favoriteRoomList li {
        height: 150px;
        min-width: 350px;
        padding: 15px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
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
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.35);
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



/* -----------------------------------------
        달력 스타일시트: calendar.css
----------------------------------------- */

#prev-month, #next-month {
    background-color: transparent;
    border: none;
    cursor: pointer;
    font-size: 18px;
    padding: 2px;
    color: black;
}

.calendar-title-wrap {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
    border-radius: 10px;
    gap: 30px;
}

#calendar {
    display: relative;
}

#calendar table {
    width: 100%;
    border-collapse: collapse;
    color: black;
    table-layout: fixed; 
    border: none;
}

#calendar tr,
#calendar td,
#calendar th {
    color: black;
    overflow: hidden;
    border-color: #bbb;
}

#calendar td {
    text-align: left;
    vertical-align: top;
    padding: 10px;
    cursor: pointer;
    height: 120px;
}

#calendar td .task {
    display: block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 100%;
    cursor: pointer;
    font-size: 16px;
}

#calendar thead tr th {
    text-align: center;
}

/* ---- 달력 할일 저장 모달 */
.cal-modal {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 600px;
    height: 300px;
    background-color: white;
    border: 1px solid #aaa;
    border-radius: 10px;
    display: none;
    z-index: 1000;
    padding: 10px;
}

.cal-modal.active {
    display: block;
}

.cal-modal_content {
    display: flex;
    flex-direction: column;
    gap: 10px;
    height: 100%;
}

.cal-modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 15px;
}

#close-cal-modal {
    cursor: pointer;
    background: none;
    border: none;
    font-size: 1.2em;
    color: #000;
    transition: color 0.3s ease;
}

#close-cal-modal:hover {
    color: var(--funfun-blue);
}

.taskDescription {
    width: 100%;
    height: 100%;
    border-bottom: 1px solid #aaa;
    border-top: 1px solid #aaa;
}

#taskDescription {
    width: 100%;
    height: 100%;
    background-color: white;
    border: none;
    resize: none;
    font-size: 16px;
    line-height: 1.5;
    padding: 15px 0;
}

#saveTask {
    margin: 0;
    margin-top: 10px;
    padding: 5px;
    cursor: pointer;
}

</style>

<div class="gadget" id="calendar">
    <div class="gadget-header">
        <h3 class="gadget-title">나의 일정 관리</h3>
        <button class="gadget-pin gadget-btn">
            <i class="fas fa-thumbtack"></i>
        </button>
        <button class="gadget-toggle gadget-btn">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content">
            <div id="calendar">
                <div class="calendar-title-wrap">
                    <button id="prev-month"><i class="fas fa-chevron-left"></i></button>
                    <h3 id="calendar-title"></h2>
                    <button id="next-month"><i class="fas fa-chevron-right"></i></button>
                </div>
                <table border="1">
                    <thead>
                        <tr>
                            <th style="color:red">일요일</th>
                            <th>월요일</th>
                            <th>화요일</th>
                            <th>수요일</th>
                            <th>목요일</th>
                            <th>금요일</th>
                            <th style="color:blue">토요일</th>
                        </tr>
                    </thead>
                    <tbody id="calendar-body">
                    </tbody>
                </table>
            </div>
            <!-- 할 일 입력 모달 -->
            <div id="cal-modal" class="cal-modal">
                <div class="cal-modal_content">
                    <div class="cal-modal-header">
                        <h3 id="cal-modal-title">할 일 목록</h3>
                        <button id="close-cal-modal" class="gadget-btn"><i class="fal fa-times"></i></button>
                    </div>
                    <div class="taskDescription">
                        <textarea id="taskDescription"></textarea>
                    </div>
                    <button id="saveTask">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="gadget" id="topNotices">
    <div class="gadget-header">
        <h3 class="gadget-title">사내 공지사항</h3>
        <button class="gadget-pin gadget-btn">
            <i class="fas fa-thumbtack"></i>
        </button>
        <button class="gadget-toggle gadget-btn">
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
        <button class="gadget-pin gadget-btn">
            <i class="fas fa-thumbtack"></i>
        </button>
        <button class="gadget-toggle gadget-btn">
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

        // 가젯 코어
        $(function() {
            $(".gadget").each(function() {
                const gadget = $(this);
                const id = gadget.attr("id");
            
                gadget.draggable({
                    containment: "main",
                    stack: ".gadget",
                    grid: [5, 5],
                    stop: function(event, ui) {
                        localStorage.setItem(id + "_position", JSON.stringify(ui.position));
                    }
                });

                gadget.resizable({
                    stop: function(event, ui) {
                        localStorage.setItem(id + "_size", JSON.stringify(ui.size));
                    }
                });

                const position = localStorage.getItem(id + "_position");
                const size = localStorage.getItem(id + "_size");

                if (position) {
                    const { top, left } = JSON.parse(position);
                    gadget.css({ top, left, position: "absolute" });
                }

                if (size) {
                    const { width, height } = JSON.parse(size);
                    gadget.css({ width, height });
                }

                if (loadPinState(id)) {
                    gadget.addClass("pinned");
                    gadget.draggable("disable");
                    gadget.resizable("disable");
                }
            });

            $(".gadget-pin").click(function () {
                const gadgetId = $(this).closest(".gadget").attr("id");
                pinGadget(gadgetId);
            });
            
            $(".gadget-toggle").click(function () {
                const gadgetId = $(this).closest(".gadget").attr("id");
                toggleGadget(gadgetId);
            });

            function loadPinState(id) {
                return localStorage.getItem(id + "_pinned") === "true";
            }

            function savePinState(id, pinned) {
                localStorage.setItem(id + "_pinned", pinned);
            }

            function pinGadget(id) {
                const gadget = $("#" + id);
                const isPinned = gadget.hasClass("pinned");

                if (isPinned) {
                    gadget.removeClass("pinned");
                    gadget.draggable("enable");
                    gadget.resizable("enable");
                    savePinState(id, false);
                } else {
                    gadget.addClass("pinned");
                    gadget.draggable("disable");
                    gadget.resizable("disable");
                    savePinState(id, true);
                }
            }
        });

        // 공지사항 가젯
        $(function() {
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
        })

        // 즐겨찾기한 회의실 가젯
        $(function() {
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
        })

        // 달력 가젯
        $(function() {
            let today = new Date();
            let currentMonth = today.getMonth();
            let currentYear = today.getFullYear();

            function fetchTasks() {
                return $.ajax({
                        url: '/calendar/getTask',
                        type: 'POST',
                        dataType: 'json'
                    });
            }

            function displayTasks(tasks, currentMonth, currentYear) {
                tasks.forEach((task) => {
                    const [taskYear, taskMonth, taskDay] = task.task_date.split('-').map(Number);  // task_date를 년, 월, 일로 나눔
                    $('#calendar-body').find('td').each(function() {
                        const cellDay = parseInt($(this).text());  // 달력 셀의 날짜
                        if (cellDay === taskDay && currentMonth === (taskMonth - 1) && currentYear === taskYear) {  // 년, 월, 일 비교
                            let taskContent = "<br><span class='task'>" + task.task_description.replace(/\n/g, "<br>") + "</span>";
                            $(this).append(taskContent);  // 할 일 내용을 달력 셀에 추가
                        }
                    });
                });
            }   

            function generateCalendar(month, year, tasks) {
                const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
                const firstDay = new Date(year, month).getDay();
                const daysInMonth = 32 - new Date(year, month, 32).getDate();

                $('#calendar-title').text(year + "년 " + monthNames[month]);
                $('#calendar-body').empty();

                let date = 1;

                for (let i = 0; i < 6; i++) {
                    let row = $('<tr></tr>');

                    for (let j = 0; j < 7; j++) {
                        if (i === 0 && j < firstDay) {
                            row.append('<td></td>');
                        } else if (date > daysInMonth) {
                            break;
                        } else {
                            let cell = $('<td></td>').text(date);
                            cell.addClass('day');
                            if (j === 0) {
                                cell.css('color', 'red');
                            }
                            if (j === 6) {
                                cell.css('color', 'blue');
                            }
                            row.append(cell);
                            date++;
                        }
                    }

                    $('#calendar-body').append(row);
                }
                displayTasks(tasks, currentMonth, currentYear);
            }

            function updateCalendar(month, year) {
                fetchTasks().done(function(tasks) {
                    generateCalendar(month, year, tasks);
                });
            }
        
            updateCalendar(currentMonth, currentYear);

            $('#prev-month').on('click', function() {
                currentMonth--;
                if (currentMonth < 0) {
                    currentMonth = 11;
                    currentYear--;
                }
                updateCalendar(currentMonth, currentYear);
            });

            $('#next-month').on('click', function() {
                currentMonth++;
                if (currentMonth > 11) {
                    currentMonth = 0;
                    currentYear++;
                }
                updateCalendar(currentMonth, currentYear);
            });

            const modal = $('#cal-modal');
            const taskDescription = $('#taskDescription');
            let selectedDay;

            $(document).keydown(function(event) {
                if (event.key === "Escape") {
                    $('#cal-modal').removeClass('active');
                }
            });

            $('#close-cal-modal').on('click', function() {
                modal.removeClass('active');
            });

            $('#calendar-body').on('click', 'td.day', function () {
                let selectedDay = $(this);
                let dayText = selectedDay.text().trim().match(/^\d+/);
                let dayNumber = dayText ? dayText[0] : '';

                let selectedDate = currentYear + '-' + String(currentMonth + 1).padStart(2, '0') + '-' + String(dayNumber).padStart(2, '0');
                let existingTask = selectedDay.find('.task').text();
                        
                const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
                const formattedDate = monthNames[currentMonth] + " " + dayNumber + "일의 할일";
                $('#cal-modal-title').text(formattedDate);

                taskDescription.val(existingTask);
                modal.addClass('active');

                $('#saveTask').off('click').on('click', function() {
                    saveTask(selectedDate, existingTask);
                });
            });

            function saveTask(selectedDate, existingTask) {
                const taskDescriptionValue = taskDescription.val().trim()
                return taskDescriptionValue === '' ? deleteTask(selectedDate) : existingTask ? updateTask(selectedDate, taskDescriptionValue) : addTask(selectedDate, taskDescriptionValue);
            }

            function addTask(selectedDate, taskDescriptionValue) {
                $.ajax({
                    url: '/calendar/addTask',
                    type: 'POST',
                    contentType: 'application/json', 
                    data: JSON.stringify({
                        task_description: taskDescriptionValue,
                        task_date: selectedDate
                    }),
                    success: function(response) {
                        if (response === "Success") {
                            alert("할 일이 추가되었습니다.");
                            closeModalAndRefresh();
                        } else {
                            alert("할 일 추가에 실패했습니다.");
                        }
                    },
                    error: handleAjaxError
                });
            }

            function updateTask(selectedDate, taskDescriptionValue) {
                $.ajax({
                    url: '/calendar/updateTask',
                    type: 'POST',
                    contentType: 'application/json', 
                    data: JSON.stringify({
                        taskDescription: taskDescriptionValue,
                        selectedDate: selectedDate
                    }),
                    success: function(response) {
                        if (response === "Success") {
                            alert("할 일이 수정되었습니다.");
                            closeModalAndRefresh();
                        } else {
                            alert("할 일 수정에 실패했습니다.");
                        }
                    },
                    error: handleAjaxError
                });
            }
            
            function deleteTask(selectedDate) {
                $.ajax({
                    url: '/calendar/deleteTask',
                    type: 'POST',
                    contentType: 'application/json', 
                    data: JSON.stringify({ selectedDate: selectedDate }),
                    success: function(response) {
                        if (response === "Success") {
                            alert("할 일이 삭제되었습니다.");
                            $('#cal-modal').removeClass('active');
                            closeModalAndRefresh();
                        } else {
                            alert(response);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX 오류: " + error);
                        alert("서버 오류가 발생했습니다: " + xhr.responseText);
                    }
                });
            }

            function handleAjaxError(xhr, status, error) {
                console.log("AJAX 오류:", error);
                alert("서버 요청 중 오류가 발생했습니다.");
            }

            function closeModalAndRefresh() {
                modal.removeClass('active');
                updateCalendar(currentMonth, currentYear);
            }

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
        })
    });

</script>