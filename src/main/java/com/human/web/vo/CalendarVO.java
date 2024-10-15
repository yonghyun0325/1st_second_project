package com.human.web.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CalendarVO {
    private int empIdx;
    private String taskDate;
    private String taskDescription;
}
