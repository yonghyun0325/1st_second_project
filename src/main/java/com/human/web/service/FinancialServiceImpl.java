package com.human.web.service;

import org.springframework.stereotype.Service;
import com.human.web.repository.FinancialDAO;
import com.human.web.vo.FinancialVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class FinancialServiceImpl implements FinancialService {
    private final FinancialDAO financialDAO;

    @Override
    public FinancialVO getFinancialInfo(int e_idx) {
        return financialDAO.getFinancialInfo(e_idx);
    }

    @Override
    public int saveFinancialInfo(FinancialVO vo) {
        return financialDAO.saveFinancialInfo(vo);
    }

}