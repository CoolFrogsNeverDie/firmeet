package com.firmeet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.firmeet.service.ClubService;
import com.firmeet.service.MemberService;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.TagVo;

@Controller
@RequestMapping(value="/club")
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/makingForm", method= {RequestMethod.GET , RequestMethod.POST})
	public String clubMakingForm(Model model){
		System.out.println("ClubController.clubMakingForm()");
		List<TagVo> tagList = memberService.tagList();
		List<CategoryVo> cateList = memberService.cateList();
		model.addAttribute("tagList", tagList);
		model.addAttribute("cateList", cateList);
		
		return "/club/makingForm";
	} 
	
	
	/* 클럽 만들기 */
	
	@RequestMapping(value="/making", method= {RequestMethod.GET , RequestMethod.POST})
	public String clubMake(@ModelAttribute ClubVo clubVo
							,@ModelAttribute CategoryVo cateVo
							,@ModelAttribute TagVo tagVo){
		System.out.println("ClubController.clubMaking()");
		System.out.println("넘어온 VO  확인" +clubVo + cateVo);
		
		clubService.make(clubVo,cateVo,tagVo);
		System.out.println(clubVo);
		return"/main/mainForm";

	}
	
	@RequestMapping(value = "/main/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubMain() {

		return "/club/clubMain";
	}

	
	
	/* 클럽 가입 하기 */
	@RequestMapping(value="/clubJoin" , method={RequestMethod.GET,RequestMethod.POST})
	public String clubJoin(@ModelAttribute ClubVo clubVo,
							@ModelAttribute MemberVo memberVo) {
		clubService.clubJoin(clubVo, memberVo);
		return"";
		
	}
			
			

	
}