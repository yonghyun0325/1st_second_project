package com.human.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.web.service.CabinetService;
import com.human.web.vo.CabinetVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CabinetController {

    private CabinetService cabinetService;
    
    @GetMapping("/cabinet")
    public String cabinet(@PathVariable("pageName") String pageName, Model model) {
        List<CabinetVO> cabinets = cabinetService.getCabinets();
        model.addAttribute("cabinets", cabinets);
        model.addAttribute("page", pageName);
        return "main"; 
    }

    @PostMapping("/insertCabinet")
    public String insertCabinet(@RequestParam("title") String title, @RequestParam("description") String description) {
        CabinetVO cabinet = new CabinetVO();
        cabinet.setTitle(title);
        cabinet.setDescription(description);
        cabinetService.insertCabinet(cabinet);
        return "redirect:/";
    }
}
