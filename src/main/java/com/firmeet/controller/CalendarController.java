package com.firmeet.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.CalendarService;
import com.firmeet.vo.CalendarVO;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.ScheduleVO;

@RequestMapping("/calendar")
@Controller
public class CalendarController {
		
	@Autowired
	private CalendarService calendarService;
	
	
	/*클럽 캘린더*/
	@RequestMapping(value ="/club", method = RequestMethod.GET)
	public String clubCalendar(@RequestParam(value ="clubId", required = false, defaultValue="0") int clubId
								,Model model ) {
		
		model.addAttribute("clubId",clubId);
		
		return "club_diary/club_calendar";
	}

	
	/*클럽 캘린더 스케줄 정보 불러오기 AJAX*/
	@ResponseBody
	@RequestMapping(value = "/club/getSchedule", method= RequestMethod.POST)
	public JsonResult getSchedule(@ModelAttribute CalendarVO calendarVO) {
		JsonResult jsonResult = new JsonResult();
		List<ScheduleVO> list = calendarService.getClubSche(calendarVO);
		jsonResult.success(list);
		
		return jsonResult;
	}
	
	
	@RequestMapping(value ="/member")
	public String memCalendar(@ModelAttribute MemberVo memberVO
							,Model model) {
		
		List<ClubVo> joinList = calendarService.setCalOption(memberVO);
		model.addAttribute("memberId", memberVO.getMemberId());
		model.addAttribute("joinClubList", joinList);
		
		
		return "member_diary/member_calendar";
	}

	@ResponseBody
	@RequestMapping(value ="/member/getSchedule", method= RequestMethod.POST)
	public JsonResult getMemSchedule(@ModelAttribute CalendarVO calendarVO) {
		System.out.println("getMemSchedule");
		
		
		JsonResult jsonResult = new JsonResult();
		System.out.println("AJAX로 넘어온 정보 " + calendarVO);
		Map<String, Object> list = calendarService.getMemSche(calendarVO);
		
		jsonResult.success(list);
		System.out.println("넘어갈 정보 확인 " + list);
		return jsonResult;
	}
	
	@RequestMapping(value = "/member/add-persche", method = RequestMethod.GET)
	public String addPerSche(@ModelAttribute ScheduleVO scheduleVO) {
		
		System.out.println("넘어온 개인 일정 정보" + scheduleVO);
		calendarService.addPerSche(scheduleVO);
		
		return "";
	}
	
}	
