package com.human.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.human.web.repository.CalendarDAO;
import com.human.web.vo.CalendarVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {

    private final CalendarDAO calendarDAO;

    @Override
    public int addTask(CalendarVO calendarVO) {
        return calendarDAO.addTask(calendarVO);
    }

    @Override
    public List<CalendarVO> getTask(int eIdx) {
        return calendarDAO.getTask(eIdx);
    }
}