package com.firmeet.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.NoticeGeneralVoteVO;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/notice")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
//	@RequestMapping("/noticelist")
//	public String noticelist(Model model) {
		
//		System.out.println("noticelist 확인");
		
//		model.addAttribute("nlist",noticeBoardService.noticeList());
		
//		return "notice/noticeList";
//	}
	
	@RequestMapping("/{clubId}/{memberId}/noticeEdit")
	public String noticeEdit(@PathVariable("clubId") int clubId, @PathVariable("memberId") String memberId) {
		
		System.out.println("notice확인");
		
		return "notice/noticeEdit";
	}
	
	@RequestMapping("/noticeEdit")
	public String noticeEdit() {
		
		System.out.println("notice확인");
		
		return "notice/noticeEdit";
	}
	
	@RequestMapping("/{clubId}/{memberId}/editwrite")
	public String editwrite(@PathVariable("clubId") int clubId, 
			@PathVariable("memberId") String memberId,
			@ModelAttribute NoticeBoardVO vo) {
		
		System.out.println("notice editwrite 확인 ");
		System.out.println(clubId);
		System.out.println(memberId);
		
		System.out.println(vo);
		
		noticeBoardService.editwrite(vo);
		
		return "notice/noticeGroupView";
	}
	
	@RequestMapping("/noticeEdit/noticeVote")
	public String voteinsert(@ModelAttribute NoticeGeneralVoteVO vo) {
		
		System.out.println("notice voteinsert 확인 ");
		
		System.out.println(vo);
		
		noticeBoardService.voteinsert(vo);
		
		return "notice/noticeEdit";
	}
	
	@RequestMapping("/{clubId}/{memberId}/editlist/{aboardNo}")
	public String editlist(@PathVariable("aboardNo") int aboardNo, Model model) {
		System.out.println("notice editlist 확인");
		model.addAttribute("vo", noticeBoardService.editlist(aboardNo));
		
		return "notice/noticeGroupView";
	}
	
	@RequestMapping("/noticeEditView")
	public String noticeEditView() {
		
		System.out.println("noticeEditView확인");
		
		return "notice/noticeEditView";
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
	
	
}