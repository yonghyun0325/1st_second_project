package com.human.web.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.DepartmentService;
import com.human.web.vo.DepartmentVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/depa")
@AllArgsConstructor
public class DepartmentController {

    private final DepartmentService departmentService;

    // 부서 목록 조회
    @GetMapping("/getDepaList")
    @ResponseBody
    public List<DepartmentVO> getAllDepartments() {
        return departmentService.getAllDepartments();
    }

    // 특정 부서 조회
    @GetMapping("/getDepa/{d_idx}")
    @ResponseBody
    public DepartmentVO getDepartmentById(@PathVariable int d_idx) {
        return departmentService.getDepartmentById(d_idx);
    }

    // 부서 등록
    @PostMapping("/insertDepa")
    @ResponseBody
    public ResponseEntity<String> insertDepartment(@RequestBody DepartmentVO department) {
        departmentService.insertDepartment(department);
        return ResponseEntity.ok("부서가 성공적으로 등록되었습니다.");
    }

    // 부서 수정
    @PutMapping("/editDepa/{d_idx}")
    @ResponseBody
    public ResponseEntity<String> updateDepartment(@PathVariable int d_idx, @RequestBody DepartmentVO department) {
        department.setD_idx(d_idx);
        departmentService.updateDepartment(department);
        return ResponseEntity.ok("부서가 성공적으로 수정되었습니다.");
    }

    // 부서 삭제
    @DeleteMapping("/deleteDepa/{d_idx}")
    @ResponseBody
    public ResponseEntity<String> deleteDepartment(@PathVariable int d_idx) {
        departmentService.deleteDepartment(d_idx);
        return ResponseEntity.ok("부서가 성공적으로 삭제되었습니다.");
    }
}