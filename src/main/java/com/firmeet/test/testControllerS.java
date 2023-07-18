package com.firmeet.test;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class testControllerS {
	
	@Autowired
	testService testService;
	
	
	@RequestMapping("/now")
	public String test() {
		
		testService.test();
		
		return "notice/noticeGroupViewR";
	}
	
	
	
	
	
}
