package com.firmeet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.ClubDao;
import com.firmeet.dao.MemberDao;
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
		
		//현재 클럽 인원 재확인하는 로직 필요함
		
		if ( clubDAO.checkPrenum(clubVO) ==1 ) {
		 switch(memLevel) {
		 
		 case 2: memberDAO.updateMemLevel(clubVO);
		 		 result = 1;
		 		 break;
		 case -99:memberDAO.deleteClubMem(clubVO);
		 		 result = 0;
		 		 break;
		
		 	}
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
}
