<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h3>로그인</h3>
<hr>
<form method="post" action="loginProcess.jsp">
    <input type="text" name="user_id" placeholder="아이디"><br>
    <input type="password" name="user_pw" placeholder="비밀번호"><br>
    <input type="submit" value="로그인">
</form>

	<!-- 로그인 실패 시 오류 메시지 출력 -->
	<%
	//request객체에 저장된 오류메시지 확인하기
	String msg = (String)request.getAttribute("msg");
	if(msg != null){
		out.println("<p>"+msg+"</p>");
	}
	
	%>
</body>
</html>