<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>메인페이지</title>
  </head>

  <body>
    <h3>메인페이지</h3>
    <hr>

    <!-- 로그인 여부를 판단할 수 있도록 session객체의 member속성을 이용함 -->
    <% String user_id=(String)session.getAttribute("member"); if(user_id==null){//session객체에 member속성이 없는 경우 %>

      <!-- 로그인을 하지 않은 경우: 비회원용 내용 -->
      <a href="member/join.jsp">회원가입</a><br>
      <a href="member/login.jsp">로그인</a><br>

      <% }else{//session객체에 member속성이 있는 경우 %>

        <!-- 로그인을 한 경우: 회원용 내용 -->
        <%= user_id %> 님 환영합니다<br>
          <a href="member/update.jsp">회원정보변경</a><br>
          <a href="member/logout.jsp">로그아웃</a><br>

          <% } %>











  </body>

  </html>