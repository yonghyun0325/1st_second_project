package com.human.web.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.human.web.vo.HelpVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class HelpDAO {
    private SqlSession sqlSession;

    public static final String MAPPER = "com.human.web.mapper.HelpMapper";

    public int insertHelp(HelpVO helpVO) {
        return sqlSession.insert(MAPPER+".insertHelp", helpVO);
    }
        
    public List<HelpVO> getHelp(int e_idx) {
        return sqlSession.selectList(MAPPER+ ".getHelp", e_idx);
    }
}
