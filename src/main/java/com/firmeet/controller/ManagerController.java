package com.firmeet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.ClubService;
import com.firmeet.service.ManagerService;
import com.firmeet.service.MemberService;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.QnaVO;
import com.firmeet.vo.TagVo;

@RequestMapping("/management")
@Controller
public class ManagerController {
	
	@Autowired
	ClubService clubService;
	@Autowired
	MemberService memberService;
	@Autowired
	ManagerService managerService;
	
	@RequestMapping("/club/{clubId}")
	public String memberManagement(@PathVariable("clubId") int clubId
								   ,HttpSession session
								   ,Model model) {
		
		System.out.println("넘어오는 정보값 확인" + clubId);
		MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;
        
        if (member != null) {
            memberId = member.getMemberId();
            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            model.addAttribute("club", club);
            
            //회장일 시 해당 페이지 접근함
            if(club.getMemlevel() == 0) {
            	return "club_management/join_request";
            }
            //호스트가 아닐 시 동호회 메인 페이지로 이동
            return "redirect:/club/main/"+club.getClubId();
            
        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
	}
	
	
	@RequestMapping("/club/editgrade/{clubId}")
	public String editClubmember(@PathVariable("clubId") int clubId
								   ,HttpSession session
								   ,Model model) {
		
		System.out.println("넘어오는 정보값 확인" + clubId);
		MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;
        
        if (member != null) {
            memberId = member.getMemberId();
            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            model.addAttribute("club", club);
            
            //회장일 시 해당 페이지 접근함
            if(club.getMemlevel() == 0) {
            	return "club_management/edit_club_member";
            }
            //호스트가 아닐 시 동호회 메인 페이지로 이동
            return "redirect:/club/main/"+club.getClubId();
            
        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
	}
	
	@RequestMapping("/club/qna/{clubId}")
	public String qnaPage(@PathVariable("clubId") int clubId
			   			  ,HttpSession session
			   			  ,Model model) {
		System.out.println("넘어오는 정보값 확인" + clubId);
		MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;
        
        if (member != null) {
            memberId = member.getMemberId();
            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            model.addAttribute("club", club);
            
            //회장일 시 해당 페이지 접근함
            if(club.getMemlevel() == 0) {
            	return "club_management/qna_answer";
            }
            //호스트가 아닐 시 동호회 메인 페이지로 이동
            return "redirect:/club/main/"+club.getClubId();
            
        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
	}
	
	
	@RequestMapping("/club/edit/{clubId}")
	public String editClub(@PathVariable("clubId") int clubId
 			  ,HttpSession session
 			  ,Model model) {
		MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;
        
        if (member != null) {
            memberId = member.getMemberId();
            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            model.addAttribute("club", club);
            
            //회장일 시 해당 페이지 접근함
            if(club.getMemlevel() == 0) {
            	
            	//필요한 태그 리스트 가져옴
        		List<TagVo> tagList = memberService.tagList();
        		List<CategoryVo> cateList = memberService.cateList();
        		model.addAttribute("tagList", tagList);
        		model.addAttribute("cateList", cateList);
        		//나머지 club의 detail한 정보 가져옴
        		ClubVo clubVO = managerService.clubDeInfo(club); 
        		model.addAttribute("deInfo", clubVO);
        		
            	return "club_management/edit_club";
            }
            //호스트가 아닐 시 동호회 메인 페이지로 이동
            return "redirect:/club/main/"+club.getClubId();
            
        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
		
		
		
		
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/club/requestlist", method = RequestMethod.POST)
	public JsonResult getMemList(@ModelAttribute MemberVo memberVO) {
		JsonResult jsonResult = new JsonResult();
		
		System.out.println("에이잭스로 넘어오는 값 확인 : " + memberVO);
		
		List<MemberVo> memberList = memberService.requestMemList(memberVO);
		jsonResult.success(memberList);
		
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/club/joinrequest", method= RequestMethod.POST)
	public JsonResult joinRequest(@ModelAttribute ClubVo vo) {
		JsonResult jsonResult = new JsonResult();
		System.out.println("회원 관리를 위해 AJAX로 넘어온 정보" + vo);
		
		int result = managerService.joinRequest(vo);
		
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value ="/club/memberlist", method = RequestMethod.POST)
	public JsonResult clubMemList(@ModelAttribute MemberVo memberVO) {
	
		JsonResult jsonResult = new JsonResult();
		System.out.println("넘어온 값 체크" + memberVO);
		List<MemberVo> memberList = managerService.getMemList(memberVO);
		jsonResult.success(memberList);
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/club/changegrade", method = RequestMethod.POST)
	public JsonResult changeGrade(@ModelAttribute MemberVo memberVO) {
		JsonResult jsonResult = new JsonResult();
		System.out.println("등급변경 위해서 넘어오는 정보 확인" + memberVO);
		boolean result = managerService.changeGrade(memberVO);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/club/kickout" , method = RequestMethod.POST)
	public JsonResult kickoutMem(@ModelAttribute ClubVo clubVO) {
		JsonResult jsonResult = new JsonResult();
		System.out.println("ㄷㄷㄷㄷ 삭제 위해 넘어오는 정보 확인 " + clubVO);
		boolean result = managerService.kickoutMem(clubVO);
		jsonResult.success(result);
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value ="/club/qnalist", method=RequestMethod.POST)
	public JsonResult getQnaList(@ModelAttribute MemberVo memberVO) {
		JsonResult jsonResult = new JsonResult();
		System.out.println("QNA 등록을 위해 넘어온 정보들" + memberVO);
		List<QnaVO> qnaList = managerService.getClubQna(memberVO);
		jsonResult.success(qnaList);
		System.out.println("QNA등록 위해 넘어온 정보들 " + qnaList);
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/club/qnaanswer", method = RequestMethod.POST)
	public JsonResult addQnaAnswer(@ModelAttribute QnaVO qnaVO) {
		
		JsonResult jsonResult = new JsonResult();
		System.out.println("넘어오는 값 확인" + qnaVO);
		boolean result = managerService.addQnaAnswer(qnaVO);
		
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	
	
	
}
