package com.firmeet.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.dao.UploadDao;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.UploadVo;

@Service
public class UploadService {

	private UploadDao uploadDao;

	private String saveDir = "C:\\firmeet\\upload";

	public String clubImgUpload(MultipartFile file, UploadVo uploadVo, ClubVo clubVo) {

		System.out.println("UploadService.clubImgUpload()");

		// 원파일 이름
		String orgname = file.getOriginalFilename();
		System.out.println("orgName : " + orgname);

		// 확장자
		String exName = orgname.substring(orgname.lastIndexOf("."));
		System.out.println(exName);

		// 저장파일 이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("saveName: " + saveName);

		// 파일패스
		String filePath = saveDir + "\\clubImg\\" + saveName;
		System.out.println("filePath: " + filePath);

		// 파일 사이즈

		long fileSize = file.getSize();
		System.out.println("fileSize: " + fileSize);

		// 파일 업로드

		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			bout.write(fileData);

			if (bout != null) {
				bout.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		uploadVo.setOriName(orgname);
		uploadVo.setSaveName(saveName);
		uploadVo.setSize(fileSize);
		uploadVo.setPath(filePath);

		if (clubVo.img1 != null) {
			clubVo.setImg1(saveName);
		} else if (clubVo.img2 != null) {
			clubVo.setImg2(saveName);
		}

		uploadDao.insert(uploadVo);
		return saveName;

	}
}
