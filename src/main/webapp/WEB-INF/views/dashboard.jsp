<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <%@ include file="module/head.jsp" %>
    <title>FUNFUN Office - 대시보드</title>

    <body>
        <!-- 헤더 -->
        <%@ include file="module/header.jsp" %>

        <!-- 사이드 바 -->
        <%@ include file="module/sidebar.jsp" %>
        
        <!-- 다른 페이지들 들어갈 공간 -->
        <main>
            <%@ include file="module/calendar.jsp" %>
        </main>
    </body>
</html>