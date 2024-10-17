package com.human.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.human.web.repository.BoardDAO;
import com.human.web.util.FileManager;
import com.human.web.vo.BoardVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	//게시판 관련 DB와 작업할 수 있는 DAO객체 정의(lombok에 의한 의존자동주입: 생성자 이용)
	private BoardDAO dao;
    private FileManager fileManager;
	
	@Override
	public int insertBoard(BoardVO vo) {
		return dao.insertBoard(vo);
	}
	
	@Override
	public List<BoardVO> getBoardList() {
		return dao.getBoardList();
	}

	@Override
	public List<BoardVO> getNoticeList() {
		return dao.getNoticeList();
	}

	@Override
	public List<BoardVO> getLostList() {
		return dao.getLostList();
	}

	@Override
	public BoardVO getBoard(int b_idx) {
		return dao.getBoard(b_idx);
}

	@Override
	public void updateReadCount(int b_idx) {
		dao.updateReadCount(b_idx);		
	}
	

	@Override
	public int updateBoard(BoardVO vo) {
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int b_idx) {
		return dao.deleteBoard(b_idx);
	}

	@Override
	public void download(String origin_filename, String save_filename, HttpServletRequest request,
			HttpServletResponse response) {
		fileManager.download(origin_filename, save_filename, request, response);	
	}

	@Override
	public int deleteAttached(int na_idx) {
		return dao.deleteAttached(na_idx);
	}

}