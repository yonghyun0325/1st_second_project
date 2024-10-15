package com.human.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.human.web.repository.NoticeDAO;
import com.human.web.util.FileManager;
import com.human.web.vo.NoticeVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	//공지사항 관련 DB와 작업할 수 있는 DAO객체 정의(lombok에 의한 의존자동주입: 생성자 이용)
	private NoticeDAO dao;
	private FileManager fileManager;
	

	@Override
	public List<NoticeVO> getNoticeList() {
		return dao.getNoticeList();
	}


	//공지사항 등록
	@Override
	public int insertNotice(NoticeVO vo, HttpServletRequest request) {
		int result = 0; //공지사항 등록 실패시 결과값
		
		//첨부파일이 있는 경우 FileManager 클래스를 이용해서 첨부파일을 처리함
		if(vo.getUploadFiles().length != 0) {
			NoticeVO modifiedVo = fileManager.handleFile(vo, request);
			result = dao.insertNotice(modifiedVo);
			
		}else {//첨부파일이 없는 경우
			result = dao.insertNotice(vo); 
		}
		
		return result;
	}


	@Override
	public void updateReadCount(int nb_idx) {
		dao.updateReadCount(nb_idx);
	}


	@Override
	public NoticeVO getNotice(int nb_idx) {
		return dao.getNotice(nb_idx);
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
