package com.human.web.controller;

// import java.io.IOException;
// import java.util.List;

// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/hr")
public class HrController {
    
    // 인사 등록 페이지 불러오기
    @GetMapping("/registration")
    public String hrRegistration() {
        return "hr/registration"; 
    }

    // 인사 정보
    @GetMapping("/info")
    public String hrInfo() {
        return "hr/info"; 
    }
}
