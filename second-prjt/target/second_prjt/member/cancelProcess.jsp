<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, dto.UserDTO, dao.UserDAO" %>

<% //회원탈퇴 요청 처리하기

        //회원탈퇴를 위해서 user_id를 session객체에서 얻음
		String user_id = (String)session.getAttribute("member");
		
		//UserDAO 객체를 생성해서 insertUser()메소드로 요청을 처리함
		UserDAO dao = new UserDAO();
		int result = dao.cancel(user_id);
		 
		
		//회원탈퇴 성공시 메인페이지(index.jsp)로 이동
		//회원탈퇴 실패시 회원정보 변경페이지(update.jsp)로 이동
		
		//페이지 이동: 새로운 요청으로 페이지로 이동 - response.sendRedirect(이동할 페이지URL)
		//기존의 request객체를 유지하면서 다른 페이지로 이동 - forward()메소드 이용
		if(result == 1){//회원탈퇴 성공한 경우 session객체를 초기화시켜즘
			session.invalidate();
			response.sendRedirect("../index.jsp");
		}else{
			request.setAttribute("msg", "시스템 오류가 발생했습니다. 빠른 시일 내에 시스템을 정상화하도록 하겠습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
		}

%>