package com.firmeet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/host")
@Controller
public class ManagerController {
	
	@RequestMapping("/management")
	public String memberManagement() {
		
		System.out.println("넘어오는 정보값 확인");
		
		return "club_management/club_member_update";
	}
	
}
