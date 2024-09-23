package dao;

import java.sql.SQLException;

import dto.UserDTO;
import jdbc.DBCP;

//public class UserDAO extends DBConnection{
public class UserDAO extends DBCP {

  // 1. DTO클래스를 이용해서 tb_user테이블에 데이터 추가하기:insertUser()
  public int insertUser(UserDTO dto) {
    int result = 0;// 입력 실패 시 결과값

    // 연결객체를 이용해서 SQL객체를 생성함
    String sql = " insert into tb_user (u_idx,user_name,user_id,user_pw,birthday,phone) "
        + " values(tb_user_seq.nextval, ?,?,?,?,?) ";
    try {
      conn.setAutoCommit(false);// 오토 커밋 중지시킴

      pstmt = conn.prepareStatement(sql);
      // SQL객체의 ?에 입력값을 세팅해서 SQL문을 완성시킴
      pstmt.setString(1, dto.getUserName());
      pstmt.setString(2, dto.getUserId());
      pstmt.setString(3, dto.getUserPw());
      pstmt.setString(4, dto.getBirthday());
      pstmt.setString(5, dto.getPhone());

      // SQL문 실행시킴
      result = pstmt.executeUpdate();

      conn.commit();// 회원정보 입력 중 예외가 발생하지 않았을 경우 커밋

    } catch (Exception e) {
      System.out.println("회원정보 입력 중 예외 발생");
      try {
        conn.rollback();// 회원정보 입력 중 예외가 발생하면 이전으로 돌림
      } catch (SQLException e1) {
        System.out.println("롤백 실패");
        e1.printStackTrace();
      }
    } finally {
      try {
        conn.setAutoCommit(true);// 오토커밋 기능이 되도록 함
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }

    return result;
  }

  // 로그인
  public int login(String user_id, String user_pw) {
    int result = 0;// 로그인 실패시 결과값

    // 연결객체 얻기:conn
    // SQL작업: PreparedStatement 객체 얻음
    String sql = "select count(*) from tb_user "
        + " where user_id = ? "
        + " and user_pw =? "
        + " and user_status='N' ";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, user_id);
      pstmt.setString(2, user_pw);
      rs = pstmt.executeQuery();

      if (rs.next()) {// 조회된 데이터가 있다면
        result = rs.getInt(1);
      }

    } catch (SQLException e) {
      System.out.println("로그인 처리 시 예외 발생");
    }

    return result;
  }

  // 회원정보 가져오기
  public UserDTO getUser(String user_id) {
    UserDTO dto = null;// 회원정보 조회 실패시 결과값

    // 연결객체 얻기:conn
    // SQL작업: PreparedStatement 객체 얻음
    String sql = "select * from tb_user where user_id = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, user_id);
      rs = pstmt.executeQuery();

      if (rs.next()) {// 조회된 데이터가 있다면
        dto = new UserDTO();
        dto.setUIdx(rs.getInt("u_idx"));
        dto.setUserId(rs.getString("user_id"));
        dto.setUserPw(rs.getString("user_pw"));
        dto.setUserName(rs.getString("user_name"));
        dto.setPhone(rs.getString("phone"));
        dto.setBirthday(rs.getString("birthday"));
      }

    } catch (SQLException e) {
      // e.printStackTrace();
      System.out.println("회원조회 처리 시 예외 발생");
    }

    return dto;
  }

  // 회원정보 변경
  public int updateUser(UserDTO dto) {
    int result = 0;// 입력 실패 시 결과값

    // 연결객체를 이용해서 SQL객체를 생성함
    String sql = " update tb_user set user_name=?, user_pw=?, birthday=?, phone=? "
        + " where user_id=? ";
    try {
      pstmt = conn.prepareStatement(sql);
      // SQL객체의 ?에 입력값을 세팅해서 SQL문을 완성시킴
      pstmt.setString(1, dto.getUserName());
      pstmt.setString(2, dto.getUserPw());
      pstmt.setString(3, dto.getBirthday());
      pstmt.setString(4, dto.getPhone());
      pstmt.setString(5, dto.getUserId());

      // SQL문 실행시킴
      result = pstmt.executeUpdate();

    } catch (Exception e) {
      System.out.println("회원정보 입력 중 예외 발생");
    }

    return result;
  }

  // 회원탈퇴 처리하기
  public int cancel(String user_id) {
    int result = 0;// 회원탈퇴 처리 실패 시 결과값

    // 연결객체를 이용해서 SQL객체를 생성함
    String sql = " update tb_user set user_status='Y' "
        + " where user_id=? ";
    try {
      pstmt = conn.prepareStatement(sql);
      // SQL객체의 ?에 입력값을 세팅해서 SQL문을 완성시킴
      pstmt.setString(1, user_id);

      // SQL문 실행시킴
      result = pstmt.executeUpdate();

    } catch (Exception e) {
      System.out.println("회원탈퇴 처리 중 예외 발생");
    }

    return result;
  }

}
