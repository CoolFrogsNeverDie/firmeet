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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.ClubService;
import com.firmeet.service.GalleryService;
import com.firmeet.service.MemberService;
import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.TagVo;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private GalleryService galleryService;
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	public String home() {
		return "/main/index";
	}

	@RequestMapping(value = "/mainForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainList(
			@ModelAttribute ClubVo clubVo ,
			@RequestParam(value="crtPage", required=false,defaultValue="1")int crtPage,
						   @RequestParam(value="keyword", required=false,defaultValue="") String keyword,
						   Model model, HttpSession session) {
		List<TagVo> tagList = memberService.tagList();
		model.addAttribute("tagList", tagList);

		List<CategoryVo> cateList = memberService.cateList();
		model.addAttribute("cateList", cateList);

		
		System.out.println("MainController.mainList()");
		Map<String, Object> pMap = clubService.clubList2(crtPage,keyword,clubVo);
		model.addAttribute("pMap",pMap);
		
		System.out.println(pMap);
		return "/main/mainForm2";
	}

	
	@RequestMapping(value = "/mainForm2", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainList2(
			@ModelAttribute ClubVo clubVo ,
			@RequestParam(value="crtPage", required=false,defaultValue="1")int crtPage,
						   @RequestParam(value="keyword", required=false,defaultValue="") String keyword,
						   Model model, HttpSession session) {
		List<TagVo> tagList = memberService.tagList();
		model.addAttribute("tagList", tagList);

		List<CategoryVo> cateList = memberService.cateList();
		model.addAttribute("cateList", cateList);

		
		System.out.println("MainController.mainList()");
		Map<String, Object> pMap = clubService.clubList2(crtPage,keyword,clubVo);
		model.addAttribute("pMap",pMap);
		
		System.out.println(pMap);
		return "/main/mainForm2";
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
	
	/*마이 다이어리*/
	// 각주 추가: 클럽 Id 로 clubVo 가저오기 
	@RequestMapping(value = "/member/main/{memberId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String MyMain(@PathVariable("memberId") String memberId, Model model,HttpSession session) {
		// 현재 로그인한 회원 정보를 세션에서 가져옵니다.
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		System.out.println("MyMain 확인");
		if (member != null) {
        List<GalleryImgVo> gList = galleryService.getMyGalleryList2(memberId);
        
        model.addAttribute("galleryList", gList);
        
        List<NoticeBoardVO> nList= noticeBoardService.noticeList(memberId);
		System.out.println(nList);
        
        model.addAttribute("noticeList", nList);
        
		return "/member_diary/member_main";
		
		} else {
			// 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
			return "member/memberForm";
		}
	}
	
	@RequestMapping(value="/search" , method= {RequestMethod.GET , RequestMethod.POST})
	public String searchList(@ModelAttribute ClubVo clubVo,
							 @RequestParam(value="crtPage", required = false, defaultValue = "1" ) int crtPage,
							 @RequestParam(value="keyword", required = false, defaultValue = "") String keyword,
							 Model model) {
		System.out.println("MainController.searchList()");
		System.out.println(clubVo);
		
		List<TagVo> tagList = memberService.tagList();
		model.addAttribute("tagList", tagList);
		
		List<CategoryVo> cateList = memberService.cateList();
		model.addAttribute("cateList", cateList);
		
		
		/*
		 * Map<String, Object> pMap = clubService.searchList(crtPage,keyword, clubVo);
		 * model.addAttribute("pMap",pMap);
		 */
		 
		return "/main/mainForm2";
	}
	
}
