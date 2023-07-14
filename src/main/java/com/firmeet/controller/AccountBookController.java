package com.firmeet.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firmeet.service.AccountBookService;
import com.firmeet.vo.AccountBookVo;
import com.firmeet.vo.ClubVo;

@Controller
@RequestMapping("/accountBook")
public class AccountBookController {

	@Autowired
	private AccountBookService accountBookService;
	
	@RequestMapping("/main/{clubId}")
	public String accountbookMain(@PathVariable("clubId") int clubId, Model model) {

		System.out.println("accountbookMain 확인");
		
		List<AccountBookVo> aList = accountBookService.getList(clubId);
		
		model.addAttribute("accountList",aList);
		
		return "/accountbook/accountbook";
	}
}
