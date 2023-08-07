package com.firmeet.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.firmeet.vo.MemberVo;
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
	
	
	/*자유게시판*/
	@RequestMapping(value ="/club/{clubId}")
	public String clubBoard(@PathVariable ("clubId") int clubId
							,@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							,Model model
							,HttpSession session) {
		System.out.println("clubBoard()");
		
		
        MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;
        
        if (member != null) {
            memberId = member.getMemberId();

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            model.addAttribute("club", club);
		    model.addAttribute("keyword", keyword);

	        return "club_diary/club_board";

        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
		
	}
	
	/*동호회 자유게시판 게시물 인덱스에 맞춰 불러오는 메서드*/
	@ResponseBody
	@RequestMapping(value = "/club/getboard")
	public JsonResult clubBoard(@ModelAttribute BoardVO boardVO) {
		JsonResult json = new JsonResult();
		System.out.println("getBoard()");
		
		
		List<BoardVO> list = boardService.getClubBoard(boardVO);
		if(list != null) {
			json.success(list);
		}
		
		return json;
	}
	
	/*로그인 페이지*/
	@RequestMapping(value = "/club/editpage/{clubId}")
	public String editPage(@PathVariable ("clubId") int clubId
							,Model model
							,HttpSession session) {
		System.out.println("Board EditForm()");
        MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;

        if (member != null) {
            memberId = member.getMemberId();

            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            model.addAttribute("club", club);

		    return "club_diary/board_write";

        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
	    
	}
	
	
	/*게시물 업로드*/
	@RequestMapping(value = "/club/upload" , method =RequestMethod.POST)
	public String editPage(@ModelAttribute BoardVO boardVO) {
		System.out.println("Board upload()");
		boardService.boardwrite(boardVO);

		return "redirect:/board/club/" + boardVO.getClubId();
	}
	
	
	/*마이페이지 자유 게시판*/
	@RequestMapping(value = "/member/{memberId}/{clubId}")
	public String PerBoard(@PathVariable("memberId") String memberId
							,@PathVariable("clubId") int clubId
							,Model model) {
		System.out.println("My diary Board()");
		BoardVO boardVO = new BoardVO();
		boardVO.setClubId(clubId);
		boardVO.setMemberId(memberId);
		
		Map<String, Object> info = boardService.getPerBoardInfo(boardVO);
		
		model.addAttribute("joinList",info.get("joinList"));
		model.addAttribute("category",info.get("category"));
		model.addAttribute("clubId",clubId);
		
		
		return "member_diary/member_board";
	}
	
	/*내가 쓴 게시글 받아오기*/
	@ResponseBody
	@RequestMapping(value = "/member/getboard")
	public JsonResult PerBoard(@ModelAttribute BoardVO boardVO) {
		System.out.println("My diary Board()");
		JsonResult json = new JsonResult();
		
		System.out.println("넘어오는 값 확인" + boardVO);
		List<BoardVO> list = boardService.getPerBoard(boardVO);
		if(list != null) {
			json.success(list);
		}
		
		return json;
	}
	
	/*내가 쓴 게시글 받아오기*/
	@ResponseBody
	@RequestMapping(value = "/member/addReply", method = RequestMethod.POST)
	public JsonResult addReply(@ModelAttribute ReplyVO replyVO) {
		JsonResult jsonResult = new JsonResult();
		System.out.println("add Reply()");
		
		jsonResult.success(boardService.addReply(replyVO));
		
		return jsonResult;
	}

	/*리댓글 달기*/
	@ResponseBody
	@RequestMapping(value = "/member/addReply_2", method = RequestMethod.POST)
	public JsonResult addRreply(@ModelAttribute ReplyVO replyVO) {
		System.out.println("add Rereply()");

		JsonResult jsonResult = new JsonResult();
		jsonResult.success(boardService.addReply2(replyVO));
		
		return jsonResult;
	}
	
	/*댓글 삭제*/
	@ResponseBody
	@RequestMapping(value = "/member/deleteReply", method = RequestMethod.POST)
	public JsonResult deleteReply(@ModelAttribute ReplyVO replyVO) {
		System.out.println("delete Reply()");
		
		JsonResult jsonResult = new JsonResult();
		boolean result = boardService.deleteReply(replyVO);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	/*게시글 수정페이지*/
	@RequestMapping(value = "/club/editform")
	public String editForm(@ModelAttribute BoardVO boardVO
						   ,HttpSession session
						   ,Model model) {
        System.out.println("club editForm()");
		MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;
        
        if (member != null) {
            memberId = member.getMemberId();
            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, boardVO.getClubId());
            model.addAttribute("club", club);
            BoardVO vo = boardService.getBoard(boardVO);
			model.addAttribute("board" , vo);
			return "club_diary/board_edit";

        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
	}
	
	/*클럽 게시물 수정*/
	@RequestMapping(value = "/club/edit" , method = RequestMethod.POST) 
	public String editBoard(@ModelAttribute BoardVO boardVO) {
		System.out.println("edit club()");
		boardService.editBoard(boardVO);
		
		return "redirect:/board/club/" + boardVO.getClubId();
	}
	

	/*클럽 게시물 삭제*/
	@RequestMapping(value = "/club/delete")
	public String deleteBoard(@ModelAttribute BoardVO boardVO) {
		System.out.println("delete Board()");

		boardService.deleteBoard(boardVO);
		
		return "redirect:/board/club/" + boardVO.getClubId();
	}
	
	/*게시물 좋아요*/
	@ResponseBody
	@RequestMapping(value = "/likeCnt", method = RequestMethod.POST)
	public JsonResult likeCnt(@ModelAttribute BoardVO boardVO) {
		System.out.println("likeCnt()");
		
		JsonResult jsonResult = new JsonResult();
		BoardVO result = boardService.likeCnt(boardVO);
		System.out.println(result);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
}
