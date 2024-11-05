package com.human.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

    @GetMapping("/depaset")
    public String adminDepa() {
        return "admin/depaset"; 
    }

    @GetMapping("/help")
    public String adminHelp() {
        return "admin/help"; 
    }

}