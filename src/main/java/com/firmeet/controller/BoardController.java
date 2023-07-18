package com.firmeet.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		
		model.addAttribute("joinList",info.get("joinList"));
		model.addAttribute("boardList",info.get("boardList"));
		model.addAttribute("category",info.get("category"));

		
		
		return "member_diary/member_board";
	}
	
	
	
}
