<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <!-- 대시보드 메인 페이지 -->

    <!-- <head> 태그 모듈 -->
    <%@ include file="module/head.jsp" %>
    
    <!-- 타이틀 -->
    <title>FUNFUN Office - 대시보드</title>

    <!-- 내용 영역 -->
    <body>
        <!-- 헤더 -->
        <%@ include file="module/header.jsp" %>

        <!-- 사이드바와 메인 영역 감싸주는 div -->
        <div id="main-wrapper">
            
            <!-- 사이드 바 -->
            <%@ include file="module/sidebar.jsp" %>
            
            <!-- 메인 영역 -->
            <main>
                <%@ include file="module/calendar.jsp" %>
                <%@ include file="module/help.jsp" %>
            </main>
        </div>
    </body>
</html>