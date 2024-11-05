package com.human.web.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.web.vo.CalendarVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class CalendarDAO {

    private final SqlSession sqlSession;

    private static final String NAMESPACE = "com.human.web.mapper.CalendarMapper";

    // 일정 등록
    public int addTask(CalendarVO calendarVO) {
        return sqlSession.insert(NAMESPACE + ".addTask", calendarVO);
    }

    // 특정 사원의 일정 조회
    public List<CalendarVO> getTask(int eIdx) {
        return sqlSession.selectList(NAMESPACE + ".getTask", eIdx);
    }

    public int deleteTask(int eIdx, String selectedDate) {
        Map<String, Object> params = new HashMap<>();
        params.put("e_idx", eIdx);
        params.put("task_date", selectedDate);
        return sqlSession.delete(NAMESPACE + ".deleteTask", params);
    }

    public int updateTask(CalendarVO calendarVO) {
        return sqlSession.update(NAMESPACE + ".updateTask", calendarVO);
    }

}