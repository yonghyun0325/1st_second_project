package com.human.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.human.web.service.CabinetService;
import com.human.web.vo.CabinetVO;
import com.human.web.vo.EmployeesVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MainController {

    private CabinetService cabinetService;
    
    @GetMapping("/")
    public void home(HttpSession session, HttpServletResponse response) throws IOException {
        // 로그인 관련 세션 정보 가져오기
        Object loginUser = session.getAttribute("employees");
        
        if (loginUser == null) {
            // 로그인 되어 있지 않으면 로그인 페이지로 이동
            response.sendRedirect("/login");
        } else {
            // 로그인 되어 있으면 대시보드 페이지로 이동
            response.sendRedirect("/dashboard");
        }
    }

    // 로그인 페이지 맵핑
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // 대시보드 페이지 맵핑
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("page", "dashboard");
        return "main";
    }

    // 내 사무실 페이지 맵핑
    @GetMapping("/myoffice")
    public String myoffice(Model model) {
        model.addAttribute("page", "myoffice");
        return "main";
    }

    // 내 회의실 페이지 맵핑
    @GetMapping("/cabinet")
    public String cabinet(HttpServletRequest request, Model model) {
        List<CabinetVO> cabinets = cabinetService.getCabinets();
        HttpSession session = request.getSession();
        EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");
        int e_idx = employees.getE_idx();

        model.addAttribute("e_idx", e_idx);
        model.addAttribute("cabinets", cabinets);
        model.addAttribute("page", "cabinet");
        return "main"; 
    }

}