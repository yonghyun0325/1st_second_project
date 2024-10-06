<%@ page import="java.sql.*, jdbc.DBConnection" %>
<%
    String taskDescription = request.getParameter("taskDescription");
    String selectedDate = request.getParameter("selectedDate");

    String userIdStr = (String) session.getAttribute("emp_idx");
    if (userIdStr == null) {
        out.println("Error: userId is null in session.");
    } else {
        out.println("Logged in as: " + userIdStr);
    }
    int userId = Integer.parseInt(userIdStr);

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DBConnection.getConnection();

        // 데이터베이스에 할 일 저장
        String sql = "INSERT INTO calendar_tasks (emp_idx, task_date, task_description, created_at) VALUES (?, ?, ?, NOW())";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);  // emp_idx는 INT 타입이므로 setInt() 사용
        pstmt.setString(2, selectedDate);  // 선택된 날짜
        pstmt.setString(3, taskDescription);  // 입력한 할 일

        int result = pstmt.executeUpdate();
        if (result > 0) {
            out.print("Success");
        } else {
            out.print("Error");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
