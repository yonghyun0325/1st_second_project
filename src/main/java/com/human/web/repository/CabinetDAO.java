package com.human.web.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.human.web.vo.CabinetVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class CabinetDAO {
    private SqlSession sqlSession;

    public static final String MAPPER = "com.human.web.mapper.CabinetMapper";

    public int insertCabinet(CabinetVO cabinetVO) {
        return sqlSession.insert(MAPPER+".insertCabinet", cabinetVO);
    }
        
    public List<CabinetVO> getCabinet(int e_idx) {
        return sqlSession.selectList(MAPPER+ ".getCabinet", e_idx);
    }

    public List<CabinetVO> getCabinets() {
        return sqlSession.selectList(MAPPER+ ".getCabinets");
    }
}
