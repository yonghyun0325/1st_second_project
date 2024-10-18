package com.human.web.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardAttachedVO {
	private int b_idx; //공지사항 번호
	private int a_idx; //공지사항 첨부파일 번호
	private String origin_filename; //원본 파일명
	private String save_filename; //저장 파일명
	
}
