package com.human.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.CalendarService;
import com.human.web.vo.CalendarVO;

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
        String userIdStr = (String) session.getAttribute("emp_idx");
        if (userIdStr == null) {
            return "Error: 로그인 세션이 만료되었습니다.";
        }

        int empIdx = Integer.parseInt(userIdStr);

        CalendarVO calendarVO = new CalendarVO();
        calendarVO.setEmpIdx(empIdx);
        calendarVO.setTaskDate(selectedDate);
        calendarVO.setTaskDescription(taskDescription);

        int result = calendarService.insertTask(calendarVO);

        return (result > 0) ? "Success" : "Error";
    }
}