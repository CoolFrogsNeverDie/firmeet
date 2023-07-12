package com.firmeet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.NoticeBoardVO;

@Controller
@RequestMapping("/notice")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("/noticelist")
	public String noticelist(Model model) {
		
		System.out.println("noticelist 확인");
		
		model.addAttribute("nlist",noticeBoardService.noticeList());
		
		return "notice/noticeList";
	}
	
//	@RequestMapping("/noticeEdit/{memberId}")
//	public String detail(@PathVariable("memberId") int memberId, Model model) {
//		model.addAttribute("vo", noticeBoardService.noticeEdit(memberId));
//		return "/notice/noticeEdit.jsp";
//	}

	@RequestMapping("/noticeGroupView")
	public String noticeGroupView() {
		
		System.out.println("notice확인");
		
		return "notice/noticeGroupView";
	}
	
	@RequestMapping("/{memberId}/noticeEdit/{clubId}")
	public String noticeEdit(@PathVariable("clubId") int clubId, @PathVariable("memberId") String memberId) {
		
		System.out.println("notice확인");
		
		return "notice/noticeEdit";
	}
	
	@RequestMapping("/{memberId}/{clubId}/editwrite")
	public String editwrite(@PathVariable("clubId") int clubId, 
			@PathVariable("memberId") String memberId,
			@ModelAttribute NoticeBoardVO noticeBoardVO) {
		
		System.out.println("notice editwrite 확인 ");
		System.out.println(clubId);
		System.out.println(memberId);
		
		System.out.println(noticeBoardVO);
		
		//noticeBoardService.editwrite(vo);
		
		return "notice/noticeGroupView";
	}
	
	
	@RequestMapping("/noticeEditView")
	public String noticeEditView() {
		
		System.out.println("noticeEditView확인");
		
		return "notice/noticeEditView";
	}
	
	@RequestMapping("/edit")
	public String edit() {
		
		System.out.println("edit확인");
		
		return "notice/edit";
	}
	

	
}