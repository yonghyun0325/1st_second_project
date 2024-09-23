<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.UserDAO, dto.UserDTO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>
</head>
<body>

<%
//session에 저장된 member속성을 이용해서 회원에 대한 정보를 UserDTO로 가져와서 화면 작성
String user_id = (String)session.getAttribute("member");
UserDTO dto = new UserDAO().getUser(user_id); 
%>

<h1>회원정보 변경</h1>
    <form method="post" action="updateProcess.jsp">
        <input type="text" name="user_id" value="<%= dto.getUserId() %>" readonly><br>
        <input type="password" name="user_pw" value="<%= dto.getUserPw() %>"><br>
        <input type="text" name="user_name" value="<%= dto.getUserName() %>"><br>
        <input type="text" name="phone" value="<%= dto.getPhone() %>"><br>
        <input type="text" name="birthday" value="<%= dto.getBirthday() %>"><br>
        <input type="submit" value="변경하기">
        <input type="button" value="취소하기" onclick="location.href='../index.jsp'">
    </form>
    <br>
    <p>
    	<a href="#">회원 특별 이벤트</a>
    	<a href="#">포인트 조회</a>
    	<a href="javascript:cancel()">회원 탈퇴</a>
    </p>
    
    
	<!-- 회원정보 변경 실패 시 오류 메시지 출력 -->
	<%
	//request객체에 저장된 오류메시지 확인하기
	String msg = (String)request.getAttribute("msg");
	if(msg != null){
		out.println("<p>"+msg+"</p>");
	}
	
	%>

	<script>
		function cancel(){
			const answer = confirm("정말 회원탈퇴 하겠습니까?");
			if(answer){
				location.href = "cancelProcess.jsp";
			}
		}
	
	</script>



</body>
</html>