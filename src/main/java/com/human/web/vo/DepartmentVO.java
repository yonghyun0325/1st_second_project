package com.human.web.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DepartmentVO {
    private int d_idx;       // 부서 코드
    private String name;    // 부서명
}
