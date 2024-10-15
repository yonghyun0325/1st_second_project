<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
    <%@ include file="util/header.jsp" %>
        
    <%@ include file="util/sidebar.jsp" %>

    <div id="content">
        <%@ include file="util/calendar.jsp" %>
        <!-- 할 일 입력 모달 -->
        <div id="modal" class="modal">
            <div class="modal_content">
                <h3>할일 목록</h3>
                <hr>
                <textarea id="taskDescription"></textarea>
                <button id="saveTask">저장</button>
            </div>
        </div>
    </div>
    
</body>
</html>