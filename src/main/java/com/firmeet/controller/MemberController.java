package com.firmeet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.firmeet.service.MemberService;
import com.firmeet.vo.MemberVo;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/* 로그인 폼*/
	@RequestMapping(value="/loginForm", method= {RequestMethod.GET})
	public String loginForm(){
		System.out.println("MemberController.loginForm()");
		return"member/login";
	}

	/* 로그인 */
	@RequestMapping(value="/login", method= {RequestMethod.GET})
	public String login(@ModelAttribute MemberVo memberVo){
		System.out.println("MemberController.login()");
		
		return "";
		
	}
	
	/* 회원가입 */
	@RequestMapping(value="/joinForm", method= {RequestMethod.GET,RequestMethod.POST})
	public String joinForm() {
		System.out.println("MemberController.joinForm()");
		return "member/joinForm";
	}
	
	@RequestMapping(value="/join", method= {RequestMethod.GET , RequestMethod.POST})
	public String join(@ModelAttribute MemberVo memberVo) {
		System.out.println("MemberController.join()");
		
		memberService.join(memberVo);
		return "member/join";
	}
}
