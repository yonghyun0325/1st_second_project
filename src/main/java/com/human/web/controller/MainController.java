package com.human.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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

    @GetMapping("/dashboard")
    public String dashboard(@PathVariable("pageName") String pageName, Model model) {
        model.addAttribute("page", pageName);
        return "main";
    }

    @GetMapping("/myoffice")
    public String myoffice(@PathVariable("pageName") String pageName, Model model) {
        model.addAttribute("page", pageName);
        return "main";
    }
}