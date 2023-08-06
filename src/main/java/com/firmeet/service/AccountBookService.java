package com.firmeet.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.dao.AccountBookDao;
import com.firmeet.vo.AccountBookVo;
import com.firmeet.vo.ScheduleVO;

@Service
public class AccountBookService {

	String saveDir = "C:\\firmeet\\upload\\account";
	
	@Autowired
	private AccountBookDao accountBookDao;

	/**
	 * 클럽 ID에 해당하는 회계 리스트 조회
	 */
	public List<AccountBookVo> getList(int clubId) {
		System.out.println("AccountBookService getList 확인");
		List<AccountBookVo> aList = accountBookDao.getList(clubId);
		
		for (AccountBookVo accountBookVo : aList) {
			System.out.println(accountBookVo.getMemberId()); // getMemberId 값 출력;
			System.out.println(accountBookVo.getMeetNo()); // getMemberId 값 출력;
			
			accountBookVo.setMemberName(accountBookDao.setMemberName(accountBookVo.getMemberId()));
			accountBookVo.setMeetName(accountBookDao.setMeetName(accountBookVo.getMeetNo()));
		}
		
		return aList;
	}

	/**
	 * 클럽 ID에 해당하는 스케줄 리스트 조회
	 */
	public List<ScheduleVO> getMeet(int clubId) {
		System.out.println("AccountBookService getMeet 확인");
		List<ScheduleVO> sList = accountBookDao.getMeet(clubId);
		return sList;
	}
	
	/**
	 * 회계 데이터 업로드
	 */
	public void upload(AccountBookVo aBookVo, MultipartFile file) {
		System.out.println("AccountBookService upload 확인");
	    
	    if (file != null && !file.isEmpty() && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
	        // 원파일 이름
	        String orgName = file.getOriginalFilename();
	        System.out.println("orgName : " + orgName);

	        // 확장자
	        String exName = orgName.substring(orgName.lastIndexOf("."));
	        System.out.println("exName : " + exName);

	        // 저장파일 이름
	        String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
	        System.out.println("saveName : " + saveName);

	        // 파일패스
	        String filePath = saveDir + File.separator + saveName;
	        System.out.println("filePath : " + filePath);

	        // 파일사이즈
	        long fileSize = file.getSize();
	        System.out.println("fileSize : " + fileSize);

	        // 파일 업로드(하드디스크에 저장)
	        try {
	            byte[] fileData = file.getBytes();
	            OutputStream out = new FileOutputStream(filePath);
	            BufferedOutputStream bout = new BufferedOutputStream(out);
	            bout.write(fileData);
	            bout.close();
	            
	            aBookVo.setReceipt(saveName);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    System.out.println(aBookVo);
	    
	    accountBookDao.upload(aBookVo);
	}

	/**
	 * 회계 데이터 검색
	 */
	public List<AccountBookVo> search(int clubId, String startDate, String endDate, String searchText) {
		System.out.println("AccountBookService search 확인");
		List<AccountBookVo> searchResult = accountBookDao.search(clubId, startDate, endDate, searchText);
		System.out.println(clubId);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(searchText);
		
		for (AccountBookVo accountBookVo : searchResult) {
			System.out.println(accountBookVo.getMemberId()); // getMemberId 값 출력;
			System.out.println(accountBookVo.getMeetNo()); // getMemberId 값 출력;
			
			accountBookVo.setMemberName(accountBookDao.setMemberName(accountBookVo.getMemberId()));
			accountBookVo.setMeetName(accountBookDao.setMeetName(accountBookVo.getMeetNo()));
		}
		
		return searchResult;
	}

	/*-------------------------------------마이겔러리---------------------------- */

	/**
	 * 마이겔러리 - 회계장부 메인 페이지 조회
	 */
	public List<AccountBookVo> getMyList(String memberId) {
		System.out.println("AccountBookService getMyList 확인");
		List<AccountBookVo> aList = accountBookDao.getMyList(memberId);
		
		for (AccountBookVo accountBookVo : aList) {
			System.out.println(accountBookVo.getMemberId()); // getMemberId 값 출력;
			System.out.println(accountBookVo.getMeetNo()); // getMemberId 값 출력;
			
			accountBookVo.setMemberName(accountBookDao.setMemberName(accountBookVo.getMemberId()));
			accountBookVo.setMeetName(accountBookDao.setMeetName(accountBookVo.getMeetNo()));
		}
		
		return aList;
	}
}
