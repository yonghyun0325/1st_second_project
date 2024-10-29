package com.human.web.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.human.web.repository.HelpDAO;
import com.human.web.vo.HelpVO;

@Service
public class HelpServiceImpl implements HelpService {
    @Autowired
    private HelpDAO helpDAO;

    @Override
    public int insertHelp(HelpVO helpVO) {
        return helpDAO.insertHelp(helpVO);
    }

    @Override
    public List<HelpVO> getHelp(int e_idx) { // 메서드 이름 변경
        return helpDAO.getHelp(e_idx);
    }
}
