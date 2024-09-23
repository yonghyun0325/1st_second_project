<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, dto.UserDTO, dao.UserDAO" %>

<% //회원정보 변경과 관련된 요청 처리 구문: 스트립트릿 - 변환된 서블릿(updateProcess_jsp.java)에서
//_jspService()메소드 내에 정의되는 구문

        //사용자가 전달한 파라미터들: 아이디, 비밀번호, 이름
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		
		//UserDTO 객체를 생성해서 각각의 필드에 세팅
		UserDTO dto = new UserDTO();
		dto.setUserId(user_id);
		dto.setUserPw(user_pw);
		dto.setUserName(user_name);
		dto.setPhone(phone);
		dto.setBirthday(birthday);
		
		//UserDAO 객체를 생성해서 insertUser()메소드로 요청을 처리함
		UserDAO dao = new UserDAO();
		int result = dao.updateUser(dto); 
		
		//회원정보 변경 성공시 메인페이지(index.jsp)로 이동
		//회원정보 변경 실패시 회원가입페이지(update.jsp)로 이동
		
		//페이지 이동: 새로운 요청으로 페이지로 이동 - response.sendRedirect(이동할 페이지URL)
		//기존의 request객체를 유지하면서 다른 페이지로 이동 - forward()메소드 이용
		if(result == 1){
			response.sendRedirect("../index.jsp");
		}else{
			request.setAttribute("msg", "회원정보 변경이 정상적으로 이루어지지 않았습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

%>