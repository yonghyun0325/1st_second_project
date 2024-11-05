package com.human.web.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.CalendarService;
import com.human.web.vo.CalendarVO;
import com.human.web.vo.EmployeesVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/calendar")
@RequiredArgsConstructor
public class CalendarController {

    private final CalendarService calendarService;

    @PostMapping("/getTask")
    @ResponseBody
    public ResponseEntity<List<CalendarVO>> getTask(HttpSession session) {
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.UNAUTHORIZED);
        }

        int eIdx = loginUser.getE_idx();
        List<CalendarVO> tasks = calendarService.getTask(eIdx);
        return new ResponseEntity<>(tasks, HttpStatus.OK);
    }

    @PostMapping("/addTask")
    @ResponseBody
    public ResponseEntity<String> addTask(@RequestBody CalendarVO calendarVO, HttpSession session) {
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return new ResponseEntity<>("Error: 로그인 세션이 만료되었습니다.", HttpStatus.UNAUTHORIZED);
        }
    
        int e_idx = loginUser.getE_idx();
        calendarVO.setE_idx(e_idx);
        int result = calendarService.addTask(calendarVO);
        
        return (result > 0) 
            ? new ResponseEntity<>("Success", HttpStatus.OK) 
            : new ResponseEntity<>("Error: 할 일을 추가하지 못했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    @PostMapping("/updateTask")
    @ResponseBody
    public ResponseEntity<String> updateTask(@RequestBody Map<String, String> task, HttpSession session) {
        String task_description = task.get("taskDescription");
        String selected_date = task.get("selectedDate");
    
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return new ResponseEntity<>("Error: 로그인 세션이 만료되었습니다.", HttpStatus.UNAUTHORIZED);
        }
    
        int e_idx = loginUser.getE_idx();
        CalendarVO calendarVO = new CalendarVO();
        calendarVO.setE_idx(e_idx);
        calendarVO.setTask_date(selected_date);
        calendarVO.setTask_description(task_description);
    
        int result = calendarService.updateTask(calendarVO);
        return (result > 0) 
            ? new ResponseEntity<>("Success", HttpStatus.OK) 
            : new ResponseEntity<>("Error: 할 일을 수정하지 못했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    @PostMapping("/deleteTask")
    @ResponseBody
    public ResponseEntity<String> deleteTask(@RequestBody Map<String, String> task, HttpSession session) {
        String selected_date = task.get("selectedDate");
    
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return new ResponseEntity<>("Error: 로그인 세션이 만료되었습니다.", HttpStatus.UNAUTHORIZED);
        }
    
        int e_idx = loginUser.getE_idx();
        int result = calendarService.deleteTask(e_idx, selected_date);
        return (result > 0) 
            ? new ResponseEntity<>("Success", HttpStatus.OK) 
            : new ResponseEntity<>("Error: 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
