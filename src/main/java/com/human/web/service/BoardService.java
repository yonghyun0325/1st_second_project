package com.human.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.web.vo.BoardVO;

public interface BoardService {

	int insertBoard(BoardVO vo);

	List<BoardVO> getBoardList();
    
	List<BoardVO> getNoticeList();

	List<BoardVO> getLostList();

	BoardVO getBoard(int b_idx);

	void updateReadCount(int b_idx);

	int updateBoard(BoardVO vo);

	int deleteBoard(int b_idx);

	void download(String origin_filename, String save_filename, HttpServletRequest request,
			HttpServletResponse response);

	int deleteAttached(int na_idx);

}
