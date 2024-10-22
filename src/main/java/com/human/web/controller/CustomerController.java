package com.human.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/customer")
@AllArgsConstructor
public class CustomerController {

    // 인사 정보
    @GetMapping("/registration")
    public String hrInfo() {
        return "customer/registration"; 
    }
    
}