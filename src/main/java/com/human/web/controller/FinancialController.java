package com.human.web.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.FinancialService;
import com.human.web.vo.FinancialVO;
import java.util.HashMap;
import java.util.Map;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/financial")
public class FinancialController {

    private final FinancialService financialService;

    @GetMapping("/registration")
    public String financialRegistration() {
        return "financial/registration"; 
    }

    @GetMapping("/getFinancialInfo/{e_idx}")
    public ResponseEntity<FinancialVO> getFinancialInfo(@PathVariable int e_idx) {
        FinancialVO financialInfo = financialService.getFinancialInfo(e_idx);
        return ResponseEntity.ok(financialInfo);
    }

    @PostMapping("/saveFinancialInfo.do")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> saveFinancialInfo(@ModelAttribute FinancialVO vo) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            int result = financialService.saveFinancialInfo(vo);
            if (result == 1) {
                response.put("status", "success");
            } else {
                response.put("status", "fail");
                response.put("message", "저장에 실패했습니다.");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
        }
        
        return ResponseEntity.ok(response);
    }
    
}