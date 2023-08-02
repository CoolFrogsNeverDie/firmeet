package com.firmeet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import com.firmeet.vo.ClubQnaVo;
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

    // 클럽 메인 페이지 조회
    @RequestMapping(value = "/main/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
    public String clubMain(@PathVariable int clubId, Model model, HttpSession session) {
        // 현재 로그인한 회원 정보를 세션에서 가져옵니다.
        MemberVo member = (MemberVo) session.getAttribute("member");

        String memberId = null;

        if (member != null) {
            memberId = member.getMemberId();

            System.out.println(memberId); // memberId 값 출력;

            // 클럽과 회원의 관계 정보를 가져옵니다.
            ClubVo club = clubService.checkMemLevel(memberId, clubId);
            // club이 null이면 쫒아내기!!!
            model.addAttribute("club", club);

            // 클럽의 갤러리 이미지 목록을 가져옵니다.
            List<GalleryImgVo> gImgVos = galleryService.getGalleryListAll(clubId);
            model.addAttribute("gImgVos", gImgVos);

            // 공지사항 목록을 가져옵니다.
            List<NoticeBoardVO> nList = noticeBoardService.noticeList(memberId);
            System.out.println(nList);
            model.addAttribute("noticeList", nList);

            return "/club/clubMain";

        } else {
            // 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
            return "member/memberForm";
        }
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

		return "redirect:/main/mainForm";
	}

	@RequestMapping(value = "/joinForm/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubForm(@PathVariable int clubId, 
			@RequestParam(value="crtPage", required = false, defaultValue = "1" ) int crtPage,	
			Model model,HttpSession session,
			HttpServletResponse response) {
		System.out.println("ClubController.clubForm()");
		System.out.println(clubId);
		MemberVo member = (MemberVo)session.getAttribute("member");
		System.out.println(member);
		
		if(member == null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인이 필요한 서비스입니다.');</script>");
	            out.flush(); 
	           
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 	List<TagVo> tagList = memberService.tagList();
	    		List<CategoryVo> cateList = memberService.cateList();
	    		model.addAttribute("tagList", tagList);
	    		model.addAttribute("cateList", cateList);
			return "/member/memberForm";
		}else {
			String memberId = member.getMemberId();
			System.out.println(memberId);
			ClubVo clubVo = clubService.clubInfo(clubId);
			model.addAttribute("clubVo" , clubVo);
			
			/*
			 * Map<String, Object> pMap= clubService.qnaList2(crtPage, clubId );
			 * model.addAttribute("pMap", pMap );
			 */
			
			 Map<String,Object> qMap = clubService.qnaList2(crtPage,clubId);
			 model.addAttribute("qMap",qMap);
			
			
			System.out.println(clubId);
			System.out.println(memberId);
			ClubVo memberLv = clubService.checkMemLevel(memberId, clubId);
			model.addAttribute("memberLv" , memberLv);
			System.out.println(memberLv);
			
		 return "/club/clubJoin";
			
			
			
		}
	}

	/* 클럽 가입 하기 */

	@RequestMapping(value = "/clubJoin/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubJoin(	@PathVariable("clubId") int clubId,
							HttpSession session,
							Model model) {
		System.out.println("ClubController.clubJoin()");
		System.out.println(clubId);
		ClubMemVo clubMemVo = new ClubMemVo();
		clubMemVo.setClubId(clubId);
		MemberVo member = (MemberVo)session.getAttribute("member");
		clubMemVo.setMemberId(member.getMemberId());
		
		
		System.out.println(clubMemVo);
		
		clubService.clubJoin(clubMemVo);
		
		return "redirect:/main/mainForm";

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
	
	@ResponseBody
	@RequestMapping(value = "/tagrank" , method = RequestMethod.POST)
	public JsonResult getRankTag(@ModelAttribute ClubVo clubVO) {
		
		JsonResult jsonResult = new JsonResult();
		System.out.println("넘어오는지 확인 합니다." + clubVO);
		jsonResult.success(clubService.getRankTag(clubVO));
	
		return jsonResult;
	}
	
	@RequestMapping(value = "/clubQna/{clubId}", method={RequestMethod.POST, RequestMethod.GET})
	public String clubQna(@ModelAttribute ClubQnaVo clubQnaVo,
						  @RequestParam(value="crtPage", required = false, defaultValue = "1" ) int crtPage,
						  @PathVariable int clubId, HttpSession session) {
		System.out.println("ClubController.clubQna()");
		MemberVo member = (MemberVo)session.getAttribute("member");
		clubQnaVo.setClubId(clubId);
		clubQnaVo.setMemberId(member.getMemberId());
		System.out.println(clubQnaVo);
		
		clubService.qnaList2(crtPage, clubId);
		
		return "redirect:/club/joinForm/{clubId}";
		
	}
	

}