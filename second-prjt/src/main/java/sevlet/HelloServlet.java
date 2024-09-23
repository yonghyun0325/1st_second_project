package sevlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 사용자가 서버로 서비스 요청을 하는 URL에서 사용되는 컨텍스트 패스(context path)
- 톰캣 서버가 실행 중인 웹프로그램을 구분하는 정보를 server.xml파일에 context 태그를 이용해서 저장하는데
  웹프로그램의 경로에 대한 정보를 path 속성에 설정할 수 있음(개발자가 변경 가능)
- 톰캣이 해당 요청을 처리할 수 있는 웹 프로그램을 context path를 통해서 확인하고 해당 context path가 
  서버 내에 있으면 해당 웹 프로그램의 web.xml이나 @WebServlet을 확인하여 그 다음 요청경로에 대해 처리할 수
  있는지 체크함  
 */

@WebServlet("/HelloServlet")
//Servlet3.0부터 지원됨. 톰캣이 컨텍스트 다음에 오는 사용자 요청 경로에 대해 서블릿과 매핑시켜줌
//형식: @WebServlet("/요청URL")
public class HelloServlet extends HttpServlet {//클래스를 서블릿으로 정의하기 위해서 HttpServlet을 상속함
	private static final long serialVersionUID = 1L;//서블릿을 구분하는 고유 값
	
	//일반적으로 HttpServlet를 상속한 서블릿에서는 service()메소드를 정의하지 않고 요청방식에 따라 doGet()/doPost()메소드를 정의함
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청과 함께 전달된 파라미터 가져오기: request.getParameter(name값)
		String name = request.getParameter("name");
		
		System.out.println("doGet() 실행 : Hello, Servlet! "+name);
		
		//get방식으로 서버에 요청할 때 전달값의 한글깨짐을 방지하기 위해 server.xml파일에 URIEncoding="UTF-8"을 추가해줌
		//<Connector connectionTimeout="20000" maxParameterCount="1000" port="9090" protocol="HTTP/1.1" redirectPort="8443" URIEncoding="UTF-8"/>
		
		//웹브라우저에서 HTML로 내용을 확인할 수 있도록 응답내용 작성하기
		response.setContentType("text/html;charset=UTF-8");//응답내용의 형식과 문자셋 지정
		PrintWriter out = response.getWriter();//response객체에 응답내용을 출력할 출력 객체 얻음
		out.println("<!DOCTYPE html><html><head><title>HelloServlet</title></head>");
		out.println("<body><h1>Hello, Servlet!</h1>");
		out.println("<h1>"+name+"</h1>");
		out.println("</body></html>");
		out.close();
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post방식으로 서버로 전달되는 값들 중 한글 깨짐을 방지하기 위해 web.xml파일에 한글필터를 추가해줌
		/*
		 <filter>
		  	<filter-name>HangulEncoding</filter-name>
		  	<filter-class>org.apache.catalina.filters.SetCharacterEncodingFilter</filter-class>
		  	<init-param>
		  		<param-name>encoding</param-name>
		  		<param-value>UTF-8</param-value>
		  	</init-param>
		  </filter>
		  
		  <filter-mapping>
		  	<filter-name>HangulEncoding</filter-name>
		  	<url-pattern>/*</url-pattern>
		  </filter-mapping>		
		 */
		
		doGet(request, response);
	}

}
