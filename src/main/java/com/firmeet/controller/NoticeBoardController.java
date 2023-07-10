package com.firmeet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.NoticeGeneralVoteVO;


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
	
	@RequestMapping("/noticeEdit")
	public String noticeEdit() {
		
		System.out.println("notice확인");
		
		return "notice/noticeEdit";
	}
	
	@RequestMapping(value="/noticeEdit/editwrite", method=RequestMethod.POST)
	public String editwrite(@ModelAttribute NoticeGeneralVoteVO vo) {
		
		System.out.println("notice editwrite 확인"+vo);
		
		return "";
	}
	
	
}