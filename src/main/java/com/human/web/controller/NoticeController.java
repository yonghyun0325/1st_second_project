package com.human.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.web.service.NoticeService;
import com.human.web.vo.BoardVO;
import com.human.web.vo.EmployeesVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/notice")
@AllArgsConstructor
public class NoticeController {
	
	// 일반게시판 요청 처리를 위한 객체 정의(lombok에 의한 의존자동주입: 생성자 이용)
	private NoticeService noticeService;

    // 일반타입 게시글 요청
    @GetMapping("/notice")
    public String noticeList(
        @RequestParam(value = "searchField", required = false) String searchField,
        @RequestParam(value = "searchWord", required = false) String searchWord,
        @RequestParam(value = "startNum", defaultValue = "0") int startNum,
        Model model) {
        
        List<BoardVO> boardList = noticeService.getNoticeList(searchField, searchWord, startNum);
        model.addAttribute("boardList", boardList);
        return "notice/list";
    }

	//상세보기 페이지 요청
	@GetMapping("/view.do")
	public String view(@RequestParam("b_idx") int b_idx, Model model) {
		//조회수 증가시키기
		noticeService.updateReadCount(b_idx);

		//상세페이지 정보를 저장하고 있는 boardVO 객체 얻기
		BoardVO vo =noticeService.getNotice(b_idx);
		model.addAttribute("boardVO", vo);

		return "notice/view";
	}
	
	//다운로드 요청
	@GetMapping("/download.do")
	public void download(String origin_filename, String save_filename,
			HttpServletRequest request, HttpServletResponse response) {
		//request: 파일의 실제 경로를 알아내는데 사용됨
		//response: 파일을 출력하는데 사용됨
		
		noticeService.download(origin_filename, save_filename, request, response);
	}
	
	// 글 작성 페이지 요청
    @GetMapping("/write.do")
    public String write(@RequestParam("type") String type, Model model) {
        model.addAttribute("type", type);
        return "notice/write";
    }

	// 글 등록 요청
	@PostMapping("/writeProcess.do")
	@ResponseBody
    public ResponseEntity<Map<String, Object>> writeProcess(@ModelAttribute BoardVO vo, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            int result = noticeService.insertNotice(vo, request);
            if (result == 1) { // 글 등록 성공
                response.put("status", "success");
            } else {
                response.put("status", "fail");
                response.put("message", "글 등록에 실패했습니다.");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
        }
        
        return ResponseEntity.ok(response);
    }

	// 글 수정 페이지 요청
	@GetMapping("/update.do")
	public String update(int b_idx, Model model) {
		//상세페이지 정보를 저장하고 있는 boardVO 객체 얻기
		BoardVO vo =noticeService.getNotice(b_idx);
		model.addAttribute("boardVO", vo);
		return "notice/update";
	}
	
	// 글 수정 요청
	@PostMapping("/updateProcess.do")
	public String updateBoard(BoardVO vo, Model model) {
		String viewName = "notice/update";//글수정 실패시 뷰이름
		
		int result = noticeService.updateNotice(vo);
		if(result ==1) {//글등록 성공
			//viewName = "redirect:/index.do"; //메인 페이지 재요청
			
			//board/view 를 뷰이름으로 반환하는 경우
			//게시글에 대한 변경된 내용을 boardVO객체에 저장해서 Model객체에 추가함
			BoardVO newVo = noticeService.getNotice(vo.getB_idx());
			model.addAttribute("boardVO", newVo);
			viewName = "board/view";
		}
		return viewName;
	}
		
	//글삭제 요청
    @PostMapping("/deleteProcess.do")
    @ResponseBody
    public ResponseEntity<String> deleteProcess(int b_idx, HttpSession session) {
        EmployeesVO employees = (EmployeesVO) session.getAttribute("employees");

        int loggedInIdx = employees.getE_idx();
        boolean isAdmin = employees.getPermission() == 2;

        BoardVO board = noticeService.getNotice(b_idx);
        if (board == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("게시글을 찾을 수 없습니다.");
        }

        if (board.getE_idx() == loggedInIdx || isAdmin) {
            int result = noticeService.deleteNotice(b_idx);
            if (result == 1) {
                return ResponseEntity.ok("글이 성공적으로 삭제되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("글 삭제에 실패했습니다.");
            }
        } else {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("삭제 권한이 없습니다.");
        }
    }

}
