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
    public String addTask(@RequestParam("taskDescription") String setTask_description,
                          @RequestParam("selectedDate") String selected_date,
                          HttpSession session) {
                            
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return "Error: 로그인 세션이 만료되었습니다.";
        }
        
        int e_idx = loginUser.getE_idx();

        CalendarVO calendarVO = new CalendarVO();
        calendarVO.setE_idx(e_idx);
        calendarVO.setTask_date(selected_date);
        calendarVO.setTask_description(setTask_description);
        System.out.println("저장할 달력 데이터 CalendarVO: "+ e_idx + ", " + setTask_description + ", " + selected_date);

        int result = calendarService.addTask(calendarVO);

        return (result > 0) ? "Success" : "Error";
    }

    @PostMapping("/getTask")
    @ResponseBody
    public List<CalendarVO> getTask(HttpSession session) {
        EmployeesVO loginUser = (EmployeesVO) session.getAttribute("employees");
        if (loginUser == null) {
            return Collections.emptyList();
        }

        int eIdx = loginUser.getE_idx();
        System.out.println("달력 데이터 호출, 호출자 eIdx: " + eIdx);
        return calendarService.getTask(eIdx);
    }

}