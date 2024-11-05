<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- css  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css"> <!-- 초기화 시트 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css"> <!-- 공통 시트  -->
        
        <!-- js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
        
        <!-- icon -->
        <script src="https://kit.fontawesome.com/d7e414b2e7.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
        
        <!-- 타이틀 -->
        <title>FFOffice DEMO</title>
    </head>
    
    <!-- 내용 영역 -->
    <body>
        <!-- 헤더 -->
        <%@ include file="module/header.jsp" %>

        <!-- 사이드바와 메인 영역 감싸주는 div -->
        <div id="main-wrapper">
            <!-- 사이드 바 -->
            <%@ include file="module/sidebar.jsp" %>

            <main>
                <!-- 메인 영역 경로에 따라 page/경로명.jsp 파일 로딩 -->
                <c:choose>
                    <c:when test="${page eq 'dashboard'}">
                        <c:import url="page/dashboard.jsp" />
                    </c:when>
                    <c:when test="${page eq 'cabinet'}">
                        <c:import url="page/cabinet.jsp" />
                    </c:when>
                    <c:when test="${page eq 'myoffice'}">
                        <c:import url="page/myoffice.jsp" />
                    </c:when>
                    <c:otherwise>
                        <div>페이지를 불러오는 중 문제가 발생했습니다.</div>
                    </c:otherwise>
                </c:choose>

                <%@ include file="module/help.jsp" %>
            </main>
        </div>
    </body>
</html>