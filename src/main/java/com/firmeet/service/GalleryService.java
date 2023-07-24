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

import com.firmeet.dao.GalleryDao;
import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.GalleryVo;
import com.firmeet.vo.MeetVo;

@Service
public class GalleryService {

    @Autowired
    private GalleryDao galleryDao;
    private String saveDir = "C:\\Users\\cheoho-hi\\git\\firmeet\\src\\main\\webapp\\assets\\images\\galleryImg";

	public List<MeetVo> getMeetA(int clubId) {
		System.out.println("GalleryService getMeetA 확인");
        List<MeetVo> sList = galleryDao.getMeetA(clubId);
		return sList;
	}
    
    // 일정 목록 조회
    public List<MeetVo> getMeet(int meetMon) {
    	System.out.println("GalleryService getMeet 확인");
        List<MeetVo> sList = galleryDao.getMeet(meetMon);
        return sList;
    }
    
    //일정 월별 출력
	public List<MeetVo> getMeetMon(int clubId) {
		System.out.println("GalleryService getMeetMon 확인");
		 List<MeetVo> sList = galleryDao.getMeetMon(clubId);
		return sList;
	}

    // 갤러리 번호 조회
    public int getGalleryNo(int meet) {
        System.out.println("GalleryService getGalleryNo 확인");
        int galleryNo = galleryDao.getGalleryNo(meet);
        return galleryNo;
    }

    // 갤러리 이미지 업로드
    public void upload(int clubId, int galleryNo, MultipartFile file) {
        System.out.println("GalleryService upload 확인");
        
        // 파일 업로드 처리
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

                // 갤러리 이미지 정보 저장
                GalleryImgVo gImgVo = new GalleryImgVo(0, galleryNo, orgName, saveName, fileSize, filePath, "");
                System.out.println(gImgVo);

                galleryDao.upload(gImgVo);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // 갤러리 목록 조회
    public List<GalleryVo> getGalleryList(int clubId) {
        System.out.println("GalleryService getGalleryList 확인");
        List<GalleryVo> galleryVos = galleryDao.getGalleryList(clubId);
        return galleryVos;
    }

    // 갤러리 이미지 목록 조회
    public List<GalleryImgVo> getGalleryImg(int GalleryNo) {
        System.out.println("GalleryService getGalleryImg 확인");
        List<GalleryImgVo> gImgVos = galleryDao.getGalleryImg(GalleryNo);
        return gImgVos;
    }

	public List<MeetVo> getMeetName(int year, int month) {
		System.out.println("GalleryService getGalleryImg 확인");
		
		List<MeetVo> gImgVos = galleryDao.getMeetName(year,month);
		
		return gImgVos;
	}







}
