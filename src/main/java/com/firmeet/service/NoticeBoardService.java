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
	/*
		String voteTitle = vo.getVoteTitle();
		String vote1 = vo.getVote1();
		String vote2 = vo.getVote2();
		String vote3 = vo.getVote3();
		String vote4 = vo.getVote4();
		String vote5 = vo.getVote5();
		int totalNum = vo.getTotalNum();
		
		vo.setVoteTitle(voteTitle);
		vo.setVote1(vote1);
		vo.setVote2(vote2);
		vo.setVote3(vote3);
		vo.setVote4(vote4);
		vo.setVote5(vote5);
		vo.setTotalNum(totalNum);
	*/
		vo.setTitle(Title);
		vo.setBoardContent(boardContent);
		
		dao.editwrite(vo);
		
	}

	public NoticeBoardVO editlist(int aboardNo) {
		System.out.println("notice editlist 확인");
		return dao.editlist(aboardNo);
	}


}