package com.human.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.web.repository.CabinetFavoriteDAO;
import com.human.web.vo.CabinetFavoriteVO;

@Service
public class CabinetFavoriteServiceImpl implements CabinetFavoriteService {

    @Autowired
    private CabinetFavoriteDAO cabinetFavoriteDAO;

    @Override
    public void addFavorite(int e_idx, int c_id) {
        cabinetFavoriteDAO.addFavorite(e_idx, c_id);
    }

    @Override
    public void removeFavorite(int e_idx, int c_id) {
        cabinetFavoriteDAO.removeFavorite(e_idx, c_id);
    }

    @Override
    public List<CabinetFavoriteVO> getFavoritesByEmployee(int e_idx) {
        return cabinetFavoriteDAO.getFavoritesByEmployee(e_idx);
    }
}
