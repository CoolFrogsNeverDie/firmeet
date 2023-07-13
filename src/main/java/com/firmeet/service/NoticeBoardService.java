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

	public void editwrite(NoticeBoardVO vo) {
		System.out.println("notice write 확인");
		String Title = vo.getTitle();
		String boardContent = vo.getBoardContent();
		vo.setTitle(Title);
		vo.setBoardContent(boardContent);
		
		int aboardNo = vo.getAboardNo();
		
		System.out.println("넘어온 no 확인"+vo.getAboardNo());
		System.out.println("투표인서트확인"+aboardNo);
		System.out.println("투표인서트확인"+vo);
		
		//dao.editwrite(vo);
		
	}

	public NoticeBoardVO editlist(int aboardNo) {
		System.out.println("notice editlist 확인");
		return dao.editlist(aboardNo);
	}

	public NoticeBoardVO voteinsert(NoticeBoardVO vo) {
		System.out.println("service voteinsert 확인"+vo);
		dao.voteinsert(vo);
		System.out.println("service voteinsert 확인"+vo.getAboardNo());
		int aboardNo = vo.getAboardNo();
		System.out.println("service voteinsert 리스트 확인"+vo);
		NoticeBoardVO votevo = dao.votelist(aboardNo);
		return votevo;
	}


}