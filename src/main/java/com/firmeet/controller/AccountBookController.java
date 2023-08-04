package com.firmeet.controller;

import java.util.List;

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
import com.firmeet.service.AccountBookService;
import com.firmeet.service.ClubService;
import com.firmeet.vo.AccountBookVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.ScheduleVO;

@Controller
@RequestMapping("/accountBook")
public class AccountBookController {

	@Autowired
	private AccountBookService accountBookService;
	@Autowired
	private ClubService clubService;

	/**
	 * 회계장부 메인 페이지 조회
	 */
	@RequestMapping(value = "/main/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String accountbookMain(@PathVariable("clubId") int clubId, Model model, HttpSession session) {
		// 현재 로그인한 회원 정보를 세션에서 가져옵니다.
		MemberVo member = (MemberVo) session.getAttribute("member");

		String memberId = null;

		if (member != null) {
			memberId = member.getMemberId();
			System.out.println(memberId); // memberId 값 출력;

			// 클럽과 회원의 관계 정보를 가져옵니다.
			ClubVo club = clubService.checkMemLevel(memberId, clubId);
			model.addAttribute("club", club);

			List<AccountBookVo> aList = accountBookService.getList(clubId);

			model.addAttribute("accountList", aList);

			return "/accountbook/accountbook";

		} else {
			// 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
			return "member/memberForm";
		}
	}

	/**
	 * 회계장부 업로드 폼 페이지 조회
	 */
	@RequestMapping(value = "/uploadform/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public String accountbookUploadform(@PathVariable("clubId") int clubId, Model model, HttpSession session) {
		// 현재 로그인한 회원 정보를 세션에서 가져옵니다.
		MemberVo member = (MemberVo) session.getAttribute("member");

		String memberId = null;

		if (member != null) {
			memberId = member.getMemberId();
			System.out.println(memberId); // memberId 값 출력;

			// 클럽과 회원의 관계 정보를 가져옵니다.
			ClubVo club = clubService.checkMemLevel(memberId, clubId);
			model.addAttribute("club", club);

			List<ScheduleVO> sList = accountBookService.getMeet(clubId);

			model.addAttribute("meetList", sList);
			return "/accountbook/accountbookform";

		} else {
			// 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
			return "member/memberForm";
		}
	}

	/**
	 * 회계 데이터 업로드
	 */
	@RequestMapping(value = "/upload", method = { RequestMethod.GET, RequestMethod.POST })
	public String accountbookUpload(@RequestParam("clubId") int clubId,
			@RequestParam(name = "incomeExpense") String incomeExpense, @RequestParam("meet") int meet,
			@RequestParam("category") String category, @RequestParam("amount") int amount,
			@RequestParam("memberId") String memberId, @RequestParam("purpose") String purpose,
			@RequestParam("uploadPicture") MultipartFile file) {
		
		System.out.println("accountbookUpload 확인");
		System.out.println("clubId : " + clubId);
		System.out.println("incomeExpense : " + incomeExpense);
		System.out.println("meet : " + meet);
		System.out.println("category : " + category);
		System.out.println("amount : " + amount);

		AccountBookVo aBookVo = new AccountBookVo(0, clubId, meet, memberId, amount, "", category, purpose,
				incomeExpense, "", 0);

		System.out.println(aBookVo);

		accountBookService.upload(aBookVo, file);

		return "redirect:/accountBook/main/" + clubId;
	}

	/**
	 * 회계 데이터 검색
	 */
	@ResponseBody
	@RequestMapping(value = "/search/{clubId}", method = { RequestMethod.GET, RequestMethod.POST })
	public List<AccountBookVo> searchAccountBook(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("searchText") String searchText,
			@PathVariable("clubId") int clubId) {
		List<AccountBookVo> searchResult = accountBookService.search(clubId, startDate, endDate, searchText);
		return searchResult;
	}

	/*-------------------------------------마이겔러리---------------------------- */

	/**
	 * 마이겔러리 - 회계장부 메인 페이지 조회
	 */
	@RequestMapping(value = "/member/main/{memberId}", method = { RequestMethod.GET,RequestMethod.POST})
	public String myAccountbookMain(@PathVariable("memberId") String memberId, Model model,HttpSession session) {
		// 현재 로그인한 회원 정보를 세션에서 가져옵니다.
		MemberVo member = (MemberVo) session.getAttribute("member");

		if (member != null) {
			System.out.println(memberId); // memberId 값 출력;

			List<AccountBookVo> aList = accountBookService.getMyList(memberId);

			model.addAttribute("accountList", aList);

			return "/member_diary/member_accountbook";

		} else {
			// 회원이 로그인하지 않은 상태라면 로그인 페이지로 이동합니다.
			return "member/memberForm";
		}
	}

}
