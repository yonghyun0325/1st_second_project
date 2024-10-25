package com.human.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/error")
@AllArgsConstructor
public class ErrorController {
    @GetMapping("error403")
    public String error403() {
        return "error/error403";
    }

    @GetMapping("error404")
    public String error404() {
        return "error/error404";
    }

    @GetMapping("error405")
    public String error405() {
        return "error/error405";
    }

    @GetMapping("error500")
    public String error500() {
        return "error/error500";
    }
}
