package com.firmeet.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.dao.ClubDao;
import com.firmeet.dao.MemberDao;
import com.firmeet.vo.ClubMemVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.QnaVO;
import com.firmeet.vo.TagVo;

@Service
public class ManagerService {

		@Autowired
		MemberDao memberDAO;
		@Autowired
		ClubDao clubDAO; 
	
	public int joinRequest(ClubVo clubVO) {
		int result = -99;
		int memLevel =  clubVO.getMemlevel();
		
		System.out.println("넘어온 값의 memLevel 확인(승인 거절 여부)  " + memLevel);
		System.out.println("체크  : " + clubDAO.checkPrenum(clubVO) +"레벨은?" +  memLevel);
		
		
		//만약 회원가입 가능한 상태면? 
		if ( clubDAO.checkPrenum(clubVO) ==1 && memLevel ==2 ) {
			memberDAO.updateMemLevel(clubVO); //memlevel update로 정식회원 등급으로 업데이트
			//해당 클럽의 prenum +1 업데이트
			memberDAO.plusClubPreNum(clubVO);
			result = 1;
		}else if(memLevel == -99) {
			memberDAO.deleteClubMem(clubVO); //대기 상태에서도 쫓아내기
			result = 0;
		}
		return result;
	}

	public List<MemberVo> getMemList(MemberVo memberVO) {
		
		
		List<MemberVo> memList = memberDAO.getClubMemList(memberVO);
		for(int i =0; i< memList.size(); i++) {
			System.out.println("돌아가나요? 이 for문이지?!");
			List<TagVo> tagList = memberDAO.getTagList(memList.get(i));
			memList.get(i).setTagList(tagList);
		}
		
		return memList; 
	}

	public boolean changeGrade(MemberVo memberVO) {
		boolean result = false;
		result = memberDAO.updateMemGrade(memberVO) >0? true: false;
		
		return result;
	}

	public boolean kickoutMem(ClubVo clubVO) {
		boolean result = false;
		result = memberDAO.deleteClubMem(clubVO) >0? true: false;
		System.out.println("마이너스 되고 있나요? " +  memberDAO.minusClubPreNum(clubVO));
		System.out.println("마이너스 되고 있나요? " +  result);
		return result;
	}

	public List<QnaVO> getClubQna(MemberVo memberVO) {
		List<QnaVO> qnaList = clubDAO.getClubQnaList(memberVO);
		return qnaList;
	}

	public boolean addQnaAnswer(QnaVO qnaVO) {
		boolean result = false;
		
		result = clubDAO.updateQnaAnswer(qnaVO)>0?true:false;
		
		return result;
	}
	
	//클럽 수정창을 만들기 위한 클럽 디테일한 정보 가져오는 메서드
	public ClubVo clubDeInfo(ClubVo club) {
		ClubVo clubVO = new ClubVo();
		
		clubVO = clubDAO.getClubDetailInfo(club);
		clubVO.setClubTagList(clubDAO.getTagList(club));
		System.out.println("넘어오는 최종 디테일 정보 확인 " + clubVO);
		
		return clubVO;
	}
	//클럽강퇴
	public boolean myClubDel(ClubMemVo clubVO) {
		boolean result = false;
		result = memberDAO.myClubDel(clubVO) >0? true: false;
		System.out.println("마이너스 되고 있나요? " +  result);
		
		return result;
	}
	
	public void updateClubInfo(ClubVo clubVO, MultipartFile[] files) {
		
		
		if(files[0].getOriginalFilename()!="") {
			clubVO.setImg1(uploadPic(files[0]));
		}
		if(files[1].getOriginalFilename() != "") {
			clubVO.setImg2(uploadPic(files[1]));
		}
		
		System.out.println("업데이트 전 객체 확인" + clubVO);	
		clubDAO.updateClubInfo(clubVO);
		clubDAO.updateCateNo(clubVO);
		clubDAO.resetClubTag(clubVO); //클럽 태그 삭제함
		clubDAO.resetClubColor(clubVO);
		clubDAO.insertClubColor(clubVO);
		int[] tagList = clubVO.getTagNo();
		TagVo tag = new TagVo();
		
		if(tagList != null) {
			tag.setClubId(clubVO.getClubId());
			for(int tagNo : tagList) {
				tag.setTagNo(tagNo);
				clubDAO.insertClubTag(tag);
			}
		}
		
	}
	
	
	
	private String uploadPic(MultipartFile file) {
		
		
		String saveDir ="C:\\firmeet\\upload\\club";
		
		String orgName = file.getOriginalFilename();		// 원파일 이름
		String exName = orgName.substring(orgName.lastIndexOf("."));		// 확장자
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;// 저장파일 이름
		String filePath = saveDir + "\\" + saveName;// 파일 패스
		Long fileSize = file.getSize();// 파일 사이즈
		
		try {
			file.transferTo(new File(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return saveName;
	}
	
}
