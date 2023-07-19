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

	String saveDir = "C:\\Users\\cheoho-hi\\git\\firmeet\\src\\main\\webapp\\assets\\images\\accountimg";
	
	@Autowired
	private AccountBookDao accountBookDao;

	public List<AccountBookVo> getList(int clubId) {
		// 각주 추가: 클럽 ID에 해당하는 회계 리스트 조회
		System.out.println("AccountBookService getList 확인");
		List<AccountBookVo> aList = accountBookDao.getList(clubId);
		
		return aList;
	}

	public List<ScheduleVO> getMeet(int clubId) {
		// 각주 추가: 클럽 ID에 해당하는 스케줄 리스트 조회
		System.out.println("AccountBookService getMeet 확인");
		List<ScheduleVO> sList = accountBookDao.getMeet(clubId);
		
		return sList;
	}
	
	// 파일 작성
	public void upload(AccountBookVo aBookVo, MultipartFile file) {
		// 각주 추가: 회계 데이터 업로드
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

	public List<AccountBookVo> search(int clubId, String startDate, String endDate, String searchText) {
		// 각주 추가: 회계 데이터 검색
		System.out.println("AccountBookService search 확인");

		
		List<AccountBookVo> searchResult = accountBookDao.search(clubId, startDate, endDate, searchText);
		
		return searchResult;
	}
}
