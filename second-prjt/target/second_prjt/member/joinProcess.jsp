<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, dto.UserDTO, dao.UserDAO" %>

<% //회원가입과 관련된 요청 처리 구문: 스트립트릿 - 변환된 서블릿(joinProcess_jsp.java)에서
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
		int result = dao.insertUser(dto);
		
		/* //웹브라우저에서 HTML로 내용을 확인할 수 있도록 응답내용 작성하기
		response.setContentType("text/html;charset=UTF-8");//응답내용의 형식과 문자셋 지정
		//out은 JSP페이지에서 response객체에 응답내용을 출력하기 위해 지원되는 출력객체
		out.println("<!DOCTYPE html><html><head><title>회원가입정보</title></head>");
		out.println("<body><h1>회원가입 결과</h1>");
		
		if(result == 1){//회원가입이 성공한 경우
			out.println("<h3>회원가입이 정상적으로 이루어졌습니다.</h3>");
			
		}else{//회원가입이 실패한 경우
			out.println("<h3>회원가입 중 예외가 발생했습니다.</h3>");
		}
		
		out.println("</body></html>");
		out.close(); */
		
		//회원가입 성공시 메인페이지(index.jsp)로 이동
		//회원가입 실패시 회원가입페이지(join2.jsp)로 이동
		
		//페이지 이동: 새로운 요청으로 페이지로 이동 - response.sendRedirect(이동할 페이지URL)
		//기존의 request객체를 유지하면서 다른 페이지로 이동 - forward()메소드 이용
		if(result == 1){
			response.sendRedirect("../index.jsp");
		}else{
			request.setAttribute("msg", "회원가입이 정상적으로 이루어지지 않았습니다");
			RequestDispatcher dispatcher = request.getRequestDispatcher("join2.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

%>