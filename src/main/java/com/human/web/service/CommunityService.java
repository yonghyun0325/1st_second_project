package com.human.web.service;

import java.util.List;

import com.human.web.vo.CommunityVO;

public interface CommunityService {

	int insertBoard(CommunityVO vo);

	List<CommunityVO> getBoardList();

	CommunityVO getBoard(int b_idx);

	void updateReadCount(int b_idx);

	int updateBoard(CommunityVO vo);

	int deleteBoard(int b_idx);

}
