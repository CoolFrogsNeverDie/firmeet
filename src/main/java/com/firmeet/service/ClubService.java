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

import com.firmeet.dao.ClubDao;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubMemVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.TagVo;

@Service
public class ClubService {

	@Autowired
	private ClubDao clubDao;	
	
	// 클럽 생성 메서드
	public void make(ClubVo clubVo , MemberVo memberVo, MultipartFile[] files) {
		System.out.println("ClubService.make()");
		System.out.println(clubVo);
		
		// 파일 복사 및 정보 추출
		String img2 = clubImgUpload(files[0]);
		String img1 = clubImgUpload(files[1]);
		
		// 클럽정보에 파일정보 세팅
		clubVo.setImg2(img2);
		clubVo.setImg1(img1);
		
		
		clubDao.insertClub(clubVo);
		
		System.out.println("클럽 아이디  확인 " + clubVo.getClubId());
		
		for(int i=0; i<clubVo.tagNo.length;i++) {
			TagVo tagVo = new TagVo();
			tagVo.setClubId( clubVo.getClubId());
			tagVo.setTagNo(clubVo.tagNo[i]);
			clubDao.insertClubTag(tagVo);
		}
		
		CategoryVo cateVo = new CategoryVo();
		cateVo.setClubId(clubVo.getClubId());
		cateVo.setCateNo(clubVo.getCateNo());
		clubDao.insertClubCate(cateVo);
		
		ClubMemVo clubMemVo = new ClubMemVo();
		clubMemVo.setClubId(clubVo.getClubId());
		clubMemVo.setMemberId(memberVo.getMemberId());
		System.out.println(clubMemVo);
		clubDao.insertAdmin(clubMemVo);
		
		
		}
	
	// 클럽 목록 조회 메서드
	public List<ClubVo> clubList(int clubId) {
		List<ClubVo> clubVo = clubDao.clubList(clubId);
		return clubVo;
	}
	public ClubVo clubInfo(int clubId) {
		ClubVo clubVo = clubDao.clubInfo(clubId);
		return clubVo;
	}
	
	// 클럽 가입 처리 메서드
	public void clubJoin(ClubMemVo clubMemVo){
		 clubDao.clubJoinMem(clubMemVo);
	}

	// 회원이 가입한 클럽 목록 조회 메서드
	public List<ClubVo> getMemClub(String memberId) {
		List<ClubVo> clubVos = clubDao.getMemClub(memberId);
		
		return clubVos;
	}
	
	
	// 클럽 관리자 권한 설정 메서드
	public void adminMem(String id) {
		System.out.println("ClubService.adminMem");
	}
	
	// 클럽 정보 조회 메서드
	/*클럽 dao에서 호출 중*/
	public ClubVo getClubVo(int clubId) {
		ClubVo clubVo = clubDao.getClubVo(clubId);
		return clubVo;
	}
	
	// 태그 정보 조회 메서드
	public TagVo selectTag(int tagNo) {
		TagVo selectedTag = clubDao.selectTag(tagNo);
		
		return selectedTag;
	}
	
	// 클럽 멤버 레벨 확인 메서드
	public ClubVo checkMemLevel(String memberId, int clubId) {
		
		ClubVo checkMemLevel = clubDao.checkMemLevel(memberId,clubId);
		
		return checkMemLevel;
	}
	
    // 클럽 이미지 업로드 메서드
	public String clubImgUpload(MultipartFile file) {
		String saveDir = "C:\\firmeet\\upload";

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

		return saveName;
	}
	
}

