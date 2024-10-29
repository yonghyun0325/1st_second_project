<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    
    <!-- <head> 태그 모듈 -->
    <%@ include file="module/head.jsp" %>

    <!-- 탭 자바스크립트 적용 -->
    <script src="${pageContext.request.contextPath}/resources/js/tab.js"></script>
    
    <!-- 타이틀 -->
    <title>FUNFUN Office - 내 사무실</title>

    <!-- 내용 영역 -->
    <body>
        <!-- 헤더 -->
        <%@ include file="module/header.jsp" %>

        <!-- 사이드바와 메인 영역 감싸주는 div -->
        <div id="main-wrapper">
            <!-- 사이드바 -->
            <%@ include file="module/sidebar.jsp" %>
            
            <!-- 메인 영역 -->
            <main>
                <div id="tab-head"></div>
                <div id="tab-body"></div>
                <%@ include file="module/help.jsp" %>
            </main>
        </div>
    </body>
</html>