<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <%@ include file="module/head.jsp" %>
    <title>FUNFUN Office - 내 사무실</title>

    <body>
        <!-- 헤더 -->
        <%@ include file="module/header.jsp" %>

        <!-- 사이드 바 -->
        <%@ include file="module/sidebar.jsp" %>
        
        <main>
            <div id="tab-head"></div>
            <div id="tab-body"></div>
        </main>
    </body>
    <script src="${pageContext.request.contextPath}/resources/js/tab.js"></script>
</html>