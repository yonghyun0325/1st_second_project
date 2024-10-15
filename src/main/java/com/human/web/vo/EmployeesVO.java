package com.human.web.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeesVO {

    private int e_idx;           // 사원 번호
    private String e_pw;         // 비밀번호
    private String name;         // 사원 이름
    private String depa;         // 부서
    private String position;     // 직위
    private String jumin;        // 주민번호
    private String address;      // 주소
    private String email;        // 이메일
    private String tel;          // 전화번호
    private Date joined;         // 입사일
    private String state;        // 상태
    private int permission;      // 권한
}