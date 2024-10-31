package com.human.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.HelpService;
import com.human.web.vo.EmployeesVO;
import com.human.web.vo.HelpVO;

@Controller
@RequestMapping("/help")
public class HelpController {

    @Autowired
    private HelpService helpService;

    @PostMapping("/insertHelp.do")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> insertHelp(HelpVO help, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        HttpSession session = request.getSession();

        EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");
        if (employees != null) {
            help.setE_idx(employees.getE_idx());
        } else {
            Integer guestIdx = Integer.parseInt(request.getParameter("e_idx"));
            help.setE_idx(guestIdx);
        }

        try {
            int result = helpService.insertHelp(help);
            if (result == 1) {
                response.put("status", "success");
                response.put("message", "문의가 성공적으로 접수되었습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "문의 접수에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    @GetMapping
    public String getHelp() {
        return "help";
    }
}
