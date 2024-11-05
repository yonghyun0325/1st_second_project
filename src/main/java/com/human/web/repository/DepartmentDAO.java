package com.human.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.web.vo.DepartmentVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class DepartmentDAO {
    private SqlSession sqlSession;

    public static final String MAPPER = "com.human.web.mapper.DepartmentMapper";

    // 부서 목록 조회
    public List<DepartmentVO> getAllDepartments() {
        return sqlSession.selectList(MAPPER + ".getAllDepartments");
    }

    // 부서 등록
    public int insertDepartment(DepartmentVO department) {
        return sqlSession.insert(MAPPER + ".insertDepartment", department);
    }
    
    // 부서 조회 (ID로 조회)
    public DepartmentVO getDepartmentById(int d_idx) {
        return sqlSession.selectOne(MAPPER + ".getDepartmentById", d_idx);
    }

    // 부서 수정
    public int updateDepartment(DepartmentVO department) {
        return sqlSession.update(MAPPER + ".updateDepartment", department);
    }

    // 부서 삭제
    public int deleteDepartment(int d_idx) {
        return sqlSession.delete(MAPPER + ".deleteDepartment", d_idx);
    }
    
}
