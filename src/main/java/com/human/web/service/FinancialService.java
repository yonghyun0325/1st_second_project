package com.human.web.service;

import com.human.web.vo.FinancialVO;

public interface FinancialService {

    FinancialVO getFinancialInfo(int e_idx);

    int saveFinancialInfo(FinancialVO vo);

}