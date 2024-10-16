<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 화면</title>
    
    <!-- css, 스타일 초기화 적용  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <!-- css, 헤더, 사이드바, 캘린더, 탭 스타일  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">

    <!-- 구글 noto sans 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 폰트어썸 아이콘 -->
    <script src="https://kit.fontawesome.com/d7e414b2e7.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
    
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div class="login-container">
        <div class="login_box">
            <div class="title-area">
                <div class="logo"><i class="far fa-laugh"></i></div>
                <div class="title">FUNFUN OFFICE</div>
            </div>
            <form action="/employees/loginProcess.do" method="post">
                <div class="login_id">
                    <input type="text" name="e_idx" required maxlength="9" oninput="this.value = this.value.replace(/[^0-9]/g, '')" placeholder="사원번호">
                </div>
                <div class="login_pw">
                    <input type="password" name="e_pw" placeholder="비밀번호" required>
                </div>
                <p class="error-message"></p>
                <button type="submit" class="btn_login">로그인</button>
            </form>
            <div class="login_info">
                <a href="#">인사과 문의하기</a>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        $('form').on('submit', function(e) {
            e.preventDefault();

            const formData = {
                e_idx: $('input[name="e_idx"]').val(),
                e_pw: $('input[name="e_pw"]').val()
            };

            $.ajax({
                type: 'POST',
                url: '/employees/loginProcess.do',
                data: formData,
                dataType: 'json',
                success: function(response) {
                    console.log("response: " + response.status.trim());
                    if (response.status.trim() === 'success') {
                        window.location.href = '/';
                    } else {
                        $('.error-message').html(`사원번호나 비밀번호가 일치하지 않습니다.`);
                    }
                },
                error: function() {
                    $('.error-message').html('서버 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        });
    });
    </script>
</body>
</html>
