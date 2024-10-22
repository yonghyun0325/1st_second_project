<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        var modal = $('#modal');
        var taskDescription = $('#taskDescription');
        var selectedDay;

        $('#calendar-body').on('click', 'td.day', function () {
            var selectedDate = $(this).text();
            if (selectedDate.trim() !== '') {
                selectedDay = $(this);
                taskDescription.val('1. ');
                modal.addClass('active'); 
            }
        });

        $('#taskDescription').keydown(function(event) {
            if (event.key === 'Enter') {
                event.preventDefault(); 
                var lines = $(this).val().split('\n').length; 
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
                var taskDescription = $('#taskDescription').val();
                var selectedDate = currentYear + '-' + (currentMonth + 1) + '-' + selectedDay.text(); // 연-월-일 형식으로 변환

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