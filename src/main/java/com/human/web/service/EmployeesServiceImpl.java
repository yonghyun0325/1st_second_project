package com.human.web.service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.human.web.repository.EmployeesDAO;
import com.human.web.vo.EmployeesVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EmployeesServiceImpl implements EmployeesService {
	
	// MemberDAO 클래스를 의존 주입받음
	private final EmployeesDAO dao;
	
	// 메일 인증 관련 객체
	private final JavaMailSenderImpl mailSender;
	
	// 비밀번호 암호화 객체
	private final BCryptPasswordEncoder bCryptPasswordEncoder;

	// 로그인 처리 (e_idx와 비밀번호를 사용)
	@Override
	public EmployeesVO login(int e_idx, String e_pw) {
		// 로그인 정보 매핑
		Map<String, Object> map = new HashMap<>();
		map.put("e_idx", e_idx);
		map.put("e_pw", e_pw);
		
		return dao.login(map);
	}

	// 회원 정보 변경 (비밀번호 암호화 후 업데이트)
	@Override
	public EmployeesVO updateEmployees(EmployeesVO vo) {
		EmployeesVO newVo = null;

		// 비밀번호 암호화
		String rawPassword = vo.getE_pw();
		String encodePassword = bCryptPasswordEncoder.encode(rawPassword);
		vo.setE_pw(encodePassword);

		// 업데이트 성공 여부에 따른 처리
		if (dao.updateEmployees(vo) == 1) {
			newVo = dao.getEmployees(vo.getE_idx());
		}

		return newVo;
	}

	// 최종 퇴사처리
	@Override
	public int cancel(int e_idx) {
		return dao.cancel(e_idx);
	}

	// 메일 인증
	@Override
	public String authEmail(String email) {
		// 인증 코드 생성
		int authNumber = (int)(Math.random() * 888889) + 111111;
		
		String setFrom = "example@gmail.com"; // 송신자의 이메일 주소
		String toMail = email; // 수신자의 이메일 주소
		String title = "회원가입 인증 메일입니다."; // 이메일 제목
		String content = "인증번호: " + authNumber + "<br>해당 인증번호를 인증번호 확인란에 입력해 주세요.";
		
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNumber);
	}

	// 이메일 전송 메소드
	private void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
