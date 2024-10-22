package com.human.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MainController {
    
    @GetMapping("/")
    public void home(HttpSession session, HttpServletResponse response) throws IOException {
        Object loginUser = session.getAttribute("employees");
        
        if (loginUser == null) {
            // 로그인 되어 있지 않으면 로그인 페이지로 이동
            response.sendRedirect("/login");
        } else {
            // 로그인 되어 있으면 대시보드 페이지로 이동
            response.sendRedirect("/dashboard");
        }
    }

    // 로그인 페이지
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // 메인, 대시보드
    @GetMapping("/dashboard")
    public String dashboardPage() {
        return "dashboard"; 
    }

    // 메인, 내 사무실
    @GetMapping("/myoffice")
    public String officePage() {
        return "myoffice"; 
    }

    // 메인, 내 회의실
    @GetMapping("/cabinet")
    public String cabinetPage() {
        return "cabinet"; 
    }
}