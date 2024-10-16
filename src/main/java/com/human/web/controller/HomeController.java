package com.human.web.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

    @GetMapping("/")
    public String home(HttpSession session) {
        Object loginUser = session.getAttribute("employees");
        System.out.println("loginUser: " + loginUser);
        
        if (loginUser == null) {
            return "login/login";
        } else {
            return "dashboard/dashboard";
        }
    }

    // 재무 관리
    @GetMapping("/financial")
    public String financialPage() {
        return "financial/financial"; // 수당등록 페이지로 이동
    }

    // 인사 관리
    @GetMapping("/hr")
    public String hrPage() {
        return "hr/hr"; // 수당등록 페이지로 이동
    }
    
    // 커뮤니티
    @GetMapping("/community")
    public String communityPage() {
        return "community/community"; // 수당등록 페이지로 이동
    }

    // 에러 페이지 처리
    @GetMapping("/error/error403.do")
    public String error403() {
        return "error/error403";
    }

    @GetMapping("/error/error404.do")
    public String error404() {
        return "error/error404";
    }

    @GetMapping("/error/error405.do")
    public String error405() {
        return "error/error405";
    }

    @GetMapping("/error/error500.do")
    public String error500() {
        return "error/error500";
    }
}