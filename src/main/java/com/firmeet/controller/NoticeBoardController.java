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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.ClubService;
import com.firmeet.service.GalleryService;
import com.firmeet.service.MemberService;
import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.AreplyVO;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.PayresultVO;

@Controller
@RequestMapping("/{clubId}/notice")
public class NoticeBoardController {
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private GalleryService galleryService;
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("/noticelist")
	public String noticelist(@PathVariable int clubId, Model model, HttpSession session, @RequestParam(defaultValue="") String keyword) {
		System.out.println("noticelist 확인");
		
		session.setAttribute("clubId", clubId);
		
		model.addAttribute("nlist",noticeBoardService.noticeList(keyword));
		
        MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;

        if (member != null) {
            memberId = member.getMemberId();

            System.out.println(memberId); // memberId 값 출력;
            
            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            // club이 null이면 쫒아내기!!!
            model.addAttribute("club", club);

            // 클럽의 갤러리 이미지 목록을 가져옵니다.
            List<GalleryImgVo> gImgVos = galleryService.getGalleryListAll(clubId);
            model.addAttribute("gImgVos", gImgVos);

            // 공지사항 목록을 가져옵니다.
            List<NoticeBoardVO> nList = noticeBoardService.noticeList(memberId);
            System.out.println(nList);
            model.addAttribute("noticeList", nList);

	        return "notice/noticeList";

        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
		
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
	@RequestMapping("/noticeEditGroupP")
	public String noticeEditGroupP(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		System.out.println("noticeEditGroup확인");
		int clubId = (int) session.getAttribute("clubId");
		System.out.println("controller clubId"+clubId);
		model.addAttribute("clubId", clubId);
		return "notice/noticeEditGroupP";
	}
	
	//에디터 결제 페이지
	@RequestMapping("/noticeEditGroupG")
	public String noticeEditGroupG(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		System.out.println("noticeEditGroup확인");
		int clubId = (int) session.getAttribute("clubId");
		System.out.println("controller clubId"+clubId);
		model.addAttribute("clubId", clubId);
		return "notice/noticeEditGroupG";
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
		
		model.addAttribute("vo", noticeBoardService.editlist(vo));
		
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
		model.addAttribute("vo", noticeBoardService.voteResult(vo));
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
	public String editlistgroup(ClubVo clubvo, Model model, HttpSession session, @ModelAttribute NoticeBoardVO vo) {
		System.out.println("notice editgrouplist 확인");
		System.out.println("controller aboardNo 확인"+vo.getAboardNo());
		System.out.println(vo);
		
		model.addAttribute("clubId", clubvo.getClubId());
		
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("meetNo"+ vo.getMeetNo());
		model.addAttribute("meetNo", vo.getMeetNo());
		session.getAttribute("memberId");
		System.out.println("gsgsdsgsgsgsg"+vo.getMemberId());
		model.addAttribute("vo", noticeBoardService.editlistgroup(vo));
		System.out.println("controller meetno 확인"+vo.getMeetNo());
		return "notice/noticeVoteView";
	}
	
	//에디터 모임 등록 후 나오는 페이지
	@RequestMapping("/editgroupwriteG")
	public String editgroupwriteG(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		
		System.out.println("notice editgroupwriteGG 확인 ");
		System.out.println("controller vo"+vo);
		
		noticeBoardService.editgroupwriteG(vo);
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("번호확인"+vo.getMeetNo());
		
		return "redirect:/"+vo.getClubId()+"/notice/editlistgroupG";
	}
	
	//에디터 모임 등록 후 나오는 리스트
	@RequestMapping("/editlistgroupG")
	public String editlistgroupG(ClubVo clubvo, Model model, HttpSession session, @ModelAttribute NoticeBoardVO vo) {
		System.out.println("notice editgrouplistGG 확인");
		System.out.println("controller aboardNo 확인"+vo.getAboardNo());
		System.out.println(vo);
		
		model.addAttribute("clubId", clubvo.getClubId());
		
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("meetNo"+ vo.getMeetNo());
		model.addAttribute("meetNo", vo.getMeetNo());
		session.getAttribute("memberId");
		System.out.println("gsgsdsgsgsgsg"+vo.getMemberId());
		model.addAttribute("vo", noticeBoardService.editlistgroupG(vo));
		System.out.println("controller meetno 확인"+vo.getMeetNo());
		return "notice/noticeVoteViewG";
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
	public JsonResult pay(@ModelAttribute PayresultVO vo, @PathVariable("clubId") int clubId, HttpSession session, Model model) {
		
		System.out.println("넘어오는지 확인in" + vo);
		JsonResult jsonResult = new JsonResult();
		
		jsonResult.success(noticeBoardService.pay(vo));
		
		System.out.println("getMemberId"+vo.getMemberId());
		System.out.println("getMeetNo"+vo.getMeetNo());
		System.out.println("getPayresultNo"+vo.getPayresultNo());
		//String url = "/"+clubId+"/notice/payresult?payresultNo="+vo.getPayresultNo();
		
		//return "redirect:/"+url;
		
		return jsonResult;
	}
/*	
	//에디터 일반페이지 등록 후 리스트
	@RequestMapping("/payresult")
	public String payresult(ClubVo clubvo, @ModelAttribute NoticeBoardVO vo, Model model, HttpSession session) {
		model.addAttribute("clubId", clubvo.getClubId());
		session.getAttribute("meetNo");
		model.addAttribute("meetNo", vo.getMeetNo());
		model.addAttribute("memberId", vo.getMemberId());
		model.addAttribute("vo", noticeBoardService.payresult(vo));
		return "notice/noticeVoteViewR";
	}
*/
/*
	//에디터 모임 등록 후 나오는 리스트
	@RequestMapping("/payresult")
	@ResponseBody
	public String payresult(@ModelAttribute NoticeBoardVO vo, ClubVo clubvo, Model model) {
		model.addAttribute("clubId", clubvo.getClubId());
		model.addAttribute("aboradNo", vo.getAboardNo());
		model.addAttribute("memberId", vo.getMemberId());
		model.addAttribute("meetNo", vo.getMeetNo());
		model.addAttribute("payresultNo", vo.getPayresultNo());
		System.out.println("notice payresult 확인");
		System.out.println("notice getPayresultNo 확인"+vo.getPayresultNo());
		
		System.out.println("확확확"+vo);
		model.addAttribute("vo", noticeBoardService.payresult(vo));
		return "notice/noticeVoteViewR";
	}
*/
	//----------------------------------------------------------------------------------------------
	
	@ResponseBody
	@RequestMapping(value = "/addReply", method = RequestMethod.POST)
	public JsonResult addReply(@ModelAttribute AreplyVO vo) {
		JsonResult jsonResult = new JsonResult();
		
		System.out.println("AJAX로 넘어오는 정보" + vo);
		jsonResult.success(noticeBoardService.addReply(vo));
		
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/addReply_2", method = RequestMethod.POST)
	public JsonResult addRreply(@ModelAttribute AreplyVO vo) {
		JsonResult jsonResult = new JsonResult();
		
		System.out.println("AJAX로 넘어오는 정보" + vo);
		jsonResult.success(noticeBoardService.addReply2(vo));
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public JsonResult deleteReply(@ModelAttribute AreplyVO vo) {
		
		JsonResult jsonResult = new JsonResult();
		System.out.println("AJAX로 넘어온 삭제할 코멘트 정보 " +vo);
		boolean result = noticeBoardService.deleteReply(vo);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "/likeCnt", method = RequestMethod.POST)
	public JsonResult likeCnt(@ModelAttribute NoticeBoardVO vo) {
		
		JsonResult jsonResult = new JsonResult();
		System.out.println("넘어오는 거 체크" + vo);
		NoticeBoardVO result = noticeBoardService.likeCnt(vo);
		System.out.println(result);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
}