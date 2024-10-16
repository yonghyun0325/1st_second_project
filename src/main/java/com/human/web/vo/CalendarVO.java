package com.human.web.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class CalendarVO {
    private int task_idx; // 할일 번호
    private int e_idx; // 사원 번호 (외래키)
    private String task_date; // 할일 날짜
    private String task_description; // 할일 내용
    private Timestamp created_at; // 생성일
}