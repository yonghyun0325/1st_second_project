package com.human.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/purchase")
@AllArgsConstructor
public class PurchaseControlle {

    // 인사 정보
    @GetMapping("/registration")
    public String hrInfo() {
        return "purchase/registration"; 
    }
    
}