package com.firmeet.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import com.firmeet.vo.NoticeBoardVO;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/{clubId}/notice")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("/noticelist")
	public String noticelist(@PathVariable("clubId") int clubId, Model model, NoticeBoardVO vo, HttpSession session) {
		System.out.println("noticelist 확인");
		
		session.setAttribute("clubId", clubId);
		
		model.addAttribute("nlist",noticeBoardService.noticeList());
		
		return "notice/noticeList";
	}
	
	//에디터 일반 페이지
	@RequestMapping("/noticeEditGeneral")
	public String noticeEditGeneral(HttpSession session, NoticeBoardVO vo, Model model) {
		
		System.out.println("noticeEditGeneral확인");
		
		int clubId = (int) session.getAttribute("clubId");
		
		System.out.println("controller clubId"+clubId);
		System.out.println(vo);
		return "notice/noticeEditGeneral";
	}
	
	//에디터 결제 페이지
	@RequestMapping("/noticeEditGroup")
	public String noticeEditGroup(HttpSession session, NoticeBoardVO vo, Model model) {
		
		int clubId = (int) session.getAttribute("clubId");
		
		System.out.println("noticeEditGroup확인");
		
		System.out.println("controller clubId"+clubId);
		
		return "notice/noticeEditGroup";
	}
	
	//에디터 일반페이지 등록 후 나오는 페이지
	@RequestMapping("/editwrite")
	public String editwrite(@ModelAttribute NoticeBoardVO vo, @RequestParam("memberId") String memberId, HttpSession session, Model model) {
		
		System.out.println("notice editwrite 확인 ");
		System.out.println("controller vo"+vo);
		
		session.setAttribute("memberId확인", vo.getMemberId());
		session.setAttribute("aboardNo확인", vo.getAboardNo());
		
		noticeBoardService.editwrite(vo);
		
		System.out.println("번호확인"+vo.getVoteNo());
		session.setAttribute("voteNo확인", vo.getVoteNo());
		
		return "redirect:/notice/"+vo.getClubId()+"/editlist/"+vo.getMemberId()+vo.getAboardNo()+"/"+(vo.getVoteNo()+1);
	}
	
	//에디터 일반페이지 등록 후 리스트
	@RequestMapping("/{clubId}/editlist")
	public String editlist(@PathVariable("clubId") int clubId, @RequestParam("aboardNo") int aboardNo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice editlist 확인");
		System.out.println("controller aboardNo 확인"+vo.getAboardNo());
		
		model.addAttribute("memberId", vo.getMemberId());
		model.addAttribute("aboardNo", vo.getAboardNo());
		model.addAttribute("voteNo", vo.getVoteNo());
		System.out.println("memberId"+ vo.getMemberId());
		System.out.println("aboardNo"+ vo.getAboardNo());
		System.out.println("voteNo"+ vo.getVoteNo());
		
		model.addAttribute("vo", noticeBoardService.editlist(aboardNo));
		
		System.out.println("controller voteNo 확인"+vo.getVoteNo());
		return "notice/noticeGroupView";
	}
	
	//에디터 모임 등록 후 나오는 페이지
	@RequestMapping("/{clubId}/{memberId}/editwritegroup")
	public String editgroupwrite(HttpSession session, @ModelAttribute NoticeBoardVO vo) {
		
		System.out.println("notice editgroupwrite 확인 ");
		System.out.println("controller vo"+vo);
		
		noticeBoardService.editgroupwrite(vo);
		
		System.out.println("번호확인"+vo.getMeetNo());
		
		return "redirect:/notice/"+vo.getClubId()+"/"+vo.getMemberId()+"/editlistgroup/"+vo.getAboardNo()+"/"+(vo.getMeetNo()+1);
	}
	
	//에디터 모임 등록 후 나오는 리스트
	@RequestMapping("/{clubId}/{memberId}/editlistgroup/{aboardNo}/{meetNo}")
	public String editlistgroup(@PathVariable("memberId") String memberId, @PathVariable("aboardNo") int aboardNo, @PathVariable("meetNo") int meetNo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice editgrouplist 확인");
		System.out.println("controller aboardNo 확인"+aboardNo);
		
		model.addAttribute("vo", noticeBoardService.editlistgroup(aboardNo));
		
		System.out.println("controller meetno 확인"+vo.getMeetNo());
		return "notice/noticeVoteView";
	}
	
	@RequestMapping("/noticeEditView")
	public String noticeEditView() {
		
		System.out.println("noticeEditView확인");
		
		return "notice/noticeEditView";
	}
	
	@RequestMapping("/{aboardNo}/{memberId}/{voteNo}/vote")
	public String vote(@PathVariable("aboardNo") int aboardNo, @PathVariable("voteNo") int voteNo, @ModelAttribute NoticeBoardVO vo, HttpSession session, Model model) {
		
		model.addAttribute("aboardNo", aboardNo);
		System.out.println("공지번호확인"+aboardNo);
		
		System.out.println("vote확인");
		System.out.println("controller vo"+vo);
		System.out.println("controller voteNo"+vo.getVoteNo());
		
//		session.getAttribute("voteNo");
//		vo.setVoteNo(voteNo);
		
		noticeBoardService.voteinsert(vo);
		
		return "redirect:/notice/"+vo.getAboardNo()+"/"+vo.getMemberId()+"/"+(vo.getVoteNo()+1)+"/voteResult";
	}
	
	//에디터 일반페이지 등록 후 리스트
	@RequestMapping("/{aboardNo}/{memberId}/{voteNo}/voteResult")
	public String voteResult(@PathVariable("memberId") String memberId, @PathVariable("aboardNo") int aboardNo, @PathVariable("voteNo") int voteNo, Model model, HttpSession session, NoticeBoardVO vo) {
		System.out.println("notice editlist 확인");
		
		model.addAttribute("aboardNo", aboardNo);
		System.out.println("공지번호확인"+aboardNo);
		
		System.out.println("controller aboardNo 확인"+aboardNo);
		
		model.addAttribute("vo", noticeBoardService.voteResult(aboardNo));
		
		System.out.println("controller voteNo 확인"+vo.getVoteNo());
		return "notice/noticeGroupViewR";
	}
	
	
	@RequestMapping("/voteresult")
	public String voteresult(Model model, HttpSession session, @ModelAttribute NoticeBoardVO vo) {
		System.out.println("voteresult controller 확인");
		return"notice/noticeGroupViewResult";
	}
	
	
	@RequestMapping(value="/upload", produces = "application/json; charset=utf8")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		System.out.println("사진 들어갔니~??");
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = request.getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	@RequestMapping("/apitest")
	public String apitest() {
		
		return "notice/test";
	}
	
	@RequestMapping("/apitest2")
	public String apitest2() {
		
		return "notice/test2";
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