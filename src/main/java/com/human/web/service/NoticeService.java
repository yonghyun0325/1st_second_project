package com.human.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.web.vo.BoardVO;

public interface NoticeService {

    // 글 목록 조회 인터페이스
	List<BoardVO> getNoticeList(String searchField, String searchWord, int startNum);
    
    // 글 세부 조회 인터페이스
	BoardVO getNotice(int b_idx);

    // 글 작성 인터페이스
	int insertNotice(BoardVO vo, HttpServletRequest request);

    // 조회수 업데이트 인터페이스
	void updateReadCount(int b_idx);

    // 글 수정 인터페이스
	int updateNotice(BoardVO vo);

    // 글 삭제 인터페이스
	int deleteNotice(int b_idx);

    // 첨부파일 다운로드 인터페이스
	void download(String origin_filename, String save_filename, HttpServletRequest request,
			HttpServletResponse response);

    // 첨부파일 삭제 인터페이스
	int deleteAttached(int na_idx);

}
