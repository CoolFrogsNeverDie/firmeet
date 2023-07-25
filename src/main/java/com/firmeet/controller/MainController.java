package com.firmeet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.ClubService;
import com.firmeet.service.MemberService;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.TagVo;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	public String home() {

		return "/main/index";
	}

	@RequestMapping(value = "/mainForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainList(Model model) {
		List<TagVo> tagList = memberService.tagList();
		model.addAttribute("tagList", tagList);
		System.out.println(tagList);
		
		List<CategoryVo> cateList = memberService.cateList();
		model.addAttribute("cateList", cateList);
		System.out.println(cateList);
		
		ClubVo clubVo = new ClubVo();
		clubVo.setClubId(clubVo.getClubId());
		
		List<ClubVo> clubList = clubService.clubList(clubVo.clubId);
		model.addAttribute("clubList",clubList);
		System.out.println(clubList);
		
		return "/main/mainForm";
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
