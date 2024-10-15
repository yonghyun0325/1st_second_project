<meta charset="UTF-8">
<script>
    $(document).ready(function() {
        let today = new Date();
        let currentMonth = today.getMonth();
        let currentYear = today.getFullYear();

        function generateCalendar(month, year) {
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

        // 모달 관련 내용
        var modal = $('#modal');
        var taskDescription = $('#taskDescription');
        var selectedDay;

        // 각 일수 클릭마다 모달 띄우기(비어있는 칸 무시)
        $('#calendar-body').on('click', 'td.day', function () {
            var selectedDate = $(this).text();
            if (selectedDate.trim() !== '') {
                selectedDay = $(this);
                taskDescription.val('1. ');
                modal.addClass('active'); 
            }
        });

        // 자동 번호 매기기 (엔터 칠 때마다 숫자 증가)
        $('#taskDescription').keydown(function(event) {
            if (event.key === 'Enter') {
                event.preventDefault();  // 기본 엔터 동작 방지
                var lines = $(this).val().split('\n').length;  // 줄 개수 확인
                $(this).val($(this).val() + '\n' + (lines + 1) + ". ");  // 번호 추가
            }
        });

        // "1. "은 삭제하지 못하게 설정
        $('#taskDescription').on('input', function(event) {
            if (!$(this).val().startsWith('1. ')) {
                $(this).val('1. ');  // 강제로 "1. "이 항상 첫 줄에 있도록 설정
            }
        });

        // 모달 창 닫기 (클릭 이벤트)
        $(document).click(function(event) {
            if (!$(event.target).closest('.modal_content').length && !$(event.target).closest('.day').length) {
                $('#modal').removeClass('active');  // 모달 닫기
            }
        });

        // ESC 키로 모달 닫기
        $(document).keydown(function(event) {
            if (event.key === "Escape") {
                $('#modal').removeClass('active');  // ESC 키로 모달 닫기
            }
        });

        // 저장 버튼 클릭 시
        $('#saveTask').click(function() {
            if (selectedDay) {
                var taskDescription = $('#taskDescription').val();
                var taskContent = "<br><span class='task'>" + taskDescription.replace(/\n/g, "<br>") + "</span>";
                selectedDay.append(taskContent);  // 달력 셀에 할 일 저장

                // jQuery를 이용한 AJAX 요청
                $.ajax({
                    url: '/calendar/addTask',  // Controller 경로로 변경
                    type: 'POST',  // POST 요청
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: {
                        taskDescription: taskDescription,  // 할 일 내용
                        selectedDate: selectedDay.text()   // 선택된 날짜
                    },
                    success: function(response) {
                        console.log("서버 응답: " + response);
                        if (response === "Success") {
                            alert("할 일이 저장되었습니다.");
                            $('#modal').removeClass('active');  // 저장 후 모달 닫기
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
