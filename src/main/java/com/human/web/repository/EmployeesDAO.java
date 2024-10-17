package com.human.web.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.human.web.vo.EmployeesVO;

import lombok.AllArgsConstructor;

@Repository // DB와 관련된 작업을 하는 클래스에 붙여줌
@AllArgsConstructor
public class EmployeesDAO {
	
	// MyBatis의 sqlSession 객체를 이용해서 DBCP 이용
	private SqlSession sqlSession;
	
	// 비밀번호 암호화 관련 객체 의존 자동 주입
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// MyBatis의 Mapper를 이용하기 위해 사용되는 상수 정의
	public static final String MAPPER = "com.human.web.mapper.EmployeesMapper";
	
	// 로그인
	public EmployeesVO login(Map<String, Object> map) {
		EmployeesVO vo = null; // 로그인 실패 시 결과값
		// String rawPassword = "1234"; // 실제 비밀번호
		// String encodedPassword = bCryptPasswordEncoder.encode(rawPassword);
		// System.out.println("암호화된 비밀번호: " + encodedPassword);
		try {
			// 사원번호(e_idx)로 암호화된 비밀번호 가져오기
			String encodePassword = sqlSession.selectOne(MAPPER + ".getPassword", map.get("e_idx"));
			// 입력된 비밀번호와 암호화된 비밀번호 비교
			boolean flag = bCryptPasswordEncoder.matches((String) map.get("e_pw"), encodePassword);
			// 비밀번호가 일치하는 경우에만 로그인 처리
			if (flag) {
				vo = sqlSession.selectOne(MAPPER + ".login", map.get("e_idx"));
			}
		} catch (Exception e) {
			System.out.println("로그인 중 예외 발생");
			e.printStackTrace();
		}
		
		return vo;
	}

	// 회원 정보 업데이트
	public int updateEmployees(EmployeesVO vo) {
		int result = 0;

		try {
			result = sqlSession.update(MAPPER + ".updateEmployees", vo);
		} catch (Exception e) {
			System.out.println("회원정보 변경 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	// 회원 정보 조회
	public EmployeesVO getEmployees(int e_idx) {
		EmployeesVO vo = null;

		try {
			vo = sqlSession.selectOne(MAPPER + ".getEmployees", e_idx);
		} catch (Exception e) {
			System.out.println("회원정보 조회 중 예외 발생");
			e.printStackTrace();
		}

		return vo;
	}

	// 회원 탈퇴 처리
	public int cancel(int e_idx) {
		int result = 0;

		try {
			result = sqlSession.update(MAPPER + ".cancel", e_idx);
		} catch (Exception e) {
			System.out.println("회원탈퇴 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}
    
	//글목록 조회
	public List<EmployeesVO> getEmployeesList() {
		return sqlSession.selectList(MAPPER+".getEmployeesList");
	}
}
