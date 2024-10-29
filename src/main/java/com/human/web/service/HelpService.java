package com.human.web.service;

import java.util.List;
import com.human.web.vo.HelpVO;

public interface HelpService {
    int insertHelp(HelpVO helpVO);
    List<HelpVO> getHelp(int e_idx);
}
