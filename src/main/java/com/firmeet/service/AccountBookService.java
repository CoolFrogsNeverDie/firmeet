package com.firmeet.service;

import java.io.BufferedOutputStream;
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
		System.out.println("AccountBookService getList 확인");
		List<AccountBookVo> aList = accountBookDao.getList(clubId);
		
		return aList;
	}

	public List<ScheduleVO> getMeet(int clubId) {
		System.out.println("AccountBookService getMeet 확인");
		List<ScheduleVO> sList =accountBookDao.getMeet(clubId);
		
		return sList;
	}
	
	// 파일 작성
	public void upload(AccountBookVo aBookVo, MultipartFile file) {
		System.out.println("AccountBookService upload 확인");
		System.out.println(file.getOriginalFilename());

		// 원파일 이름
		String orgName = file.getOriginalFilename();
		System.out.println("orgName : " + orgName);

		// 확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exName : " + exName);

		// 저장파일 이름
		String savaName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("savaName : " + savaName);

		// 파일패스
		String filePath = saveDir + "\\" + savaName;
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
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		aBookVo.setReceipt(savaName);
		System.out.println(aBookVo);
		
		accountBookDao.upload(aBookVo);
		
	}
	
}
