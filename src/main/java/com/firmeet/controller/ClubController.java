package com.firmeet.controller;

import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.ClubService;
import com.firmeet.service.GalleryService;
import com.firmeet.service.MemberService;
import com.firmeet.service.NoticeBoardService;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubMemVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.TagVo;

@Controller
@RequestMapping(value = "/club")
public class ClubController {

	@Autowired
	private ClubService clubService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private GalleryService galleryService;
	@Autowired
	private NoticeBoardService noticeBoardService;

	// 각주 추가: 클럽 Id 로 clubVo 가저오기
		@RequestMapping(value = "/main/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
		public String clubMain(@PathVariable int clubId, Model model) {
			System.out.println("ClubController.clubMain()");
				//관리자 등급 확인용
				ClubVo club = clubService.checkMemLevel(clubId);
				model.addAttribute("club", club);
				
				List<GalleryImgVo> gImgVos = galleryService.getGalleryListAll(clubId);
				model.addAttribute("gImgVos", gImgVos);
				
		        List<NoticeBoardVO> nList= noticeBoardService.noticeList();
				System.out.println(nList);
		        
		        model.addAttribute("noticeList", nList);

				return "/club/clubMain";
		}

	@RequestMapping(value = "/makingForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubMakingForm(Model model) {
		System.out.println("ClubController.clubMakingForm()");
		List<TagVo> tagList = memberService.tagList();
		List<CategoryVo> cateList = memberService.cateList();
		model.addAttribute("tagList", tagList);
		model.addAttribute("cateList", cateList);

		return "/club/makingForm";
	}

	/* 클럽 만들기 */

	@RequestMapping(value = "/making", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubMake(@ModelAttribute ClubVo clubVo, 
						   @RequestParam("file") MultipartFile[] files,
						   HttpSession session, 
						   Model model
							){
		System.out.println("ClubController.clubMaking()");
		System.out.println("넘어온 VO  확인" + clubVo);
		System.out.println("넘어온 VO  확인" + files[0].getOriginalFilename() );
		System.out.println("넘어온 VO  확인" + files[1].getOriginalFilename() );

		MemberVo authVo= (MemberVo)session.getAttribute("member");
		System.out.println(authVo);

		clubService.make(clubVo, authVo , files);

		List<TagVo> tagList = memberService.tagList();
		List<CategoryVo> cateList = memberService.cateList();
		model.addAttribute("tagList", tagList);
		model.addAttribute("cateList", cateList);

		return "/main/mainForm";
	}

	@RequestMapping(value = "/joinForm/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubForm(@PathVariable int clubId) {
		System.out.println("ClubController.clubForm()");
		System.out.println(clubId);
		/* clubService.clubList(clubId); */
		return "/club/clubJoin";
	}

	/* 클럽 가입 하기 */

	@RequestMapping(value = "/clubJoin", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubJoin(@ModelAttribute ClubVo clubVo, @ModelAttribute MemberVo memberVo,
			@ModelAttribute ClubMemVo clubMemVo, Model model) {
		System.out.println("ClubController.clubJoin()");
		clubMemVo.setMemberId(memberVo.getMemberId());
		clubMemVo.setClubId(clubVo.getClubId());
		/* clubService.clubJoin(clubVo, memberVo,clubMemVo); */
		System.out.println(clubMemVo);
		return "/club/clubJoin";

	}

	@ResponseBody
	@RequestMapping(value = "/selectTag", method = RequestMethod.POST)
	public String selectTag(@RequestParam(value = "tagNo[]") List<Integer> tagNo) {

		System.out.println(tagNo);
		for (int i = 0; i < tagNo.size(); i++) {
			TagVo selectTag = clubService.selectTag(tagNo.get(i));
			JsonResult jsonResult = new JsonResult();
			jsonResult.success(selectTag);
			System.out.println(jsonResult);
		}

		System.out.println(String.valueOf(tagNo));

		String result = String.valueOf(tagNo);
		return result;
	}

	public String searchTag() {
		return "";
	}

}