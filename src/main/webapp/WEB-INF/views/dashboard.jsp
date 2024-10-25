<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <%@ include file="module/head.jsp" %>
    <title>FUNFUN Office - 대시보드</title>

    <body>
        <%@ include file="module/header.jsp" %>

        <div id="main-wrapper">
            <%@ include file="module/sidebar.jsp" %>
            
            <main>
                <%@ include file="module/calendar.jsp" %>
            </main>
        </div>
    </body>
</html>