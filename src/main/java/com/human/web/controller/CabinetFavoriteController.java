package com.human.web.controller;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.CabinetFavoriteService;
import com.human.web.vo.CabinetFavoriteVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/cabinet")
@AllArgsConstructor
public class CabinetFavoriteController {

    private CabinetFavoriteService cabinetFavoriteService;

    @PostMapping("/addFavorite")
    @ResponseBody
    public String addFavorite(@RequestParam("e_idx") int e_idx, @RequestParam("c_id") int c_id) {
        try {
            cabinetFavoriteService.addFavorite(e_idx, c_id);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

    @PostMapping("/removeFavorite")
    @ResponseBody
    public String removeFavorite(@RequestParam("e_idx") int e_idx, @RequestParam("c_id") int c_id) {
        try {
            cabinetFavoriteService.removeFavorite(e_idx, c_id);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

    @GetMapping("/getFavoriteList")
    @ResponseBody
    public List<CabinetFavoriteVO> getFavorites(@RequestParam("e_idx") int e_idx) {
        return cabinetFavoriteService.getFavoritesByEmployee(e_idx);
    }

}
