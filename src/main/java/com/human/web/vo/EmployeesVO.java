package com.human.web.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeesVO {

    private int emp_idx;          // 사원 번호
    private String emp_name;      // 사원 이름
    private String emp_pw;        // 비밀번호
    private String emp_depa;      // 부서
    private String emp_position;  // 직위
    private String jumin;         // 주민번호
    private String address;       // 주소
    private String email;         // 이메일
    private String tel;           // 전화번호
    private Date joined;          // 입사일
    private String state;         // 상태
}