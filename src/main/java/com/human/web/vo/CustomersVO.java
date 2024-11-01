package com.human.web.vo;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class CustomersVO {
    private int cIdx;
    private int cJuminNum;
    private int cBuisnessId;
    private String cName;
    private int phoneNum;
    private int iNum;
    private String transType;
    private String companyName;
    private LocalDateTime usetime; 
    private String productName;
    private String reqContent;
}