package com.human.web.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HrVO {
    private int hrIdx;             // 인사 ID
    private int eIdx;              // 사원 ID
    private String name;           // 이름
    private Date birthday;         // 생년월일
    private String gender;         // 성별
    private String maritalStatus;  // 결혼여부
    private String jumin;          // 주민등록번호
    private int dIdx;              // 부서 ID
    private String position;       // 직위
    private String employeeType;   // 직원 유형
    private String tel;            // 전화번호
    private String mobile;         // 모바일
    private String email;          // 이메일
    private String address;        // 주소
    private String postalCode;     // 우편번호
    private String workplace;      // 근무지
    private String workplacePhone; // 근무지 전화번호
    private String education;      // 최종학력
    private Date entryDate;        // 입사일자
    private Date retirementDate;   // 퇴사일자
    private String careerType;     // 채용구분 (NEW, CAREER)
    private String disability;     // 장애 여부 (Y, N)
    private String salaryType;     // 급여 구분
    private String state;          // 상태
    private String photo;          // 사진 경로
    private String foreignName1;   // 외국어 이름 1
    private String foreignName2;   // 외국어 이름 2
    private String entryType;      // 입사 구분
}