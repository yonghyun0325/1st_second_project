package com.human.web.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
        
    public List<Map<String, Object>> getAllHelps() {
        return sqlSession.selectList(MAPPER + ".getAllHelps");
    }

    public HelpVO getHelpDetail(int helpId) {
        return sqlSession.selectOne(MAPPER + ".getHelpDetail", helpId);
    }

    public int deleteHelp(int helpId) {
        return sqlSession.delete(MAPPER + ".deleteHelp", helpId);
    }
}
