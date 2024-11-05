package com.human.web.service;

import java.util.List;

import com.human.web.vo.CalendarVO;

public interface CalendarService {

    int addTask(CalendarVO calendarVO);

    List<CalendarVO> getTask(int eIdx);

    int deleteTask(int eIdx, String task_date);

    int updateTask(CalendarVO calendarVO);

}