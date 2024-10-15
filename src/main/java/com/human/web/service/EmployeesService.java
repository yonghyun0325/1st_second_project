package com.human.web.service;

import com.human.web.vo.EmployeesVO;

public interface EmployeesService {

	EmployeesVO login(int emp_idx, String emp_pw);

	EmployeesVO updateEmployees(EmployeesVO vo);

	int cancel(int emp_idx);

	String authEmail(String email);
}
