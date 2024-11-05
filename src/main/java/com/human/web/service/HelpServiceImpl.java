package com.human.web.service;

import java.util.List;
import java.util.Map;

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
    public List<Map<String, Object>> getAllHelps() {
        return helpDAO.getAllHelps();
    }

    @Override
    public HelpVO getHelpDetail(int helpId) {
        return helpDAO.getHelpDetail(helpId);
    }

    @Override
    public int deleteHelp(int helpId) {
        return helpDAO.deleteHelp(helpId);
    }

}
