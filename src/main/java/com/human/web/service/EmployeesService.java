package com.human.web.service;

import java.util.List;

import com.human.web.vo.EmployeesVO;

public interface EmployeesService {

	EmployeesVO login(int e_idx, String e_pw);

	EmployeesVO updateEmployees(EmployeesVO vo);
    
    List<EmployeesVO> getEmployeesList();

	int cancel(int e_idx);

	String authEmail(String email);
}
