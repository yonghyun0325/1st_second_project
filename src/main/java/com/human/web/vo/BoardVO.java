package com.human.web.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int e_idx; // 사원번호
	private String name; // 사원 이름 < 사원번호
	private int b_idx; // 게시글 번호
	private String type; // 게시글 타입 (커뮤니티, 공지, 분실물)
	private String category; // 카테고리
	private String title; // 제목
	private String content; // 내용
	private int read_cnt; // 조회수
	private Date post_date; // 등록일
	private Date update_date; // 수정일
	private String status; // 게시글 상태

	//게시글 등록 폼에서 입력된 값을 커맨드 객체로 받기 위해서 첨부파일을
	//MultipartFile 타입의 필드로 정의해야 함
	private MultipartFile[] uploadFiles; //첨부 파일(최대 4개, 1개 최대 5MB, 1회 최대 20MB)
	
	private List<BoardAttachedVO> attachedList;//첨부파일 리스트
}
