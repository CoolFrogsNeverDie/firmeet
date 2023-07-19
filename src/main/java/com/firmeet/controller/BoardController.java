package com.firmeet.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.BoardService;
import com.firmeet.vo.BoardVO;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value = "/member")
	public String PerBoard(@ModelAttribute BoardVO boardVO,
							Model model) {
		
		System.out.println("멤버 게시판" + boardVO);
		Map<String, Object> info = boardService.getPerBoardInfo(boardVO);
		//삭제 예정
		
		model.addAttribute("joinList",info.get("joinList"));
//		model.addAttribute("boardList",info.get("boardList"));
		model.addAttribute("category",info.get("category"));
		model.addAttribute("memberId", boardVO.getMemberId());
		model.addAttribute("clubId", boardVO.getClubId());
		
		
		
		return "member_diary/member_board";
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/getboard")
	public JsonResult PerBoard(@ModelAttribute BoardVO boardVO) {
		JsonResult json = new JsonResult();
		
		System.out.println("넘어오는 값 확인" + boardVO);
		List<BoardVO> list = boardService.getPerBoard(boardVO);
		
		json.success(list);
		
		return json;
	}
	
	
	
}
