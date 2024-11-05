package com.human.web.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeesVO {

    private int e_idx;               // 사원 번호
    private int d_idx;               // 부서 ID
    private int hr_idx;             // 인사 ID
    private String e_pw;             // 비밀번호
    private String name;             // 사원 이름
    private String depa;             // 부서
    private String position;         // 직위
    private String jumin;            // 주민등록번호
    private String address;          // 주소
    private String email;            // 이메일
    private String tel;              // 전화번호
    private Date joined;             // 입사일
    private String state;            // 상태
    private int permission;          // 권한
    private Date birthday;           // 생년월일
    private String mobile;           // 모바일 번호
    private String entry_type;       // 입사 구분
    private Date entry_date;         // 입사일자
    private Date retirement_date;    // 퇴사일자
    private String foreign_name1;    // 외국어 성명1
    private String foreign_name2;    // 외국어 성명2
    private String bank_name;        // 은행
    private String account_number;   // 계좌번호
    private String account_holder;   // 예금주
    private String maritalStatus;    // 결혼 여부
    private String gender;           // 성별
    private String disability;       // 장애 여부
    private String workplace;        // 근무지
    private String workplace_phone;   // 근무지 전화번호
    private String education;        // 최종 학력
    private String salary_type;       // 급여 구분
    private String postal_code;       // 우편번호
    private String marital_status;
}