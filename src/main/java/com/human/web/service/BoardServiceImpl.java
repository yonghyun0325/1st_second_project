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
    
	// 글 목록 불러오기
	@Override
	public List<BoardVO> getBoardList(String type, String searchField, String searchWord, int startNum) {
        System.out.println("(BoardServiceImpl.java) 서비스에서 전달받은 파라미터 - type: " + type + ", searchField: " + searchField + ", searchWord: " + searchWord + ", startNum: " + startNum);
		return dao.getBoardList(type, searchField, searchWord, startNum);
	}

	// 글 세부 조회
	@Override
	public BoardVO getBoard(int b_idx) {
		return dao.getBoard(b_idx);
    }

	// 글 작성
	@Override
	public int insertBoard(BoardVO vo, HttpServletRequest request) {
		int result = 0; //공지사항 등록 실패시 결과값
		
		//첨부파일이 있는 경우 FileManager 클래스를 이용해서 첨부파일을 처리함
		if(vo.getUploadFiles() != null) {
			BoardVO modifiedVo = fileManager.handleFile(vo, request);
			result = dao.insertBoard(modifiedVo);
		} else {//첨부파일이 없는 경우
			result = dao.insertBoard(vo);
		}
		return result;
	}

    // 글 조회수 증가
	@Override
	public void updateReadCount(int b_idx) {
		dao.updateReadCount(b_idx);		
	}
	
    // 글 수정
	@Override
	public int updateBoard(BoardVO vo) {
		return dao.updateBoard(vo);
	}

    // 글 삭제
	@Override
	public int deleteBoard(int b_idx) {
		return dao.deleteBoard(b_idx);
	}

    // 첨부파일 다운로드
	@Override
	public void download(String origin_filename, String save_filename, HttpServletRequest request,
			HttpServletResponse response) {
		fileManager.download(origin_filename, save_filename, request, response);	
	}

    // 첨부파일 삭제
	@Override
	public int deleteAttached(int na_idx) {
		return dao.deleteAttached(na_idx);
	}

}