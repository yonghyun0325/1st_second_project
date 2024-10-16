package com.human.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.human.web.repository.CommunityDAO;
import com.human.web.vo.CommunityVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	//게시판 관련 DB와 작업할 수 있는 DAO객체 정의(lombok에 의한 의존자동주입: 생성자 이용)
	private CommunityDAO dao;
	
	@Override
	public int insertBoard(CommunityVO vo) {
		return dao.insertBoard(vo);
	}
	
	@Override
	public List<CommunityVO> getBoardList() {
		return dao.getBoardList();
	}

	@Override
	public CommunityVO getBoard(int b_idx) {
		return dao.getBoard(b_idx);
}

	@Override
	public void updateReadCount(int b_idx) {
		dao.updateReadCount(b_idx);		
	}
	

	@Override
	public int updateBoard(CommunityVO vo) {
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int b_idx) {
		return dao.deleteBoard(b_idx);
	}
}