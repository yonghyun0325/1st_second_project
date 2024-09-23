package sevlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/MemberJoinServlet")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//회원가입정보를 받아서 처리: post 방식으로 데이터 전송됨
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 실행");
		
		//사용자가 전달한 파라미터들: 아이디, 비밀번호, 이름
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		
		
		//웹브라우저에서 HTML로 내용을 확인할 수 있도록 응답내용 작성하기
		response.setContentType("text/html;charset=UTF-8");//응답내용의 형식과 문자셋 지정
		PrintWriter out = response.getWriter();//response객체에 응답내용을 출력할 출력 객체 얻음
		out.println("<!DOCTYPE html><html><head><title>회원가입정보</title></head>");
		out.println("<body><h1>회원가입 정보</h1>");
		out.println("<h3>아이디: "+member_id+"</h3>");
		out.println("<h3>비밀번호: "+member_pw+"</h3>");
		out.println("<h3>이름: "+member_name+"</h3>");
		out.println("</body></html>");
		out.close();
	}

}
