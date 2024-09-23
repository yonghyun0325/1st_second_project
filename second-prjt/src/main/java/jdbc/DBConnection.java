package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


//싱글톤 패턴을 적용해서 1개의 연결객체를 
//프로젝트 폴더 내에서 공유해서 사용할 수 있도록 함
public class DBConnection {
	
	private static Connection conn;
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	
	static {
		try {
			 
			 //1. JDBC 드라이버를 JVM의 메모리에 로딩하기
			 //Class.forName("각 DB의 JDBC 드라이버명");
			 Class.forName("oracle.jdbc.OracleDriver");
			 
			 //2.드라이버가 정상적으로 로딩이 되면 DriverManager클래스를
			 //이용해서 DB와의 연결객체(Connection)를 얻을 수 있음
			 //DriverManager.getConnection("DB의 서버URL","사용자계정","비밀번호");
			 String url = "jdbc:oracle:thin:@localhost:1521:xe";
			 conn = DriverManager.getConnection(url, "sql_dev", "1234");
			 
			 System.out.println("DB연결 성공!");
			
		} catch (Exception e) {
			System.out.println("DB연결 실패");
		}
		
	}
	
	public static Connection getConnection() {
		return conn;
	}
	
	public void close() {
		try {
			if(pstmt != null) {pstmt.close();}
			if(rs != null) {rs.close();}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}


}
