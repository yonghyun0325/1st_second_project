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
			 Class.forName("org.mariadb.jdbc.Driver");
			 
			 //2.드라이버가 정상적으로 로딩이 되면 DriverManager클래스를
			 //이용해서 DB와의 연결객체(Connection)를 얻을 수 있음
			 //DriverManager.getConnection("DB의 서버URL","사용자계정","비밀번호");
			 String url = "jdbc:mariadb://kinari.ink:3306/funfun2";
			 conn = DriverManager.getConnection(url, "funfun2", "funfun4041");
			 
			 System.out.println("DB연결 성공!");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 실패");
		}
		
	}
	// getConnection 매서드 연결 상태 확인하고, 재연결
	public static Connection getConnection() {
		try {
			if (conn == null || conn.isClosed()) {
				String url = "jdbc:mariadb://kinari.ink:3306/funfun2";
				conn = DriverManager.getConnection(url, "funfun2", "funfun4041");
				 
				System.out.println("DB 재연결 성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 재연결 실패");
		}
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
