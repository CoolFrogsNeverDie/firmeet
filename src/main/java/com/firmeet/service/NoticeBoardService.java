package com.firmeet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.NoticeBoardDAO;
import com.firmeet.vo.NoticeBoardVO;

@Service
public class NoticeBoardService {

	@Autowired
	private NoticeBoardDAO dao;

	public List<NoticeBoardVO> noticeList() {
		System.out.println("notice noticeList 확인");
		return dao.noticelist();
	}

	public int editwrite(NoticeBoardVO vo) {
		dao.editwrite(vo);
		System.out.println("service editinsert 확인"+vo);
		System.out.println("service editinsert getAboardNo 확인"+vo.getAboardNo());
		
		int aboardNo = vo.getAboardNo();
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());
		//여기서 안들어감
		dao.editwritevote(vo);
		System.out.println("service voteinsert 확인"+vo);
		System.out.println("service voteinsert getAboardNo 확인"+vo.getAboardNo());
		
		return aboardNo;
	}
	
	public NoticeBoardVO editlist(int aboardNo) {
		System.out.println("notice editlist 확인");
		return dao.editlist(aboardNo);
	}

	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert 확인");
		dao.voteinsert(vo);
	}


}