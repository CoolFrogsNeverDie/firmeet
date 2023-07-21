package com.firmeet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.ClubService;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MeetVo;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired
	private ClubService clubService;
	
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	public String home() {

		return "/main/index";
	}

	@RequestMapping(value = "/mainList", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainList() {

		return "/main/mainList";
	}


	@ResponseBody
	@RequestMapping(value = "/clubList", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult clubList(@RequestParam("memberId") String memberId) {
		System.out.println(memberId);

		JsonResult jsonResult = new JsonResult();

		try {
			// galleryService.getMeetName()에서 성공적으로 데이터를 가져온 경우
			List<ClubVo> gMeetVos = clubService.getMemClub(memberId);
			jsonResult.success(gMeetVos); // "success"로 설정하고 데이터를 설정
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.fail("데이터 가져오기에 실패했습니다."); // "fail"로 설정하고 실패 메시지 설정
		}

		return jsonResult;
	}
	
	
	
}
