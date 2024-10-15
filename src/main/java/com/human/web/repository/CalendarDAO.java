package com.human.web.repository;

import java.util.List;

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
    public int insertTask(CalendarVO calendarVO) {
        return sqlSession.insert(NAMESPACE + ".insertTask", calendarVO);
    }

    // 특정 사원의 일정 조회
    public List<CalendarVO> getTask(int empIdx) {
        return sqlSession.selectList(NAMESPACE + ".getTask", empIdx);
    }
}