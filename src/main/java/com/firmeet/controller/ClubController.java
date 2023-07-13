package com.firmeet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.firmeet.service.ClubService;
import com.firmeet.vo.ClubVo;

@Controller
@RequestMapping(value="/club")
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	@RequestMapping(value="/makingForm", method= {RequestMethod.GET , RequestMethod.POST})
	public String clubMakingForm(){
		System.out.println("ClubController.clubMakingForm()");
		
		return "/club/makingForm";
	} 
	
	
	/* 클럽 만들기 */
	
	@RequestMapping(value="/making", method= {RequestMethod.GET , RequestMethod.POST})
	public String clubMake(@ModelAttribute ClubVo clubVo){
		System.out.println("ClubController.clubMaking()");
		
		clubService.make(clubVo);
		return"";
		
	}

}
