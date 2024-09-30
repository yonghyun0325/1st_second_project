package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.LoginDTO;
import jdbc.DBConnection;

public class LoginDAO extends DBConnection{
	
	public LoginDTO login(int empIdx, String empPw) {
		
		LoginDTO user = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // DB 연결 객체 가져오기
            conn = getConnection();
            
//            String hashedPw = hashPassword(empPw);

            // SQL 쿼리 작성
            String sql = "SELECT emp_idx, emp_name, emp_pw FROM employees WHERE emp_idx = ? AND emp_pw = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, empIdx);        // 사번 설정
            pstmt.setString(2, empPw);      // 비밀번호 설정

            // 쿼리 실행
            rs = pstmt.executeQuery();

            // 로그인 검증
            if (rs.next()) {
            	 System.out.println("로그인 성공: 사번 = " + rs.getInt("emp_idx"));
                // 사용자 정보가 존재하면 UserDTO 객체에 저장
                user = new LoginDTO(rs.getInt("emp_idx"),rs.getString("emp_name"),rs.getString("emp_pw"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return user; // 로그인 성공 시 해당 사용자 정보, 실패 시 null 반환
    }
//	// 비밀번호 암호화
//	private String hashPassword(String password) {
//        try {
//            MessageDigest md = MessageDigest.getInstance("SHA-256");
//            byte[] hashedPassword = md.digest(password.getBytes());
//            StringBuilder sb = new StringBuilder();
//            for (byte b : hashedPassword) {
//                sb.append(String.format("%02x", b));
//            }
//            return sb.toString();
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
}
