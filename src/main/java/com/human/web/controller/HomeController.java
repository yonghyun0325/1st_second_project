package com.human.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
    
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

    // 로그인 페이지 요청
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // 메인, 대시보드
    @GetMapping("/dashboard")
    public String dashboardPage() {
        return "main"; 
    }

    // 메인, 내 사무실
    @GetMapping("/myoffice")
    public String officePage() {
        return "main"; 
    }

    /* ───────────────────────────────────
            재무 관리 관련 맵핑
     ──────────────────────────────────── */
    // 재무 관리
    @GetMapping("/financial")
    public String financialPage() {
        return "financial/financial"; 
    }

    // 급여 관리
    @GetMapping("/financial/registration")
    public String financialRegistration() {
        return "financial/registration"; 
    }

    /* ───────────────────────────────────
                게시판 관련 맵핑
     ──────────────────────────────────── */
    // 인사 관리
    @GetMapping("/hr")
    public String hrPage() {
        return "hr/hr"; 
    }

    // 인사 정보
    @GetMapping("/hr/info")
    public String hrInfo() {
        return "hr/info"; 
    }
    
    
    /* ───────────────────────────────────
                에러 페이지
     ──────────────────────────────────── */
    @GetMapping("/error/error403")
    public String error403() {
        return "error/error403";
    }

    @GetMapping("/error/error404")
    public String error404() {
        return "error/error404";
    }

    @GetMapping("/error/error405")
    public String error405() {
        return "error/error405";
    }

    @GetMapping("/error/error500")
    public String error500() {
        return "error/error500";
    }
}