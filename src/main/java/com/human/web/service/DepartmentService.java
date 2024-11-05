package com.human.web.service;

import java.util.List;

import com.human.web.vo.DepartmentVO;

public interface DepartmentService {

    List<DepartmentVO> getAllDepartments();

    void insertDepartment(DepartmentVO department);

    DepartmentVO getDepartmentById(int d_idx);

    void updateDepartment(DepartmentVO department);

    void deleteDepartment(int d_idx);
    
}
