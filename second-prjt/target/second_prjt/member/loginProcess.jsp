<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, dto.UserDTO, dao.UserDAO" %>

<% //로그인과 관련된 요청 처리 구문: 스트립트릿 - 변환된 서블릿(loginProcess_jsp.java)에서
   //_jspService()메소드 내에 정의되는 구문

        //사용자가 전달한 파라미터들: 아이디, 비밀번호
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		//UserDAO 객체를 생성해서 insertUser()메소드로 요청을 처리함
		UserDAO dao = new UserDAO();
		int result = dao.login(user_id, user_pw);
		
		
		//로그인 성공시 메인페이지(index.jsp)로 이동
		//로그인 실패시 로그인페이지(login.jsp)로 이동
		
		//페이지 이동: 새로운 요청으로 페이지로 이동 - response.sendRedirect(이동할 페이지URL)
		//기존의 request객체를 유지하면서 다른 페이지로 이동 - forward()메소드 이용
		if(result == 1){//로그인 성공한 경우
			//회원인증 정보를 session객체에 저장해줌
			//session객체: Session영역에서 사용할 수 있는 객체
			//서버에서 브라우저별로 1개씩 생성해서 부여함
			//브라우저가 종료되지 않으면 세션객체는 유지됨
			
			//response.sendRedirect() 메소드는 현재의 요청을 종료시키고
			//서버에 매개값으로 입력된 URL로 다시 요청을 하므로 현재의 request객체는 소멸됨
			session.setAttribute("member", user_id);
			response.sendRedirect("../index.jsp");
		}else{
			request.setAttribute("msg", "아아디나 비밀번호가 일치하지 않습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

%>