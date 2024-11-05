
$(document).ready(function() {
    const e_idx = $('header').data('eidx');

    // 시계 관련 메소드
    $(function() {
        setInterval(updateClock, 1000);
        updateClock();

        $('#clock-container').on('click', function() {
            $('#clock').toggle();
            $(this).find('i').toggle();
        });

        function updateClock() {
            const now = new Date();
            const koreaTime = new Date(now.toLocaleString("en-US", { timeZone: "Asia/Seoul" }));
            const year = koreaTime.getFullYear();
            const month = String(koreaTime.getMonth() + 1).padStart(2, '0');
            const day = String(koreaTime.getDate()).padStart(2, '0');
            const hours = String(koreaTime.getHours()).padStart(2, '0');
            const minutes = String(koreaTime.getMinutes()).padStart(2, '0');
            const seconds = String(koreaTime.getSeconds()).padStart(2, '0');

            const formattedTime = year + "년 " + month + "월 " + day + "일 " + hours + "시 " + minutes + "분 " + seconds + "초";

            $('#clock').text(formattedTime);
        }
    })

    // 헤더에 로그인 사용자 정보 불러오기
    $(function() {
        $.ajax({
            url: '/employees/getEmployeeDetails/' + e_idx,
            type: 'GET',
            success: function(data) {
                const employee = data.employee;
                const photoUrl = data.photoUrl;

                $('#profileName').text(employee.name + " 님");
                $('#profileEIdx').text(employee.e_idx || "정보 없음");
                $('#profilePosition').text(employee.position || "정보 없음");
                $('#profileDepa').text(employee.depa || "정보 없음");
                $('#profileEmail').text(employee.email || "정보 없음");
                $('#profileMobile').text(employee.mobile || "정보 없음");

                const role = employee.permission === 0 ? "사원" : 
                             employee.permission === 1 ? "인사담당자" : 
                             employee.permission === 2 ? "관리자" : "정보 없음";
                $('#profileRole').text(role);
                
                if (photoUrl) {
                    $('#profileImage, #profileMenuImage').attr('src', photoUrl);
                } else {
                    $('#profileImage, #profileMenuImage').attr('src', '/resources/img/icon/profile-default.svg');
                }
            },
            error: function() {
                alert("사원 정보를 불러오는 중 오류가 발생했습니다.");
            }
        });
        
        $('#header-profile-btn').on('click', function(event) {
            $('#header-profile-menu').toggleClass('show');
            event.stopPropagation();
        });

        $(document).on('click', function(event) {
            const $dropdown = $('#header-profile-menu');
            if (!$dropdown.is(event.target) && $dropdown.has(event.target).length === 0 && !$('.header-left-item').is(event.target)) {
                $dropdown.removeClass('show');
            }
        });
    })
});