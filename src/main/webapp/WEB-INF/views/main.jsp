<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
    <html lang="ko"><head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- css  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

        <!-- js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery -->

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

        <!-- icon -->
        <script src="https://kit.fontawesome.com/d7e414b2e7.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />

        <!-- 타이틀 -->
        <title>FUNFUN Office</title>
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
                <!-- 디버그용으로 page 파라미터 출력 -->
                <div>Page Parameter: ${page}</div>
    
                <!-- 메인 영역 경로에 따라 page/경로명.jsp 파일 로딩 -->
                <c:choose>
                    <c:when test="${page == 'dashboard'}">
                        <div>테스트</div>
                        <c:import url="${pageContext.request.contextPath}/page/dashboard.jsp" />
                    </c:when>
                    <c:when test="${page == 'cabinet'}">
                        <div>회의</div>
                        <c:import url="${pageContext.request.contextPath}/page/cabinet.jsp" />
                    </c:when>
                    <c:when test="${page == 'myoffice'}">
                        <div>사무실</div>
                        <c:import url="${pageContext.request.contextPath}/page/myoffice.jsp" />
                    </c:when>
                    <c:otherwise>
                        <div>기본 페이지를 표시합니다. 페이지 파라미터가 올바르지 않습니다.</div>
                    </c:otherwise>
                </c:choose>

                <%@ include file="module/help.jsp" %>
            </main>
        </div>
    </body>
</html>