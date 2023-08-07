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
	
	/*가입 승인 처리*/
	public int joinRequest(ClubVo clubVO) {
		int result = -99;
		int memLevel =  clubVO.getMemlevel();
		
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
	
	/*가입요청한 멤버 리스트*/
	public List<MemberVo> getMemList(MemberVo memberVO) {
		System.out.println("getMemList()");
		
		List<MemberVo> memList = memberDAO.getClubMemList(memberVO);
		for(int i =0; i< memList.size(); i++) {
			System.out.println("돌아가나요? 이 for문이지?!");
			List<TagVo> tagList = memberDAO.getTagList(memList.get(i));
			memList.get(i).setTagList(tagList);
		}
		
		return memList; 
	}

	
	/*회원 등급 수정*/
	public boolean changeGrade(MemberVo memberVO) {
		System.out.println("changeGrade()");
		
		boolean result = false;
		result = memberDAO.updateMemGrade(memberVO) >0? true: false;
		
		return result;
	}
	
	
	/* 회원 강퇴*/
	public boolean kickoutMem(ClubVo clubVO) {
		System.out.println("kickoutMem()");
		boolean result = false;
		result = memberDAO.deleteClubMem(clubVO) >0? true: false;
		memberDAO.minusClubPreNum(clubVO);
		return result;
	}
	
	/*동호회 QNA 리스트*/
	public List<QnaVO> getClubQna(MemberVo memberVO) {
		System.out.println("getClubQna()");
		List<QnaVO> qnaList = clubDAO.getClubQnaList(memberVO);
		return qnaList;
	}

	/*동호회 QNA 답변 등록 */
	public boolean addQnaAnswer(QnaVO qnaVO) {
		System.out.println("addQnaAnswer()");
		boolean result = false;
		
		result = clubDAO.updateQnaAnswer(qnaVO)>0?true:false;
		
		return result;
	}
	
	/*클럽 수정창을 만들기 위한 클럽 디테일한 정보 가져오는 메서드*/
	public ClubVo clubDeInfo(ClubVo club) {
		System.out.println("clubDeInfo()");

		ClubVo clubVO = new ClubVo();
		
		clubVO = clubDAO.getClubDetailInfo(club);
		System.out.println("club" + clubVO);
		clubVO.setClubTagList(clubDAO.getTagList(club));
		
		return clubVO;
	}
	/*클럽 강퇴*/
	public boolean myClubDel(ClubMemVo clubVO) {
		System.out.println("myClubDel()");
		boolean result = false;
		result = memberDAO.myClubDel(clubVO) >0? true: false;
		
		return result;
	}
	
	/*클럽 정보 업데이트*/
	public void updateClubInfo(ClubVo clubVO, MultipartFile[] files) {
		System.out.println("updateClubInfo()");
		
		if(files[0].getOriginalFilename()!="") {
			clubVO.setImg1(uploadPic(files[0]));
		}
		if(files[1].getOriginalFilename() != "") {
			clubVO.setImg2(uploadPic(files[1]));
		}
		System.out.println("변경할 정보 확인 + clubVO" + clubVO);
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
