package com.human.web.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.human.web.repository.DepartmentDAO;
import com.human.web.vo.DepartmentVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
	
	
    private final DepartmentDAO departmentDAO;

    @Override
    public List<DepartmentVO> getAllDepartments() {
        return departmentDAO.getAllDepartments();
    }

    @Override
    @Transactional
    public void insertDepartment(DepartmentVO department) {
        departmentDAO.insertDepartment(department);
    }

    @Override
    public DepartmentVO getDepartmentById(int d_idx) {
        return departmentDAO.getDepartmentById(d_idx);
    }

    @Override
    @Transactional
    public void updateDepartment(DepartmentVO department) {
        departmentDAO.updateDepartment(department);
    }

    @Override
    @Transactional
    public void deleteDepartment(int d_idx) {
        departmentDAO.deleteDepartment(d_idx);
    }
}
