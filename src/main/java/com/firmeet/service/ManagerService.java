package com.firmeet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.MemberDao;
import com.firmeet.vo.ClubVo;

@Service
public class ManagerService {

		@Autowired
		MemberDao memberDAO;
	
	
	public int joinRequest(ClubVo clubVO) {
		int result = -99;
		int memLevel =  clubVO.getMemlevel();
		
		System.out.println("넘어온 값의 memLevel 확인(승인 거절 여부)  " + memLevel);
		
		//현재 클럽 인원 재확인하는 로직 필요함
		
		 switch(memLevel) {
		 
		 case 2: memberDAO.updateMemLevel(clubVO);
		 		 result = 1;
		 		 break;
		 case -99:memberDAO.deleteClubMem(clubVO);
		 		 result = 0;
		 		 break;
		 }
		return result;
	}
	
	
}
