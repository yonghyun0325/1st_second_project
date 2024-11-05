package com.human.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.EmployeesService;
import com.human.web.util.FileManager;
import com.human.web.vo.EmployeesVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/employees")
@RequiredArgsConstructor
public class EmployeesController {

    private final EmployeesService employeesService;
    private final FileManager fileManager;

    // 로그인 처리 요청
    @PostMapping("/loginProcess.do")
    @ResponseBody
    public ResponseEntity<Map<String, String>> loginProcess(int e_idx, String e_pw, HttpServletRequest request) {
        Map<String, String> response = new HashMap<>();

        EmployeesVO vo = employeesService.login(e_idx, e_pw);

        if (vo != null) {
            HttpSession session = request.getSession();
            session.setAttribute("employees", vo);
            response.put("status", "success");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "fail");
            return ResponseEntity.ok(response);
        }
    }

    // 로그아웃 요청
    @GetMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }

    // 회원 정보 변경 페이지 요청
    @GetMapping("/update.do")
    public String update() {
        return "employees/update";
    }

    // 사원 정보 가져오기
    @GetMapping("/getEmployee/{e_idx}")
    @ResponseBody
    public EmployeesVO getEmployees(@PathVariable int e_idx) {
        return employeesService.getEmployees(e_idx);
    }

    // 사원 세부정보 가져오기
    @GetMapping("/getEmployeeDetails/{e_idx}")
    @ResponseBody
    public Map<String, Object> getEmployeeDetails(@PathVariable int e_idx, HttpServletRequest request) {
        EmployeesVO employee = employeesService.getEmployeeDetails(e_idx);
    
        String photoUrl = fileManager.checkProfileImage(e_idx, request);
    
        Map<String, Object> response = new HashMap<>();
        response.put("employee", employee);
        response.put("photoUrl", photoUrl);
    
        return response;
    }

    // 사원 목록 가져오기
    @GetMapping("/getEmployeesList.do")
    @ResponseBody
    public List<EmployeesVO> getEmployeesList() {
        return employeesService.getEmployeesList();
    }
    
    // 사원 사진만 가져오기
    @GetMapping("/getProfileImage/{eIdx}")
    public ResponseEntity<String> getProfileImage(@PathVariable int eIdx, HttpServletRequest request) {
        String profileImagePath = fileManager.checkProfileImage(eIdx, request);
        System.out.println(profileImagePath);
        return ResponseEntity.ok(profileImagePath);
    }
    
    // 사원 정보 변경
    // @PostMapping("/updateProcess.do")
    // public String updateProcess(EmployeesVO vo, HttpServletRequest request, Model model) {
    //     String viewName = "employees/update";

    //     EmployeesVO newVo = employeesService.updateEmployees(vo);

    //     if (newVo != null) {
    //         HttpSession session = request.getSession();
    //         session.setAttribute("employees", newVo);
    //         viewName = "redirect:/index.do"; 
    //     } else { 
    //         model.addAttribute("msg", "회원 정보 변경 중 오류가 발생했습니다. 내용을 확인해 주세요.");
    //     }

    //     return viewName;
    // }
    
    // 퇴사 요청
    // @GetMapping("/cancelProcess.do")
    // public String cancelProcess(HttpServletRequest request, Model model) {
    //     HttpSession session = request.getSession();
    //     EmployeesVO vo = (EmployeesVO) session.getAttribute("Employees");
    //     int emp_idx = vo.getE_idx(); // 세션에서 사원번호(emp_idx) 가져오기

    //     // 회원 탈퇴 처리
    //     int result = EmployeesServiceImpl.cancel(emp_idx);

    //     if (result == 1) { 
    //         session.invalidate();
    //         viewName = "redirect:/index.do";
    //     } else { 
    //         model.addAttribute("msg", "회원 탈퇴 중 시스템 오류가 발생했습니다.");
    //     }

    //     return ResponseEntity.ok(profileImagePath);
    // }
}
