package com.human.web.vo;

import java.util.Date;

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
}
