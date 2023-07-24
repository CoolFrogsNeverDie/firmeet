package com.firmeet.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.BoardService;
import com.firmeet.vo.BoardVO;
import com.firmeet.vo.ReplyVO;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value = "/member/{memberId}/{clubId}")
	public String PerBoard(@PathVariable("memberId") String memberId
							,@PathVariable("clubId") int clubId
							,Model model) {
		BoardVO boardVO = new BoardVO();
		boardVO.setClubId(clubId);
		boardVO.setMemberId(memberId);
		
		System.out.println("멤버 게시판" + boardVO);
		Map<String, Object> info = boardService.getPerBoardInfo(boardVO);
		//삭제 예정
		
		model.addAttribute("joinList",info.get("joinList"));
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
		if(list != null) {
			json.success(list);
		}
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/addComment", method = RequestMethod.POST)
	public JsonResult addReply(@ModelAttribute ReplyVO replyVO) {
		
		
		System.out.println("AJAX로 넘어오는 정보" + replyVO);
		boardService.addReply(replyVO);
		
		
		
		return null;
	}
	
}
