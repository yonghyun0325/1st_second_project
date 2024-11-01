package com.human.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/customers")
@AllArgsConstructor
public class CustomerController {

    // 고객 정보
    @GetMapping("/info")
    public String customersInfo() {
        return "customers/info"; 
    }
    
}