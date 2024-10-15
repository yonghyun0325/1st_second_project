<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="calendar">
    <div class="calendar-title-wrap">
        <button id="prev-month"><i class="fas fa-chevron-left"></i></button>
        <h2 id="calendar-title"></h2>
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
<div id="modal" class="modal">
    <div class="modal_content">
        <h3>할일 목록</h3>
        <hr>
        <textarea id="taskDescription"></textarea>
        <button id="saveTask">저장</button>
    </div>
</div>
<script>
    $(document).ready(function() {
        let today = new Date();
        let currentMonth = today.getMonth();
        let currentYear = today.getFullYear();

        function fetchTasks() {
            return $.ajax({
                url: '${pageContext.request.contextPath}/calendar/getTask',
                type: 'POST',
                dataType: 'json'
            });
        }

        function displayTasks(tasks) {
            tasks.forEach(function(task) {
                const taskDateArray = task.taskDate.split('-');
                const taskYear = parseInt(taskDateArray[0]);
                const taskMonth = parseInt(taskDateArray[1]) - 1;
                const taskDay = parseInt(taskDateArray[2]);
                console.log(`taskDay: ${taskDay}, taskMonth: ${taskMonth}, taskYear: ${taskYear}`);

                $('#calendar-body').find('td').each(function() {
                    const cellDay = parseInt($(this).text());
                    if (cellDay === taskDay && currentMonth === taskMonth && currentYear === taskYear) {
                        let taskContent = "<br><span class='task'>" + task.taskDescription.replace(/\n/g, "<br>") + "</span>";
                        $(this).append(taskContent);
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
            displayTasks(tasks);
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

        // 할일 저장 모달영역
        let modal = $('#modal');
        let taskDescription = $('#taskDescription');
        let selectedDay;

        $('#calendar-body').on('click', 'td.day', function () {
            let selectedDate = $(this).text();
            if (selectedDate.trim() !== '') {
                selectedDay = $(this);
                taskDescription.val('1. ');
                modal.addClass('active'); 
            }
        });

        $('#taskDescription').keydown(function(event) {
            if (event.key === 'Enter') {
                event.preventDefault(); 
                let lines = $(this).val().split('\n').length; 
                $(this).val($(this).val() + '\n' + (lines + 1) + ". "); 
            }
        });

        // $('#taskDescription').on('input', function(event) {
        //     if (!$(this).val().startsWith('1. ')) {
        //         $(this).val('1. '); 
        //     }
        // });

        $(document).click(function(event) {
            if (!$(event.target).closest('.modal_content').length && !$(event.target).closest('.day').length) {
                $('#modal').removeClass('active');
            }
        });

        $(document).keydown(function(event) {
            if (event.key === "Escape") {
                $('#modal').removeClass('active');
            }
        });

        $('#saveTask').click(function() {
            if (selectedDay) {
                let taskDescription = $('#taskDescription').val();
                let selectedDate = currentYear + '-' + (currentMonth + 1) + '-' + selectedDay.text(); 

                $.ajax({
                    url: '${pageContext.request.contextPath}/calendar/addTask',
                    type: 'POST',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: {
                        taskDescription: taskDescription,
                        selectedDate: selectedDate 
                    },
                    success: function(response) {
                        if (response === "Success") {
                            alert("할 일이 저장되었습니다.");
                            $('#modal').removeClass('active');
                            updateCalendar(currentMonth, currentYear);
                        } else {
                            alert("할 일 저장에 실패했습니다.");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX 오류: " + error);
                    }
                });
            }
        });
    });
</script>
