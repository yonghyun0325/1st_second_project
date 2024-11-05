$(document).ready(function () {
    const e_idx = $('header').data('eidx');

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
    })
});