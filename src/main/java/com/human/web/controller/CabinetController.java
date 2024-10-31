package com.human.web.controller;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.web.service.CabinetService;
import com.human.web.vo.CabinetVO;
import com.human.web.vo.EmployeesVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CabinetController {

    private CabinetService cabinetService;
    
    

    @PostMapping("/insertCabinet")
    public ResponseEntity<String> insertCabinet(@RequestParam String title, 
            @RequestParam String description, HttpSession session) 
             {
    	EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
        	return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Error: 로그인 세션이 만료되었습니다.");
        }
        
        int e_idx = loginUser.getE_idx();
    	CabinetVO cabinet = new CabinetVO();
    	
    	cabinet.setE_idx(e_idx);
        cabinet.setTitle(title);
        cabinet.setDescription(description);
       
        int result = cabinetService.insertCabinet(cabinet);
        
        if (result > 0) {
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: DB 삽입 실패");
        }
    }
}
