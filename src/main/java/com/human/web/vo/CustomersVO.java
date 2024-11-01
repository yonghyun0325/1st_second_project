package com.human.web.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CustomersVO {
    private int cIdx;
    private int cJuminNum;
    private int cBuisnessId;
    private String c_name;
    private int phone_num;
    private int i_num;
    private String trans_type;
    private String company_name;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate usetime;

    private String product_name;
    private String req_content;
}