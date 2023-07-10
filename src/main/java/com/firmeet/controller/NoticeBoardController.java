package com.firmeet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		List<NoticeBoardVO> nlist = noticeBoardService.noticeList();
		model.addAttribute("nlist", nlist);
		
		return "notice/noticeList";
	}

	@RequestMapping("/noticeGroupView")
	public String test() {
		
		System.out.println("notice확인");
		
		return "notice/noticeGroupView";
	}
	
	@RequestMapping("/noticeEdit")
	public String test1() {
		
		System.out.println("notice확인");
		
		return "notice/noticeEdit";
	}
	
}