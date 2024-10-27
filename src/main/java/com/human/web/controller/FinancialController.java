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

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/financial")
public class FinancialController {

    private final FinancialService financialService;

    // 급여 관리
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
    public ResponseEntity<String> saveFinancialInfo(@ModelAttribute FinancialVO vo) {
        int result = financialService.saveFinancialInfo(vo);
        if (result == 1) {
            return ResponseEntity.ok("급여 정보가 업데이트되었습니다.");
        } else if (result == 2) {
            return ResponseEntity.ok("급여 정보가 추가되었습니다.");
        } else {
            return ResponseEntity.status(500).body("업데이트 또는 추가 실패");
        }
    }
    
}