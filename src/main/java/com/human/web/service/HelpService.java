package com.human.web.service;

import java.util.List;
import com.human.web.vo.HelpVO;
import java.util.Map;
public interface HelpService {

    int insertHelp(HelpVO helpVO);

    List<Map<String, Object>> getAllHelps();

    HelpVO getHelpDetail(int helpId);

    int deleteHelp(int helpId);

}
