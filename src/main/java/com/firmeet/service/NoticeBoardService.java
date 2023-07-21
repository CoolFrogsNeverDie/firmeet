package com.firmeet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.NoticeBoardDAO;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.VoteResultVO;

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
		System.out.println("service editinsert getMemberId 확인"+vo.getMemberId());
		
		int aboardNo = vo.getAboardNo();
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());
		//여기서 안들어감
		dao.editwritevote(vo);
		System.out.println("service voteinsert 확인"+vo);
		System.out.println("service voteinsert getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service voteinsert getVoteNo 확인"+vo.getVoteNo());
		
		return aboardNo;
	}
	
	public NoticeBoardVO editlist(int aboardNo ) {
		System.out.println("notice editlist 확인");
		
		NoticeBoardVO vo = dao.editlist(aboardNo);
		
//		System.out.println("보트넘버확인"+vo.getVoteNo());
		
//		int voteNo = vo.getVoteNo();
//		VoteResultVO voteResultvo = dao.voteresult(voteNo);
//		System.out.println("확인확인"+voteResultvo);
//		System.out.println("vo.getVote1Cnt()"+voteResultvo.getVote1Cnt());
		
//		vo.setVote1Cnt(voteResultvo.getVote1Cnt());
//		vo.setVote2Cnt(voteResultvo.getVote2Cnt());
//		vo.setVote3Cnt(voteResultvo.getVote3Cnt());
//		vo.setVote4Cnt(voteResultvo.getVote4Cnt());
//		vo.setVote5Cnt(voteResultvo.getVote5Cnt());
		
		return vo;
		
	}
	

	public int editgroupwrite(NoticeBoardVO vo) {
		dao.editwrite(vo);
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getAboardNo());
		
		int aboardNo = vo.getAboardNo();
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());

		dao.editgroupwrite(vo);
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service editgroupwrite getMeetNo 확인"+vo.getMeetNo());
		
		return aboardNo;		
	}

	public NoticeBoardVO editlistgroup(int aboardNo) {
		System.out.println("notice editlistgroup 확인");
		return dao.editlistgroup(aboardNo);
	}
	
	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert 확인");
		dao.voteinsert(vo);
	}

	public NoticeBoardVO voteResult(int aboardNo) {
		System.out.println("notice editlist 확인");
		
		NoticeBoardVO vo = dao.editlist(aboardNo);
		
		System.out.println("보트넘버확인"+vo.getVoteNo());
		
		int voteNo = vo.getVoteNo();
		VoteResultVO voteResultvo = dao.voteresult(voteNo);
		System.out.println("확인확인"+voteResultvo);
		System.out.println("vo.getVote1Cnt()"+voteResultvo.getVote1Cnt());
		
		vo.setVote1Cnt(voteResultvo.getVote1Cnt());
		vo.setVote2Cnt(voteResultvo.getVote2Cnt());
		vo.setVote3Cnt(voteResultvo.getVote3Cnt());
		vo.setVote4Cnt(voteResultvo.getVote4Cnt());
		vo.setVote5Cnt(voteResultvo.getVote5Cnt());
		
		return vo;
	}

}