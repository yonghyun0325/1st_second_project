package com.human.web.service;

import java.util.List;

import com.human.web.vo.CustomersVO;

public interface CustomerService {
    CustomersVO getCustomerById(int c_idx);
    List<CustomersVO> getAllCustomers();
    int updateCustomer(CustomersVO vo);
    int deleteCustomer(int c_idx);
	int saveCustomer(CustomersVO customer);
}