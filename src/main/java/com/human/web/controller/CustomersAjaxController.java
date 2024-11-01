package com.human.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.human.web.service.CustomerService;
import com.human.web.vo.BoardVO;
import com.human.web.vo.CustomersVO;
import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/customers")
@AllArgsConstructor
public class CustomersAjaxController {

    private final CustomerService customerService; // 필드 선언 및 생성자 주입

    @GetMapping("/{c_idx}")
    public CustomersVO getCustomerById(@PathVariable int c_idx) {
        return customerService.getCustomerById(c_idx);
    }

    @GetMapping("/all")
    public List<CustomersVO> getAllCustomers() {
        return customerService.getAllCustomers();
    }

    @PutMapping("/update")
    public String updateCustomer(CustomersVO vo) {
        customerService.updateCustomer(vo);
        return "Customer updated successfully!";
    }

    @DeleteMapping("/{c_idx}")
    public String deleteCustomer(@PathVariable int c_idx) {
        customerService.deleteCustomer(c_idx);
        return "Customer deleted successfully!";
    }
    
    @RequestMapping("/customers")
    public String getCustomers(Model model) {
        List<CustomersVO> customers = customerService.getAllCustomers();
        model.addAttribute("customers", customers);
        if (customers == null) {
            System.out.println("고객 리스트가 null입니다.");
        } else {
            System.out.println("고객 수: " + customers.size());
        }
        return "views/customers/info"; // JSP 페이지 이름
    }
    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> registerCustomer(@ModelAttribute CustomersVO vo, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();

    	System.out.println("registerCustomer 실행");
    	
        try {
            int result = customerService.saveCustomer(vo);
            if (result == 1) { // 글 등록 성공
                response.put("status", "success");
            } else {
                response.put("status", "fail");
                response.put("message", "글 등록에 실패했습니다.");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
        }
        
        return ResponseEntity.ok(response);
    }
}
