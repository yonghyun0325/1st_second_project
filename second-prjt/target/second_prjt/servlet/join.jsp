<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <form method="post" action="MemberJoinServlet">
        <input type="text" name="member_id" placeholder="아이디"><br>
        <input type="password" name="member_pw" placeholder="비밀번호"><br>
        <input type="text" name="member_name" placeholder="이름"><br>
        <input type="submit" value="가입하기">
    </form>

</body>
</html>