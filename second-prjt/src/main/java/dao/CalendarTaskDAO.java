package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

import dto.CalendarTaskDTO;
import jdbc.DBConnection;

public class CalendarTaskDAO extends DBConnection{
    // 일정 저장 메서드
    public boolean saveTask(CalendarTaskDTO task) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isSaved = false;

        try {
            // DB 연결 객체 가져오기
            conn = getConnection();

            // SQL 쿼리 작성
            String sql = "INSERT INTO calendar_tasks (emp_idx, task_date, task_description, created_at) VALUES (?, ?, ?, NOW())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, task.getEmpIdx()); // 사번(emp_idx)
            pstmt.setString(2, task.getTaskDate()); // 일정 날짜
            pstmt.setString(3, task.getTaskDescription()); // 일정 내용

            // 쿼리 실행
            int result = pstmt.executeUpdate();
            if (result > 0) {
                isSaved = true; // 일정 저장 성공 시 true 반환
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return isSaved;
    }

    // 일정 조회 메서드
    public List<CalendarTaskDTO> getTasksByEmpIdx(int empIdx) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CalendarTaskDTO> tasks = new ArrayList<>();

        try {
            // DB 연결 객체 가져오기
            conn = getConnection();

            // SQL 쿼리 작성
            String sql = "SELECT task_idx, task_date, task_description FROM calendar_tasks WHERE emp_idx = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, empIdx); // 사번(emp_idx)

            // 쿼리 실행
            rs = pstmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                CalendarTaskDTO task = new CalendarTaskDTO(
                    rs.getInt("empIdx"), 
                    rs.getString("task_date"), 
                    rs.getString("task_description")
                );
                tasks.add(task); // 일정 리스트에 추가
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return tasks;
    }
}
