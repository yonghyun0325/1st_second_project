$(document).ready(function() {
    let today = new Date();
    let currentMonth = today.getMonth();
    let currentYear = today.getFullYear();

    function generateCalendar(month, year) {
        const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
        const firstDay = new Date(year, month).getDay();
        const daysInMonth = 32 - new Date(year, month, 32).getDate();

        $('#calendar-title').text(`${year}년 ${monthNames[month]}`);
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
    }

    // 초기 달력 생성
    generateCalendar(currentMonth, currentYear);

    // 이전달, 다음달 버튼
    $('#prev-month').on('click', function() {
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        generateCalendar(currentMonth, currentYear);
    });

    $('#next-month').on('click', function() {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        generateCalendar(currentMonth, currentYear);
    });

    // 모달 관련 내용, 자동 생성 달력과 기능 연동

    var modal = $('#modal');
    var taskDescription = $('#taskDescription');
    var saveTaskButton = $('#saveTask');
    var selectedDay;

    $('#calendar-body').on('click', 'td.day', function () {
        var selectedDate = $(this).text();
        if (selectedDate.trim() !== '') {  // 비어있는 td는 무시
            selectedDay = $(this); // 클릭한 날짜 셀을 참조
            taskDescription.val('1. '); // 설명 초기화
            modal.addClass('active'); // 모달 열기
        }
    });

    taskDescription.on('keydown', function (event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            var lines = taskDescription.val().split('\n').length;
            taskDescription.val(taskDescription.val() + '\n' + (lines + 1) + ". ");
        }
    });

    taskDescription.on('input', function () {
        if (!taskDescription.val().startsWith('1. ')) {
            taskDescription.val('1. ');
        }
    });

    $(document).on('click', function (event) {
        if (!$(event.target).closest('.modal_content').length && !$(event.target).closest('.day').length) {
            modal.removeClass('active');
        }
    });

    saveTaskButton.on('click', function () {
        if (selectedDay) {
            var taskContent = "<br><span class='task'>" + taskDescription.val().replace(/\n/g, "<br>") + "</span>";
            selectedDay.html(selectedDay.html() + taskContent);
            modal.removeClass('active');
            alert("할 일이 저장되었습니다.");
        }
    });
});
