package com.firmeet.test;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class testControllerS {
	
	@Autowired
	SqlSession session;
	@Autowired
	testService testService;
	
	
	@RequestMapping("/now")
	public String test() {
		
		int row = session.selectOne("test.getAnything");
		System.out.println("test : " + row);
		testService.test();
		
		return "test/testS";
	}
	
	
	
	
	
}
