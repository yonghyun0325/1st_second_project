<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 //로그아웃 요청 처리하기
 //기존의 세션 객체에 저장된 내용을 초기화시킴: invalidate()
 session.invalidate();
 
 //메인 페이지지로 이동
 response.sendRedirect("../index.jsp");
 
 %>