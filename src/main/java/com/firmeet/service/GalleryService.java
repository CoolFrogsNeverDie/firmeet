package com.firmeet.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.eclipse.jdt.internal.compiler.lookup.TypeConstants.DangerousMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.dao.GalleryDao;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.GalleryLikeVo;
import com.firmeet.vo.GalleryVo;
import com.firmeet.vo.MeetVo;
import com.firmeet.vo.MemberVo;

@Service
public class GalleryService {

	@Autowired
	private ClubService clubService;

	@Autowired
	private GalleryDao galleryDao;

	private String saveDir = "C:\\firmeet\\upload\\gallery";

	// 갤러리 업로드 폼 모임 리스트
	public MeetVo getMeetA(int meetNo) {
		System.out.println("GalleryService getMeetA 확인");
		MeetVo sList = galleryDao.getMeetA(meetNo);
		return sList;
	}

	// 일정 목록 조회
	public List<MeetVo> getMeet(int meetMon) {
		System.out.println("GalleryService getMeet 확인");
		List<MeetVo> sList = galleryDao.getMeet(meetMon);
		return sList;
	}

	// 일정 월별 출력
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
	public void upload(int clubId, int galleryNo, MultipartFile file, String memberId) {
		System.out.println("GalleryService upload 확인");

		// 파일 업로드 처리
		if (file != null && !file.isEmpty() && file.getOriginalFilename() != null
				&& !file.getOriginalFilename().isEmpty()) {
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
				GalleryImgVo gImgVo = new GalleryImgVo(0, galleryNo, orgName, saveName, fileSize, filePath, "", clubId, memberId);
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

	//모임 이름 가져오기
	public List<MeetVo> getMeetName(int year, int month) {
		System.out.println("GalleryService getMeetImg 확인");
		List<MeetVo> gImgVos = galleryDao.getMeetName(year, month);
		return gImgVos;
	}

	//전체 이미지 가져오기
	public List<GalleryImgVo> getGalleryListAll(int clubId) {
		System.out.println("GalleryService getGalleryListAll 확인");
		List<GalleryImgVo> gImgVos = galleryDao.getGalleryListAll(clubId);
		return gImgVos;
	}

	//나의 이미지 가져오기
	public List<MeetVo> getMyGalleryList(String memberId) {
		System.out.println("GalleryService getMyGalleryList 확인");
		List<ClubVo> clubVos = clubService.getMemClub(memberId);
		String clubIdsString = clubVos.stream().map(clubVo -> String.valueOf(clubVo.getClubId()))
				.collect(Collectors.joining(","));
		List<MeetVo> mList = new ArrayList<>();

		for (ClubVo clubVo : clubVos) {
			int clubId = clubVo.getClubId();
			String clubName = clubVo.getClubName();

			List<MeetVo> gMeetVos = getMeetMon(clubId);

			for (MeetVo meetVo : gMeetVos) {
				meetVo.setMeetName(clubName);
			}

			mList.addAll(gMeetVos);
		}

		return mList;
	}

	//나의 이미지 가져오기 2
	public List<GalleryImgVo> getMyGalleryList2(String memberId) {
		System.out.println("GalleryService getMyGalleryList2 확인");
		List<ClubVo> clubVos = clubService.getMemClub(memberId);
		String clubIdsString = clubVos.stream().map(clubVo -> String.valueOf(clubVo.getClubId()))
				.collect(Collectors.joining(","));
		List<GalleryImgVo> gList = new ArrayList<>();

		for (ClubVo clubVo : clubVos) {
			int clubId = clubVo.getClubId();
			String clubName = clubVo.getClubName();

			List<GalleryImgVo> gImgVos = galleryDao.getGalleryListAll(clubId);

			gList.addAll(gImgVos);
		}

		return gList;
	}
	//이 친구가 좋아요를 눌렀는지
	public boolean checkLike(int imageNo, String memberId) {
		System.out.println("GalleryService checkLike 확인");
		boolean result = galleryDao.checkLike(imageNo, memberId);
		
		return result;
	}
	//좋아요
	public void updateLikeStatus(int imgNo, int likeCnt, String memberId) {
		galleryDao.updateImg(imgNo,memberId);
		galleryDao.updateCnt(imgNo,likeCnt);
	}
	//좋아요 취서
	public void deleteLikeStatus(int imgNo, int likeCnt, String memberId) {
		galleryDao.deleteLike(imgNo,memberId);
		galleryDao.updateCnt(imgNo,likeCnt);
	}
	//이미지 삭제
	public void deleteImg(int imgno) {
		//이미지삭제
		galleryDao.deleteImg(imgno);
		//이미지가 가지고 있는 좋아요 리스트삭제
		galleryDao.deleteImgLike(imgno);
	}

	//이미지 주인찾기
	public MemberVo checkmemberId(String memberId) {
		MemberVo memberVo =galleryDao.checkmemberId(memberId);
		return memberVo;
	}

}
