package com.human.web.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.human.web.repository.CustomersDAO;
import com.human.web.vo.CustomersVO;

import lombok.AllArgsConstructor;

@Service
@Transactional
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService {

    private final CustomersDAO customersDAO;

    @Override
    public int saveCustomer(CustomersVO customer) {
        return customersDAO.saveCustomer(customer);
    }

    @Override
    public CustomersVO getCustomerById(int c_idx) {
        return customersDAO.getCustomerById(c_idx);
    }

    @Override
    public List<CustomersVO> getAllCustomers() {
        return customersDAO.getAllCustomers();
    }

    @Override
    public int updateCustomer(CustomersVO vo) {
        return customersDAO.updateCustomer(vo);
    }

    @Override
    public int deleteCustomer(int c_idx) {
        return customersDAO.deleteCustomer(c_idx);
    }
    
    
}
