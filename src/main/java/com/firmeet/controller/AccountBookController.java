package com.firmeet.controller;

import java.util.List;

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
import com.firmeet.vo.ScheduleVO;

@Controller
@RequestMapping("/accountBook")
public class AccountBookController {

	@Autowired
	private AccountBookService accountBookService;
	@Autowired
	private ClubService clubService;
	
	@RequestMapping(value = "/main/{clubId}", method = {RequestMethod.GET, RequestMethod.POST})
	public String accountbookMain(@PathVariable("clubId") int clubId, Model model) {
		// 각주 추가: 회계장부 메인 페이지 조회
		System.out.println("accountbookMain 확인");
		
		ClubVo clubVo = clubService.getClubVo(clubId);
		model.addAttribute("club", clubVo);
		
		List<AccountBookVo> aList = accountBookService.getList(clubId);
		
		model.addAttribute("accountList",aList);
		
		return "/accountbook/accountbook";
	}
	
	@RequestMapping(value ="/uploadform/{clubId}",method = {RequestMethod.GET, RequestMethod.POST})
	public String accountbookUploadform(@PathVariable("clubId") int clubId, Model model) {
		// 각주 추가: 회계장부 업로드 폼 페이지 조회
		System.out.println("accountbookUploadform 확인");
		
		List<ScheduleVO> sList = accountBookService.getMeet(clubId);
		
		ClubVo clubVo = clubService.getClubVo(clubId);
		model.addAttribute("club", clubVo);
		
		model.addAttribute("meetList",sList);
		
		return "/accountbook/accountbookform";
	}
	
	@RequestMapping(value = "/upload",method = {RequestMethod.GET, RequestMethod.POST})
	public String accountbookUpload(@RequestParam("clubId") int clubId,
									@RequestParam("incomeExpense") String incomeExpense,
									@RequestParam("meet") int meet,
									@RequestParam("category") String category,
									@RequestParam("amount") int amount,
									@RequestParam("memberId") String memberId,
									@RequestParam("purpose") String purpose,
									@RequestParam("uploadPicture") MultipartFile file) {
		// 각주 추가: 회계 데이터 업로드
		System.out.println("accountbookUpload 확인");
		
		System.out.println("clubId : "+clubId);
		System.out.println("incomeExpense : "+incomeExpense);
		System.out.println("meet : "+meet);
		System.out.println("category : "+category);
		System.out.println("amount : "+amount);
		
		AccountBookVo aBookVo = new AccountBookVo(0,clubId,meet,memberId,amount,"",category,purpose,incomeExpense,"",0);
		
		System.out.println(aBookVo);
		
		accountBookService.upload(aBookVo,file);
		
		return "redirect:/accountBook/main/"+clubId;
	}
	
	@ResponseBody
	@RequestMapping(value = "/search/{clubId}", method = {RequestMethod.GET, RequestMethod.POST})
	public List<AccountBookVo> searchAccountBook(@RequestParam("startDate") String startDate,
	                                             @RequestParam("endDate") String endDate,
	                                             @RequestParam("searchText") String searchText,
	                                             @PathVariable("clubId") int clubId) {
		// 각주 추가: 회계 데이터 검색
	    List<AccountBookVo> searchResult = accountBookService.search(clubId, startDate, endDate, searchText);
	    return searchResult;
	}
}
