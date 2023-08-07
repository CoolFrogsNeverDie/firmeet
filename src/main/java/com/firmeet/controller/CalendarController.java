package com.firmeet.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.firmeet.vo.BoardVO;
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
								,HttpSession session
								,Model model ) {
		System.out.println("Club Calendar()");
		MemberVo member = (MemberVo) session.getAttribute("member");
        String memberId = null;
        
        if (member != null) {
            memberId = member.getMemberId();
            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            model.addAttribute("club", club);

            return "club_diary/club_calendar";

        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
		
	}

	
	/*클럽 캘린더 스케줄 정보 불러오기 AJAX*/
	@ResponseBody
	@RequestMapping(value = "/club/getschedule", method= RequestMethod.POST)
	public JsonResult getSchedule(@ModelAttribute CalendarVO calendarVO) {
		System.out.println("getClubSchedule()");
		JsonResult jsonResult = new JsonResult();
		List<ScheduleVO> list = calendarService.getClubSche(calendarVO);
		jsonResult.success(list);
		
		return jsonResult;
	}
	
	/*메인 페이지 클럽 스케줄*/
	@ResponseBody
	@RequestMapping(value = "/club/getschedule2", method =RequestMethod.POST)
	public JsonResult getSchedule2(@ModelAttribute CalendarVO calendarVO) {
		System.out.println("getCulubSchedule2()");
		
		JsonResult jsonResult = new JsonResult();
		jsonResult.success(calendarService.getClubSche2(calendarVO));
		
		
		return jsonResult;
	}
	
	
	/*개인 캘린더*/
	@RequestMapping(value ="/member/{memberId}")
	public String memCalendar(@PathVariable String memberId
							,Model model) {
		System.out.println("member Calendar()");
		
		MemberVo memberVO = new MemberVo();
		memberVO.setMemberId(memberId);
		List<ClubVo> joinList = calendarService.setCalOption(memberVO);
		model.addAttribute("memberId", memberVO.getMemberId());
		model.addAttribute("joinClubList", joinList);
		
		
		return "member_diary/member_calendar";
	}

	/*개인 스케줄 받아오기*/
	@ResponseBody
	@RequestMapping(value ="/member/getSchedule", method= RequestMethod.POST)
	public JsonResult getMemSchedule(@ModelAttribute CalendarVO calendarVO) {
		System.out.println("getMemSchedule()");
		
		JsonResult jsonResult = new JsonResult();
		Map<String, Object> list = calendarService.getMemSche(calendarVO);
		System.out.println("뿌리기 전 최종 정보" + list);
		jsonResult.success(list);
		return jsonResult;
	}
	
	/*개인 스케줄 추가*/
	@RequestMapping(value = "/member/add-persche", method = RequestMethod.GET)
	public String addPerSche(@ModelAttribute ScheduleVO scheduleVO) {
		System.out.println("addPerSchedule()");

		calendarService.addPerSche(scheduleVO);
		
		return "redirect:/calendar/member/" + scheduleVO.getMemberId();
	}
	
	/*세부 ScheDetail 정보 불러오기*/
	@ResponseBody
	@RequestMapping(value ="/member/gerScheDetail", method =RequestMethod.POST)
	public JsonResult getPerScheDetail(@ModelAttribute ScheduleVO scheduleVO) {
		System.out.println("getPerScheDetail()");
	
		JsonResult jsonResult = new JsonResult();
		ScheduleVO sche = calendarService.getPerScheDatail(scheduleVO);
		jsonResult.success(sche);
		
		return jsonResult;
	}
	
	/*개인 스케줄 삭제*/
	@ResponseBody
	@RequestMapping(value="/member/deletePerSche", method  = RequestMethod.POST)
	public JsonResult deletePerSche(@ModelAttribute ScheduleVO scheduleVO) {
		System.out.println("deletePerSchedule()");
		
		JsonResult jsonResult = new JsonResult();
		boolean result =  calendarService.deletePerSche(scheduleVO);
		jsonResult.success(result);
		
		
		return jsonResult;
	}
	
	/*개인 스케줄 수정*/
	@RequestMapping(value = "/member/edit-persche")
	public String editSche(@ModelAttribute ScheduleVO scheduleVO) {
		System.out.println("edit-perSchedule()");

		calendarService.editSche(scheduleVO);
		
		return "redirect:/calendar/member/" + scheduleVO.getMemberId();
	}
	
	
}	
