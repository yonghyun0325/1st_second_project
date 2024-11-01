package com.human.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.web.repository.CabinetDAO;
import com.human.web.vo.CabinetVO;

@Service
public class CabinetServiceImpl implements CabinetService {
    @Autowired
    private CabinetDAO cabinetDAO;

    @Override
    public int insertCabinet(CabinetVO cabinetVO) {
        return cabinetDAO.insertCabinet(cabinetVO);
    }

    @Override
    public CabinetVO getCabinet(int e_idx) { // 메서드 이름 변경
        return cabinetDAO.getCabinet(e_idx);
    }

	@Override
	public List<CabinetVO> getCabinets() {
		return cabinetDAO.getCabinets();
	}

    @Override
    public List<CabinetVO> getDepaCabinets(String depa) {
        return cabinetDAO.getDepaCabinets(depa);
    }
}