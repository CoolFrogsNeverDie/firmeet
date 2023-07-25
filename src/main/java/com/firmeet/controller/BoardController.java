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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.BoardService;
import com.firmeet.service.ClubService;
import com.firmeet.service.MemberService;
import com.firmeet.vo.BoardVO;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.ReplyVO;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;
	@Autowired
	ClubService clubService;
	
	
	@RequestMapping(value ="/club/{clubId}")
	public String clubBoard(@PathVariable ("clubId") int clubId
							,@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							,Model model) {
		
	      ClubVo clubVo = clubService.getClubVo(clubId);
	      model.addAttribute("club", clubVo);
	      model.addAttribute("keyword", keyword);
		
		return "club_diary/club_board";
	}
	
	@ResponseBody
	@RequestMapping(value = "/club/getboard")
	public JsonResult clubBoard(@ModelAttribute BoardVO boardVO) {
		JsonResult json = new JsonResult();
		
		System.out.println("넘어오는 값 확인" + boardVO);
		List<BoardVO> list = boardService.getClubBoard(boardVO);
		if(list != null) {
			json.success(list);
		}
		
		return json;
	}
	
	
	
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
		model.addAttribute("clubId",clubId);
		
		
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
	@RequestMapping(value = "/member/addReply", method = RequestMethod.POST)
	public JsonResult addReply(@ModelAttribute ReplyVO replyVO) {
		JsonResult jsonResult = new JsonResult();
		
		System.out.println("AJAX로 넘어오는 정보" + replyVO);
		jsonResult.success(boardService.addReply(replyVO));
		
		
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/member/addReply_2", method = RequestMethod.POST)
	public JsonResult addRreply(@ModelAttribute ReplyVO replyVO) {
		JsonResult jsonResult = new JsonResult();
		
		System.out.println("AJAX로 넘어오는 정보" + replyVO);
		jsonResult.success(boardService.addReply2(replyVO));
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/deleteReply", method = RequestMethod.POST)
	public JsonResult deleteReply(@ModelAttribute ReplyVO replyVO) {
		
		JsonResult jsonResult = new JsonResult();
		System.out.println("AJAX로 넘어온 삭제할 코멘트 정보 " +replyVO);
		boolean result = boardService.deleteReply(replyVO);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	
	
	
}
