package com.human.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.human.web.service.CommunityService;
import com.human.web.vo.CommunityVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

    private final CommunityService communityService;

    @GetMapping("/")
    public void home(HttpSession session, HttpServletResponse response) throws IOException {
        Object loginUser = session.getAttribute("employees");
        System.out.println("loginUser: " + loginUser);
        
        if (loginUser == null) {
            // 로그인 되어 있지 않으면 로그인 페이지로 이동
            response.sendRedirect("/login.do");
        } else {
            // 로그인 되어 있으면 대시보드 페이지로 이동
            response.sendRedirect("/dashboard");
        }
    }

    // 로그인 페이지 요청
    @GetMapping("/login.do")
    public String login() {
        return "login";
    }

    // 메인, 대시보드
    @GetMapping("/dashboard")
    public String dashboardPage() {
        return "dashboard/dashboard"; 
    }

    // 재무 관리
    @GetMapping("/financial")
    public String financialPage() {
        return "financial/financial"; 
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
                게시판 관련 맵핑
     ──────────────────────────────────── */
    // 게시판 호출
    @GetMapping("/community")
    public String communityPage() {
        return "community/community"; 
    }

    // 게시글 목록
    @GetMapping("/community/home")
    public String communityHome(Model model) {
        List<CommunityVO> communityList = communityService.getBoardList();
        model.addAttribute("communityList", communityList);
        return "community/home";
    }

    // 공지사항
    @GetMapping("/community/notice")
    public String communityNotice() {
        return "community/notice"; 
    }

    // 분실물
    @GetMapping("/community/lost")
    public String communityLost() {
        return "community/lost"; 
    }

    /* ───────────────────────────────────
                에러 페이지
     ──────────────────────────────────── */
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