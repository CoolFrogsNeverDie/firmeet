package com.firmeet.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.vo.CalendarVO;

@RequestMapping("/calendar")
@Controller
public class CalendarController {
		
	
	@RequestMapping(value ="/club", method = {RequestMethod.POST,RequestMethod.GET})
	public String clubCalendar(@ModelAttribute CalendarVO calendarVO
								,Model model ) {
		
		System.out.println("넘어온 값들 확인 클럽 아이디 : " + calendarVO);
		model.addAttribute("clubId",calendarVO.getClubId());
		model.addAttribute("viewOption",calendarVO.getViewOption());
		model.addAttribute("month",calendarVO.getMonth());
		
		return "club_diary/club_calendar";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getSchedule", method= RequestMethod.POST)
	public JsonResult getSchedule(@ModelAttribute CalendarVO calendarVO) {
		
		System.out.println("AJAX로 넘어온 객체 정보 확인 : " + calendarVO);
		
		return null;
	}
	
}
