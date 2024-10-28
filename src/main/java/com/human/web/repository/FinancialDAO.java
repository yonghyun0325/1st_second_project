package com.human.web.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.human.web.vo.FinancialVO;
import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class FinancialDAO {
    private final SqlSession sqlSession;
    private static final String MAPPER = "com.human.web.mapper.FinancialMapper";

    public FinancialVO getFinancialInfo(int e_idx) {
        return sqlSession.selectOne(MAPPER + ".getFinancialInfo", e_idx);
    }

    public int saveFinancialInfo(FinancialVO vo) {
        FinancialVO existingInfo = getFinancialInfo(vo.getE_idx());
        if (existingInfo != null) {
            return sqlSession.update(MAPPER + ".updateFinancialInfo", vo);
        } else {
            return sqlSession.insert(MAPPER + ".insertFinancialInfo", vo);
        }
    }
}