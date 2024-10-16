package com.human.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.web.service.CommunityService;
import com.human.web.vo.CommunityVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/community")
@AllArgsConstructor
public class CommunityController {
	
	//일반게시판 요청 처리를 위한 객체 정의(lombok에 의한 의존자동주입: 생성자 이용)
	private CommunityService communityService;
	
	//글등록 페이지 요청
	@GetMapping("/write.do")
	public String write() {
		return "community/write";
	}

    // 글 목록 요청
    @GetMapping("/getBoards")
    public String getBoards(Model model) {
        // 글 목록을 가져와서 모델에 추가
        List<CommunityVO> boardList = communityService.getBoardList();
        System.out.println("boardList 요청됨: " + boardList);
        model.addAttribute("boardList", boardList);
        // 글 목록을 출력할 뷰로 이동
        return "community/community";
    }

	//글등록 요청
	@PostMapping("/writeProcess.do")
	public String writeProcess(CommunityVO vo) {
		String viewName = "community/write";//글등록 실패시 뷰이름
		
		int result = communityService.insertBoard(vo);
		if(result ==1) {//글등록 성공
			viewName = "redirect:/index.do"; //메인 페이지 재요청
		}
		
		return viewName;
	}
	
	//상세보기 페이지 요청
	@GetMapping("/view.do")
	public String view(int b_idx, Model model) {
		//조회수 증가시키기
		communityService.updateReadCount(b_idx);
		//상세페이지 정보를 저장하고 있는 CommunityVO 객체 얻기
		CommunityVO vo =communityService.getBoard(b_idx);
		model.addAttribute("CommunityVO", vo);
		return "community/view";
	}
	
	//수정 페이지 요청
	@GetMapping("/update.do")
	public String update(int b_idx, Model model) {
		//상세페이지 정보를 저장하고 있는 CommunityVO 객체 얻기
		CommunityVO vo =communityService.getBoard(b_idx);
		model.addAttribute("CommunityVO", vo);
		return "community/update";
	}
	
	//글수정 요청
		@PostMapping("/updateProcess.do")
		public String updateBoard(CommunityVO vo, Model model) {
			String viewName = "community/update";//글수정 실패시 뷰이름
			
			int result = communityService.updateBoard(vo);
			if(result ==1) {//글등록 성공
				//viewName = "redirect:/index.do"; //메인 페이지 재요청
				
				//community/view 를 뷰이름으로 반환하는 경우
				//게시글에 대한 변경된 내용을 CommunityVO객체에 저장해서 Model객체에 추가함
				CommunityVO newVo = communityService.getBoard(vo.getB_idx());
				model.addAttribute("CommunityVO", newVo);
				viewName = "community/view";
				
			}
			
			return viewName;
		}
		
		//글삭제 요청
		@GetMapping("deleteProcess.do")
		public String deleteProcess(int b_idx) {
			String viewName = "community/view"; //글삭제 실패시 뷰이름
			int result = communityService.deleteBoard(b_idx);
			if(result == 1) {//글삭제 성공
				viewName = "redirect:/index.do";
				
			}
			return viewName;
		}

}
