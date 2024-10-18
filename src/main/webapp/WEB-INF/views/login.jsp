<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>

        <title>FUNFUN Office - 로그인</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- css  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

        <!-- js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery -->
        <script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
        
        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

        <!-- icon -->
        <script src="https://kit.fontawesome.com/d7e414b2e7.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />

    </head>
    <body>
        <div class="login-container">
            <div class="login-wrapper">
                <div class="title-area">
                    <!-- <img class="logo"> -->
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
                    <button type="submit" class="button-login">로그인</button>
                </form>
                <div class="contact">
                    <a href="#">인사과 문의하기</a>
                </div>
            </div>
        </div>
    </body>
</html>
