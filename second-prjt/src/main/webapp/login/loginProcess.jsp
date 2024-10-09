<%@ page import="dao.LoginDAO" %>
<%@ page import="dto.LoginDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 처리</title>
</head>
<body>
<%
    // login.jsp에서 넘어온 사번과 비밀번호 받기
    String loginId = request.getParameter("login_id");
    String loginPw = request.getParameter("login_pw");

    // 입력된 사번을 숫자로 변환 (사번이 숫자라고 가정)
    int empIdx = Integer.parseInt(loginId);

    // DAO 객체 생성
    LoginDAO loginDAO = new LoginDAO();

    // 로그인 처리
    LoginDTO user = loginDAO.login(empIdx, loginPw);

    if (user != null) {
        // 로그인 성공 시 세션에 사용자 정보 저장 후 메인 페이지로 이동
        session.setAttribute("loginUser", user.getE_Idx());
        session.setAttribute("userName", user.getE_name());
        response.sendRedirect("../main");
    } else {
        // 로그인 실패 시 경고 메시지 출력 후 로그인 페이지로 돌아감
        out.println("<script>alert('사번 또는 비밀번호가 잘못되었습니다.'); history.back();</script>");
    }
%>
</body>
</html>
