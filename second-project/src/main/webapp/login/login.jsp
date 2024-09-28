<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="login.css">
<!-- 구글 noto sans 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="contain">
        <div class="header">
            <div class="logo">
                🔔
            </div>
            <div class="site_name">
                FF COMPANY
            </div>
        </div>
        <div class="login_box">
            <form action="loginProcess.jsp" method="post">
                <div class="login_id">
                    아이디(사번) 입력 : <input type="text" name="login_id" required maxlength="9" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                </div>
                <div class="login_pw">
                    비밀번호 입력 : <input type="password" name="login_pw" required>
                </div>
                <div class="remember_login">
                    <input type="checkbox" name="remember_login"> 로그인 기억하기
                </div>
                <button type="submit" class="btn_login">로그인</button>
            </form>
            <div class="login_info">
<<<<<<< HEAD
                <a href="#">인사과 문의하기</a> 이거 또 왜 이래
=======
                <a href="#">인사과 문의하기</a>
>>>>>>> branch 'main' of https://github.com/yonghyun0325/1st_second_project.git
            </div>
        </div>
    </div>
</body> 
</html>