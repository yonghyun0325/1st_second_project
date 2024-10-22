package com.human.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/hr")
@AllArgsConstructor
public class HrController {

    // 인사 정보
    @GetMapping("/info")
    public String hrInfo() {
        return "hr/info"; 
    }
    
}