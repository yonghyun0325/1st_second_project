package com.human.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.web.service.HelpService;
import com.human.web.vo.HelpVO;

@Controller
@RequestMapping("/help")
public class HelpController {
    @Autowired
    private HelpService helpService;

    @PostMapping("/insertHelp")
    public String insertHelp(@RequestParam("product") String product,
                            @RequestParam("service") String service,
                            @RequestParam("etcQuestion") String etcQuestion) {
        HelpVO help = new HelpVO();
        help.setProduct(product);
        help.setService(service);
        help.setEtcQuestion(etcQuestion);
        
        helpService.insertHelp(help);
        return "redirect:/"; // 처리 후 이동할 경로
    }

    // GET 요청 처리
    @GetMapping
    public String getHelp() {
        return "help"; // help.jsp 또는 help.html과 같은 뷰 페이지 이름
    }
}
