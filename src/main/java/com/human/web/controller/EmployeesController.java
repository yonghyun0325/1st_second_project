package com.human.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.EmployeesService;
import com.human.web.vo.EmployeesVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/employees") // 공통으로 적용되는 URL 정의
@RequiredArgsConstructor
public class EmployeesController {

    // 요청을 처리하는 데 사용되는 EmployeesServiceImpl 클래스를 의존 자동 주입받음
    private final EmployeesService employeesService;

    // 로그인 페이지 요청
    @GetMapping("/login.do")
    public String login() {
        return "login";
    }
    

    // 로그인 처리 요청
    @PostMapping("/loginProcess.do")
    @ResponseBody
    public ResponseEntity<Map<String, String>> loginProcess(int e_idx, String e_pw, HttpServletRequest request) {
        Map<String, String> response = new HashMap<>();

        EmployeesVO vo = employeesService.login(e_idx, e_pw);
        System.out.println("로그인 처리 요청 호출");

        if (vo != null) {
            // 로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("employees", vo);
            response.put("status", "success");
            System.out.println("로그인 성공 response: " + response);
            return ResponseEntity.ok(response);
        } else {
            // 로그인 실패
            response.put("status", "fail");
            System.out.println("로그인 처리 실패 response: " + response);
            return ResponseEntity.ok(response);
        }
    }

    // 로그아웃 요청
    @GetMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); // 세션 초기화
        return "redirect:/"; // 메인 페이지로 리다이렉트
    }

    // 회원 정보 변경 페이지 요청
    @GetMapping("/update.do")
    public String update() {
        return "employees/update";
    }

    // 회원 정보 변경 처리 요청
    @PostMapping("/updateProcess.do")
    public String updateProcess(EmployeesVO vo, HttpServletRequest request, Model model) {
        String viewName = "employees/update"; // 회원 정보 변경 실패 시 뷰 이름

        // 회원 정보 업데이트 처리
        EmployeesVO newVo = employeesService.updateEmployees(vo);

        if (newVo != null) { // 회원 정보 변경 성공
            HttpSession session = request.getSession();
            session.setAttribute("employees", newVo); // 세션에 새로운 회원 정보 저장
            viewName = "redirect:/index.do"; // 메인 페이지 재요청
        } else { // 회원 정보 변경 실패
            model.addAttribute("msg", "회원 정보 변경 중 오류가 발생했습니다. 내용을 확인해 주세요.");
        }

        return viewName;
    }

    // 회원 탈퇴 요청
//    @GetMapping("/cancelProcess.do")
//    public String cancelProcess(HttpServletRequest request, Model model) {
//        HttpSession session = request.getSession();
//        EmployeesVO vo = (EmployeesVO) session.getAttribute("Employees");
//        int emp_idx = vo.getemp_idx(); // 세션에서 사원번호(emp_idx) 가져오기
//
//        // 회원 탈퇴 처리
//        int result = EmployeesServiceImpl.cancel(emp_idx);
//
//        String viewName = "Employees/update"; // 회원 탈퇴 실패 시 뷰 이름
//
//        if (result == 1) { // 회원 탈퇴 성공
//            session.invalidate(); // 세션 초기화
//            viewName = "redirect:/index.do";
//        } else { // 회원 탈퇴 실패
//            model.addAttribute("msg", "회원 탈퇴 중 시스템 오류가 발생했습니다.");
//        }
//
//        return viewName;
//    }
}
