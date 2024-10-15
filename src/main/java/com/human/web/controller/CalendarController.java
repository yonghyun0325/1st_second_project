package com.human.web.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @PostMapping("/addTask")
    @ResponseBody
    public String addTask(@RequestParam("taskDescription") String taskDescription,
                          @RequestParam("selectedDate") String selectedDate,
                          HttpSession session) {
        System.out.println("달력 데이터 저장, 받아온 데이터" + taskDescription + ", " + selectedDate);
                            
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return "Error: 로그인 세션이 만료되었습니다.";
        }

        
        int eIdx = loginUser.getE_idx();

        CalendarVO calendarVO = new CalendarVO();
        calendarVO.setE_idx(eIdx);
        calendarVO.setTaskDate(selectedDate);
        calendarVO.setTaskDescription(taskDescription);

        int result = calendarService.insertTask(calendarVO);

        return (result > 0) ? "Success" : "Error";
    }

    @PostMapping("/getTask")
    @ResponseBody
    public List<CalendarVO> getTasks(HttpSession session) {
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return Collections.emptyList();
        }

        int eIdx = loginUser.getE_idx();
        System.out.println("달력 데이터 호출, 호출자 eIdx" + eIdx);
        return calendarService.getTask(eIdx);
    }

}