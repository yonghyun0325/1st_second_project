package com.human.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.web.vo.CabinetFavoriteVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class CabinetFavoriteDAO {
    private SqlSession sqlSession;

    public static final String MAPPER = "com.human.web.mapper.CabinetFavoriteMapper";

    public void addFavorite(int e_idx, int c_id) {
        CabinetFavoriteVO favorite = new CabinetFavoriteVO();
        favorite.setE_idx(e_idx);
        favorite.setC_id(c_id);
        sqlSession.insert(MAPPER + ".insertFavorite", favorite);
    }

    public void removeFavorite(int e_idx, int c_id) {
        CabinetFavoriteVO favorite = new CabinetFavoriteVO();
        favorite.setE_idx(e_idx);
        favorite.setC_id(c_id);
        sqlSession.delete(MAPPER + ".deleteFavorite", favorite);
    }

    public List<CabinetFavoriteVO> getFavoritesByEmployee(int e_idx) {
        return sqlSession.selectList(MAPPER + ".getFavoritesByEmployee", e_idx);
    }
}
