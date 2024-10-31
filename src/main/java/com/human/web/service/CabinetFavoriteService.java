package com.human.web.service;

import java.util.List;
import com.human.web.vo.CabinetFavoriteVO;

public interface CabinetFavoriteService {

    void addFavorite(int e_idx, int c_id);

    void removeFavorite(int e_idx, int c_id);
    
    List<CabinetFavoriteVO> getFavoritesByEmployee(int e_idx);

}
