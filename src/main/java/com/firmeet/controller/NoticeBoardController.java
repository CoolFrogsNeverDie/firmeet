package com.firmeet.controller;

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
import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.NoticeBoardVO;
import com.google.gson.JsonObject;

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
		
		return "notice/noticeEditGeneral";
	}
	
	//에디터 결제 페이지
	@RequestMapping("/noticeEditGroup")
	public String noticeEditGroup(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		
		System.out.println("noticeEditGroup확인");
		
		int clubId = (int) session.getAttribute("clubId");
		
		System.out.println("controller clubId"+clubId);
		
		return "notice/noticeEditGroup";
	}
	
	//에디터 일반페이지 등록 후 나오는 페이지
	@RequestMapping("/editwrite")
	public String editwrite(@ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		System.out.println("notice editwrite 확인 ");
		System.out.println("controller vo"+vo);
		noticeBoardService.editwrite(vo);
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("getAboardNo"+vo.getAboardNo());
		
		return "redirect:/"+vo.getClubId()+"/notice/editlist/"+vo.getAboardNo();
	}
	
	//에디터 일반페이지 등록 후 리스트
	@RequestMapping("/editlist/{aboardNo}")
	public String editlist(@PathVariable("aboardNo") int aboardNo, ClubVo clubvo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice editlist 확인");
		System.out.println("controller aboardNo 확인"+vo.getAboardNo());
		
		model.addAttribute("clubId", clubvo.getClubId());
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("aboardNo"+ vo.getAboardNo());
		model.addAttribute("voteNo", vo.getVoteNo());
		System.out.println("controller voteNo 확인"+ vo.getVoteNo());
		
		model.addAttribute("aboardHit",vo.getAboardHit());
		System.out.println("AboardHit"+vo.getAboardHit());
		
		model.addAttribute("vo", noticeBoardService.editlist(aboardNo));
				
		return "notice/noticeGroupView";
	}
	
	@RequestMapping("/vote/{voteNo}")
	public String vote(@PathVariable("voteNo") int voteNo, @ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		
		System.out.println("controller vo"+vo);
		model.addAttribute("voteNo", vo.getVoteNo());
		System.out.println("voteNo"+ vo.getVoteNo());
		
		noticeBoardService.voteinsert(vo);
		
		return "redirect:/"+vo.getClubId()+"/notice/"+vo.getVoteNo()+"/voteResult";
	}
	
	
	
	//에디터 일반페이지 등록 후 리스트
	@RequestMapping("/{voteNo}/voteResult")
	public String voteResult(@PathVariable("voteNo") int voteNo, @ModelAttribute NoticeBoardVO vo, @ModelAttribute("aboardNo") int aboardNo, Model model, HttpSession session) {
		System.out.println("notice editlist 확인");
		model.addAttribute("aboardNo", vo.getAboardNo());
		model.addAttribute("vo", noticeBoardService.voteResult(aboardNo));
		
		System.out.println("controller voteNo 확인"+vo.getVoteNo());
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
		
		return "redirect:/"+vo.getClubId()+"/notice/editlistgroup/"+vo.getAboardNo();
	}
	
	//에디터 모임 등록 후 나오는 리스트
	@RequestMapping("/editlistgroup/{aboardNo}")
	public String editlistgroup(@PathVariable("aboardNo") int aboardNo, ClubVo clubvo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice editgrouplist 확인");
		System.out.println("controller aboardNo 확인"+aboardNo);
		
		model.addAttribute("clubId", clubvo.getClubId());
		
		model.addAttribute("aboardNo", vo.getAboardNo());
		System.out.println("aboardNo"+ vo.getAboardNo());
		model.addAttribute("meetNo", vo.getMeetNo());
		model.addAttribute("vo", noticeBoardService.editlistgroup(aboardNo));
		
		System.out.println("controller meetno 확인"+vo.getMeetNo());
		return "notice/noticeVoteView";
	}
	
/*	
	@RequestMapping(value="/upload", produces = "application/json")
	@ResponseBody
	public JsonObject upload(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
*/
	
	@RequestMapping(value="/SummerNoteImageFile" , method = RequestMethod.POST)
	public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = noticeBoardService.SummerNoteImageFile(file);
		 System.out.println(jsonObject);
		return jsonObject;
	}
	
	@ResponseBody
	@RequestMapping("/address")
	public JsonResult idCheck(@ModelAttribute NoticeBoardVO vo) {
		
		System.out.println("넘어오는지 확인" + vo);
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(vo);
		
		return jsonResult;
	}
	
	
}