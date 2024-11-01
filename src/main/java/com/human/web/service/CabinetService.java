package com.human.web.service;

import java.util.List;

import com.human.web.vo.CabinetVO;

public interface CabinetService {
    
    int insertCabinet(CabinetVO cabinetVO);

    CabinetVO getCabinet(int e_idx);

	List<CabinetVO> getCabinets();
    
	List<CabinetVO> getDepaCabinets(String depa);
}

