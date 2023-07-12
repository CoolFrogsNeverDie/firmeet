package com.firmeet.controller;




import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
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
	public String login(@ModelAttribute MemberVo memberVo,HttpSession session ){
		System.out.println("MemberController.login()");
		System.out.println(memberVo);
		MemberVo member =  memberService.login(memberVo);
		
		  if(member !=null){
			  System.out.println("로그인 성공");
			  session.setAttribute("member", member);
			  return "main/mainList";
		  }else {
			  System.out.println("로그인 실패");
			  return "member/loginForm";
		  }
		 
		
		
	}
	
	/* 회원가입 */
	@RequestMapping(value="/joinForm", method= {RequestMethod.GET,RequestMethod.POST})
	public String joinForm() {
		System.out.println("MemberController.joinForm()");
		return "member/joinForm";
	}
	
	@RequestMapping(value="/join", method= { RequestMethod.GET , RequestMethod.POST})
	public String join(@ModelAttribute MemberVo memberVo) {
		System.out.println("MemberController.join()");
		System.out.println(memberVo);
		memberService.join(memberVo);
			
		return "member/loginForm";
	}
	
	/* 아이디 체크 */
	@ResponseBody
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public JsonResult idcheck(@ModelAttribute MemberVo memberVo) {
		System.out.println("MemberController.idcheck()");
		
		boolean data = memberService.idcheck(memberVo.getMemberId());
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(data);
		
		System.out.println(jsonResult);
		return jsonResult;
	}
}
