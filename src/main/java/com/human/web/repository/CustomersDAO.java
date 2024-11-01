package com.human.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.web.vo.CustomersVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class CustomersDAO {
	
	private static final String MAPPER = "com.human.web.mapper.CustomersMapper";
	
	private SqlSession sqlSession;//MyBatis에서 DB와 연결작업을 하는 핵심 객체

	public int saveCustomer(CustomersVO customer) {
		return sqlSession.insert(MAPPER+".addCustomer", customer);
	}
	
	// ID로 고객 정보 조회
    public CustomersVO getCustomerById(int c_idx) {
        return sqlSession.selectOne(MAPPER + ".getCustomerById", c_idx);
    }

    // 모든 고객 조회
    public List<CustomersVO> getAllCustomers() {
        return sqlSession.selectList(MAPPER + ".getAllCustomers");
    }

    // 고객 정보 수정
    public int updateCustomer(CustomersVO vo) {
        return sqlSession.update(MAPPER + ".updateCustomer", vo);
    }

    // 고객 정보 삭제
    public int deleteCustomer(int c_idx) {
        return sqlSession.delete(MAPPER + ".deleteCustomer", c_idx);
    }
    
    
}