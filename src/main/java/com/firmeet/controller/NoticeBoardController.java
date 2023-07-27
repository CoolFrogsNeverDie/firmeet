package com.firmeet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.firmeet.ajax.JsonResult;
import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.NoticeBoardVO;

@Controller
@RequestMapping("/{clubId}/notice")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("/noticelist")
	public String noticelist(@PathVariable("clubId") int clubId, Model model, HttpSession session) {
		System.out.println("noticelist 확인");
		
		session.setAttribute("clubId", clubId);
		
		model.addAttribute("nlist",noticeBoardService.noticeList());
		
		return "notice/noticeList";
	}
	
	//에디터 일반 페이지
	@RequestMapping("/noticeEditGeneral")
	public String noticeEditGeneral(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		
		System.out.println("noticeEditGeneral확인");
		
		int clubId = (int) session.getAttribute("clubId");
		
		System.out.println("controller clubId"+clubId);
		System.out.println(vo);
		
		model.addAttribute("clubId", clubId);
		
		return "notice/noticeEditGeneral";
	}
	
	//에디터 결제 페이지
	@RequestMapping("/noticeEditGroup")
	public String noticeEditGroup(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		
		System.out.println("noticeEditGroup확인");
		
		int clubId = (int) session.getAttribute("clubId");
		
		System.out.println("controller clubId"+clubId);
		
		model.addAttribute("clubId", clubId);
		
		return "notice/noticeEditGroup";
	}
	
	//에디터 일반페이지 등록 후 나오는 페이지
	@RequestMapping("/editwrite")
	public String editwrite(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		System.out.println("notice editwrite 확인 ");
		System.out.println("controller vo"+vo);
		session.getAttribute("aboardNo");
		noticeBoardService.editwrite(vo);
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("getAboardNo"+vo.getAboardNo());
		
		return "redirect:/"+vo.getClubId()+"/notice/editlist";
	}
	
	//에디터 일반페이지 등록 후 리스트
	@RequestMapping("/editlist")
	public String editlist(ClubVo clubvo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice editlist 확인");
		System.out.println("controller aboardNo 확인"+vo.getAboardNo());
		
		model.addAttribute("clubId", clubvo.getClubId());
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("aboardNo"+ vo.getAboardNo());
		model.addAttribute("voteNo", vo.getVoteNo());
		System.out.println("controller voteNo 확인"+ vo.getVoteNo());
		
		model.addAttribute("vo", noticeBoardService.editlist(vo.getAboardNo()));
		
		return "notice/noticeGroupView";
	}
	
	@RequestMapping("/vote")
	public String vote(@ModelAttribute NoticeBoardVO vo, Model model, HttpSession session) {
		session.getAttribute("voteNo");
		session.getAttribute("aboradNo");
		System.out.println("controller vo"+vo);
		model.addAttribute("voteNo", vo.getVoteNo());
		model.addAttribute("aboradNo", vo.getAboardNo());
		System.out.println("voteNo"+ vo.getVoteNo());
		System.out.println("getAboardNo"+ vo.getAboardNo());
		
		noticeBoardService.voteinsert(vo);
		
		return "redirect:/"+vo.getClubId()+"/notice/voteResult/"+vo.getAboardNo();
	}
	
	
	//에디터 일반페이지 등록 후 리스트
	@RequestMapping("/voteResult/{aboardNo}")
	public String voteResult(@PathVariable("aboardNo") int aboardNo, ClubVo clubvo, @ModelAttribute NoticeBoardVO vo, Model model, HttpSession session) {
		model.addAttribute("clubId", clubvo.getClubId());
		session.getAttribute("aboardNo");
		model.addAttribute("aboradNo", vo.getAboardNo());
		model.addAttribute("vo", noticeBoardService.voteResult(aboardNo));
		return "notice/noticeGroupViewR";
	}
	
	//에디터 모임 등록 후 나오는 페이지
	@RequestMapping("/editgroupwrite")
	public String editgroupwrite(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		
		System.out.println("notice editgroupwrite 확인 ");
		System.out.println("controller vo"+vo);
		
		noticeBoardService.editgroupwrite(vo);
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("번호확인"+vo.getMeetNo());
		
		return "redirect:/"+vo.getClubId()+"/notice/editlistgroup";
	}
	
	//에디터 모임 등록 후 나오는 리스트
	@RequestMapping("/editlistgroup")
	public String editlistgroup(ClubVo clubvo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice editgrouplist 확인");
		System.out.println("controller aboardNo 확인"+vo.getAboardNo());
		System.out.println(vo);
		
		model.addAttribute("clubId", clubvo.getClubId());
		
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("meetNo"+ vo.getMeetNo());
		model.addAttribute("meetNo", vo.getMeetNo());
		model.addAttribute("memberId", vo.getMemberId());
		model.addAttribute("vo", noticeBoardService.editlistgroup(vo.getAboardNo()));
		System.out.println("controller meetno 확인"+vo.getMeetNo());
		return "notice/noticeVoteView";
	}
	
	@ResponseBody
	@RequestMapping("/address")
	public JsonResult idCheck(@ModelAttribute NoticeBoardVO vo) {
		
		System.out.println("넘어오는지 확인" + vo);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(vo);
		
		return jsonResult;
	}

	//파일 업로드 처리  (썸머노트 이미지 첨부 하면 바로 저장됨  이미지 경로를 리턴)
	@ResponseBody
	@RequestMapping(value="/upload")
	public JsonResult upload(@RequestParam("file") MultipartFile file) {
		System.out.println("FileUploadController.upload()");
		System.out.println(file.getOriginalFilename());
		
		JsonResult jsonResult = new JsonResult();
		String psaveName = noticeBoardService.imgup(file);
		System.out.println("확확확"+psaveName);
		jsonResult.success(psaveName);
		
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping("/pay")
	public JsonResult pay(@ModelAttribute NoticeBoardVO vo, HttpSession session) {
		
		System.out.println("넘어오는지 확인" + vo);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(vo);
		System.out.println("getMemberId"+vo.getMemberId());
		System.out.println("getMeetNo"+vo.getMeetNo());
		
		return jsonResult;
	}
	
	//에디터 일반페이지 등록 후 insert
	@RequestMapping("/payinsert")
	public String payinsert(@ModelAttribute NoticeBoardVO vo, Model model) {
		
		System.out.println("넘어는 오니?");
		System.out.println(vo);
		model.addAttribute("aboradNo", vo.getAboardNo());
		model.addAttribute("meetNo", vo.getMeetNo());
		model.addAttribute("memberId", vo.getMemberId());

		noticeBoardService.payinsert(vo);
		
		return "redirect:/"+vo.getClubId()+"/notice/payresult/"+vo.getMeetNo();
	}
	
	
	//에디터 모임 등록 후 나오는 리스트
	@RequestMapping("/payresult/{payresultNo}")
	public String payresult(@PathVariable("payresultNo") int payresultNo, ClubVo clubvo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice payresult 확인");
		session.getAttribute("meetNo");
		model.addAttribute("meetNo", vo.getMeetNo());
		model.addAttribute("payresultNo", vo.getPayresultNo());
		System.out.println("notice payresult 확인"+vo.getPayresultNo());
		System.out.println("확확확"+vo);
		model.addAttribute("vo", noticeBoardService.payresult(vo.getMemberId(), vo.getPayresultNo()));
		System.out.println("controller meetno 확인"+vo.getMeetNo());
		return "notice/noticeVoteViewR";
	}
	
}