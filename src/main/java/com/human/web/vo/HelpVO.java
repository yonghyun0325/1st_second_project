package com.human.web.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HelpVO {
    private int e_idx; 
    private String name;
    private String product;
    private String service;
    private String help_detail;

}
