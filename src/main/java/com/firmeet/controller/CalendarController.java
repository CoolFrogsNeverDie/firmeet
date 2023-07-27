package com.firmeet.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.CalendarService;
import com.firmeet.service.ClubService;
import com.firmeet.vo.CalendarVO;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.ScheduleVO;

@RequestMapping("/calendar")
@Controller
public class CalendarController {
		
	@Autowired
	private CalendarService calendarService;
	@Autowired
	private ClubService clubService;
	
	/*클럽 캘린더*/
	@RequestMapping(value ="/club/{clubId}", method = RequestMethod.GET)
	public String clubCalendar(@PathVariable("clubId") int clubId
								,Model model ) {
		
	    ClubVo clubVo = clubService.getClubVo(clubId);
	    model.addAttribute("club", clubVo);
		
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
	
	
	@RequestMapping(value ="/member/{memberId}")
	public String memCalendar(@PathVariable String memberId
							,Model model) {
		
		
		MemberVo memberVO = new MemberVo();
		memberVO.setMemberId(memberId);
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
		
		return "redirect:/calendar/member/" + scheduleVO.getMemberId();
	}
	
	/*세부 ScheDetail 정보 불러오기*/
	@ResponseBody
	@RequestMapping(value ="/member/gerScheDetail", method =RequestMethod.POST)
	public JsonResult getPerScheDetail(@ModelAttribute ScheduleVO scheduleVO) {
	
		JsonResult jsonResult = new JsonResult();
		System.out.println("AJAX로 넘어온 정보 getPerScheDetail" +scheduleVO);
		ScheduleVO sche = calendarService.getPerScheDatail(scheduleVO);
		jsonResult.success(sche);
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/deletePerSche", method  = RequestMethod.POST)
	public JsonResult deletePerSche(@ModelAttribute ScheduleVO scheduleVO) {
		
		JsonResult jsonResult = new JsonResult();
		System.out.println("delete하기 위한 정보 "+ scheduleVO);
		boolean result =  calendarService.deletePerSche(scheduleVO);
		jsonResult.success(result);
		
		
		return jsonResult;
	}
	
	@RequestMapping(value = "/member/edit-persche")
	public String editSche(@ModelAttribute ScheduleVO scheduleVO) {
		
		System.out.println("수정을 위해 넘어온 정보" + scheduleVO);
		calendarService.editSche(scheduleVO);
		
		
		return "redirect:/calendar/member/" + scheduleVO.getMemberId();
	}
	
	
}	
