package com.firmeet.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.ajax.JsonResult;
import com.firmeet.service.ClubService;
import com.firmeet.service.GalleryService;
import com.firmeet.vo.AccountBookVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.GalleryLikeVo;
import com.firmeet.vo.GalleryVo;
import com.firmeet.vo.MeetVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.ScheduleVO;


@Controller
@RequestMapping("/gallery")
public class GalleryController {

	@Autowired
	private GalleryService galleryService;
	@Autowired
	private ClubService clubService;

	// 갤러리 목록 조회
	@RequestMapping(value = "/list/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String galleryList(@PathVariable("clubId") int clubId, Model model, HttpSession session) {
		System.out.println("galleryList 확인");
		System.out.println("clubId : " + clubId);

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

			List<MeetVo> gMeetVos = galleryService.getMeetMon(clubId);
			List<GalleryImgVo> galleryImgVos = galleryService.getGalleryListAll(clubId);
			model.addAttribute("galleryList", galleryImgVos);
			model.addAttribute("meetList", gMeetVos);

			return "/gallery/gallery";

		} else {
			// 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
			return "member/memberForm";
		}
	}
	
	//모임 이름 가져오기
	@ResponseBody
	@RequestMapping(value = "/getMeetName", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult getMeetName(@RequestParam("year") int year, @RequestParam("month") int month) {

		JsonResult jsonResult = new JsonResult();

		System.out.println("getMeetName 확인");
		System.out.println(year);
		System.out.println(month);

		try {
			// galleryService.getMeetName()에서 성공적으로 데이터를 가져온 경우
			List<MeetVo> gMeetVos = galleryService.getMeetName(year, month);
			jsonResult.success(gMeetVos); // "success"로 설정하고 데이터를 설정
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.fail("데이터 가져오기에 실패했습니다."); // "fail"로 설정하고 실패 메시지 설정
		}

		return jsonResult;
	}

	//이미지 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/getGalleryList", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult getGalleryList(@RequestParam("meetNo") int meetNo) {
		JsonResult jsonResult = new JsonResult();

		System.out.println("getMeetName 확인");
		System.out.println(meetNo);

		try {
			int galleryNo = galleryService.getGalleryNo(meetNo);
			List<GalleryImgVo> galleryImgVos = galleryService.getGalleryImg(galleryNo);
			jsonResult.success(galleryImgVos); // "success"로 설정하고 데이터를 설정
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.fail("데이터 가져오기에 실패했습니다."); // "fail"로 설정하고 실패 메시지 설정
		}

		return jsonResult;
	}

	//전체 이미지 가져오기
	@ResponseBody
	@RequestMapping(value = "/getGalleryListAll", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult getGalleryListAll(@RequestParam("clubId") int clubId) {
		JsonResult jsonResult = new JsonResult();

		System.out.println("getMeetName 확인");
		System.out.println(clubId);

		try {
			List<GalleryImgVo> galleryImgVos = galleryService.getGalleryListAll(clubId);
			jsonResult.success(galleryImgVos); // "success"로 설정하고 데이터를 설정
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.fail("데이터 가져오기에 실패했습니다."); // "fail"로 설정하고 실패 메시지 설정
		}

		return jsonResult;
	}

	// 갤러리 업로드 폼
	@RequestMapping(value = "/uploadForm/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String uploadForm(@PathVariable("clubId") int clubId, @RequestParam("meetNo") int meetNo, Model model, HttpSession session) {
		System.out.println("uploadForm 확인");
		System.out.println("clubId : " + clubId);
		System.out.println("meetNo : " + meetNo);
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

			MeetVo sList = galleryService.getMeetA(meetNo);

			model.addAttribute("meet", sList);

			return "/gallery/galleryUploadForm";

		} else {
			// 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
			return "member/memberForm";
		}
	}

	// 갤러리 업로드
	@RequestMapping(value = "/upload/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String upload(@PathVariable("clubId") int clubId, @RequestParam("meet") int meet,@RequestParam("memberId") String memberId,
			@RequestParam("uploadPicture") List<MultipartFile> files) {
		System.out.println("upload 확인");
		System.out.println("clubId: " + clubId);
		System.out.println("meet: " + meet);
		System.out.println("memberId: " + memberId);

		int galleryNo = galleryService.getGalleryNo(meet);

		for (MultipartFile file : files) {
			System.out.println("file: " + file.getOriginalFilename());
			galleryService.upload(clubId, galleryNo, file,memberId);
		}

		return "redirect:/gallery/list/" + clubId;
	}

	//좋아요 인원 확인
	@ResponseBody
	@RequestMapping(value = "/checkLike", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult checkLike(@RequestParam("imgno") int imgno,HttpSession session) {
	    System.out.println("checkLike 확인");
	    JsonResult jsonResult = new JsonResult();
        MemberVo memberVo = (MemberVo)session.getAttribute("member");
        System.out.println("memberVo : "+memberVo.getMemberId());
        
	    try {
	        // 좋아요 정보를 가져오는 서비스 메서드를 호출합니다.
	        boolean result = galleryService.checkLike(imgno,memberVo.getMemberId());
	        
	        // 가져온 좋아요 정보를 jsonResult에 설정합니다.
	        jsonResult.success(result);
	    } catch (Exception e) {
	        // 서비스 메서드가 예외를 발생시킨 경우, 에러 메시지를 설정합니다.
	        jsonResult.fail("좋아요 정보 조회 중 오류가 발생했습니다.");
	    }

	    return jsonResult;
	}

	//좋아요 추가
	@ResponseBody
	@RequestMapping(value = "/updateLike" , method = {RequestMethod.GET,RequestMethod.POST})
    public JsonResult updateLikeStatus(@RequestParam("imgno") int imgno,
    								   @RequestParam("likeCnt") int likeCnt,
    								   HttpSession session) {
		System.out.println("updateLikeStatus 확인");
		System.out.println("imgNo : "+imgno);
		System.out.println("likeCnt : "+likeCnt);
		likeCnt+=1;
		System.out.println("변경된 likeCnt : "+likeCnt);
		
        JsonResult jsonResult = new JsonResult();
        MemberVo memberVo = (MemberVo)session.getAttribute("member");
        System.out.println("memberVo : "+memberVo.getMemberId());
        try {
            // 좋아요 상태를 업데이트하는 서비스 메서드를 호출합니다.
            galleryService.updateLikeStatus(imgno, likeCnt,memberVo.getMemberId());

            jsonResult.success(likeCnt);
        } catch (Exception e) {
            // 서비스 메서드가 예외를 발생시킨 경우, 에러 메시지를 설정합니다.
            jsonResult.fail("좋아요 상태 업데이트 중 오류가 발생했습니다.");
        }

        return jsonResult;
    }
	
	//좋아요 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteLike", method = {RequestMethod.GET, RequestMethod.POST})
	public JsonResult deleteLikeStatus(@RequestParam("imgno") int imgno,
	                                    @RequestParam("likeCnt") int likeCnt,
	                                    HttpSession session) {
	    System.out.println("deleteLikeStatus 확인");
	    System.out.println("imgNo : " + imgno);
	    System.out.println("likeCnt : " + likeCnt);
	    likeCnt -= 1;
	    System.out.println("변경된 likeCnt : " + likeCnt);

	    JsonResult jsonResult = new JsonResult();
	    MemberVo memberVo = (MemberVo) session.getAttribute("member");
	    System.out.println("memberVo : " + memberVo.getMemberId());
	    try {
	        // 좋아요 상태를 삭제하는 서비스 메서드를 호출합니다. (DELETE 쿼리 실행)
	        galleryService.deleteLikeStatus(imgno,likeCnt, memberVo.getMemberId());

	        jsonResult.success(likeCnt);
	    } catch (Exception e) {
	        // 서비스 메서드가 예외를 발생시킨 경우, 에러 메시지를 설정합니다.
	        jsonResult.fail("좋아요 상태 삭제 중 오류가 발생했습니다.");
	    }

	    return jsonResult;
	}
	
    //이미지삭제
	@RequestMapping(value = "/deleteImg/{clubId}" , method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteImg(@PathVariable("clubId") int clubId,
						 	@RequestParam("imgno")int imgno) {
	    System.out.println("deleteLikeStatus 확인");
	    System.out.println("clubId"+clubId);
	    System.out.println("imgno"+imgno);
	    
	    galleryService.deleteImg(imgno);
		
		return "redirect:/gallery/list/" + clubId;
	}
	
	//이미지 주인 찾기
	@ResponseBody
	@RequestMapping(value = "/checkmemberId", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonResult checkmemberId(@RequestParam("memberId")String memberId) {
		  System.out.println("checkmemberId 확인");
	    JsonResult jsonResult = new JsonResult();
	    try {
	    	MemberVo memberVo = galleryService.checkmemberId(memberId);
	    	
	    	jsonResult.success(memberVo);
	    } catch (Exception e) {
	        // 서비스 메서드가 예외를 발생시킨 경우, 에러 메시지를 설정합니다.
	        jsonResult.fail("좋아요 상태 삭제 중 오류가 발생했습니다.");
	    }

	    return jsonResult;
	}
	
	/*-------------------------------------마이겔러리---------------------------- */
	// 갤러리 목록 조회
	@RequestMapping(value = "/member/list/{memberId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String myGalleryList(@PathVariable("memberId") String memberId, Model model, HttpSession session) {
		// 현재 로그인한 회원 정보를 세션에서 가져옵니다.
		System.out.println("myGalleryList 확인");
		MemberVo member = (MemberVo) session.getAttribute("member");

		if (member != null) {
			System.out.println("myGalleryList 확인");
			System.out.println("memberId : " + memberId);

			List<MeetVo> mList = galleryService.getMyGalleryList(memberId);
			List<GalleryImgVo> gList = galleryService.getMyGalleryList2(memberId);

			model.addAttribute("meetList", mList);
			model.addAttribute("galleryList", gList);

			List<ClubVo> clubVos = clubService.getMemClub(memberId);

			String clubIdsString = clubVos.stream().map(clubVo -> String.valueOf(clubVo.getClubId()))
					.collect(Collectors.joining(","));
			System.out.println(clubIdsString);
			model.addAttribute("clubIdsString", clubIdsString);

			return "/member_diary/member_gallery";

		} else {
			// 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
			return "member/memberForm";
		}
	}
	
	
}
