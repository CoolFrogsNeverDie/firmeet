package com.firmeet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/main")
public class MainController {
	@RequestMapping(value="/index",method = {RequestMethod.GET, RequestMethod.POST})
	public String home(){
		
		return"/main/index";
	}
}
