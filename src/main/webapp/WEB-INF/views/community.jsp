<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 메인</title>
</head>
<body>
    <%@ include file="util/header.jsp" %>
        
    <%@ include file="util/sidebar.jsp" %>

    <div id="content">
        <h1>커뮤니티</h1>
        <ul>
            <li><a href="boardList.jsp">게시판</a></li>
            <li><a href="clubList.jsp">동호회</a></li>
            <li><a href="lostAndFoundList.jsp">분실물</a></li>
        </ul>
    </div>
</body>
</html>
