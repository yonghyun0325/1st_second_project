package com.human.web.service;

import java.util.List;

import com.human.web.vo.CalendarVO;

public interface CalendarService {
    int insertTask(CalendarVO calendarVO);
    List<CalendarVO> getTasksByEmpIdx(int empIdx);
}