<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
    <form method="post" action="joinProcess.jsp">
        <input type="text" name="user_id" placeholder="아이디"><br>
        <input type="password" name="user_pw" placeholder="비밀번호"><br>
        <input type="text" name="user_name" placeholder="이름"><br>
        <input type="text" name="phone" placeholder="핸드폰"><br>
        <input type="text" name="birthday" placeholder="생일"><br>
        <input type="submit" value="가입하기">
    </form>
	<!-- 회원가입 실패 시 오류 메시지 출력 -->
	<%
	//request객체에 저장된 오류메시지 확인하기
	String msg = (String)request.getAttribute("msg");
	if(msg != null){
		out.println("<p>"+msg+"</p>");
	}
	
	%>

</body>
</html>