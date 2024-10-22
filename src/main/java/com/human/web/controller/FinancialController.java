package com.human.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/financial")
public class FinancialController {

    // 급여 관리
    @GetMapping("/registration")
    public String financialRegistration() {
        return "pages/financial/registration"; 
    }
    
}