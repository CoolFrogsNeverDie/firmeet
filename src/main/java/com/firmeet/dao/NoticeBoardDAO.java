package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.VoteResultVO;

@Repository
public class NoticeBoardDAO {

	@Autowired
	private SqlSession sql;

	public List<NoticeBoardVO> noticelist() {
		System.out.println("notice noticelist dao  확인");
		return sql.selectList("noticeboard.noticelist");
	}
	
//-----------------------------------------------------------------------------	

	public int editwrite(NoticeBoardVO vo) {
		System.out.println("notice editwrite dao 확인");
		int aboardNo = sql.insert("noticeboard.editwrite", vo);
		System.out.println("dao editwrite 넘어오는 값 확인 : " + vo);
		System.out.println("dao editwrite 넘어오는 no 확인 : " + vo.getAboardNo());
		return aboardNo;
	}

	public int editwritevote(NoticeBoardVO vo) {
		System.out.println("dao editwritevote"+vo);
		//여기서 안들어감
		int voteNo = sql.insert("noticeboard.editwritevote", vo);
		System.out.println("dao editwritevote 넘어오는 값 확인 : " + vo);
		System.out.println("dao editwritevote 넘어오는 값 확인 : " + vo.getVoteNo());
		return voteNo;
	}
	
//---------------------------
	
	public int editgroupwrite(NoticeBoardVO vo) {
		System.out.println("dao editgroupwrite"+vo);

		int meetNo = sql.insert("noticeboard.editgroupwrite", vo);
		System.out.println("dao editgroupwrite 넘어오는 값 확인 : " + vo);
		System.out.println("dao editgroupwrite 넘어오는 값 확인 : " + vo.getMeetNo());
		return meetNo;		
	}

//-----------------------------------------------------------------------------
	
	public NoticeBoardVO editlist(int aboardNo) {
		System.out.println("notice editlist dao 확인"+aboardNo);
		return sql.selectOne("noticeboard.editlist", aboardNo);
	}
	
	public VoteResultVO voteresult(int voteNo) {
		System.out.println("notice voteresult dao 확인"+voteNo);
		return sql.selectOne("noticeboard.voteresult", voteNo);
	}
	
//-----------------------------------------------------------------------------
	
	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert dao 확인"+vo);
		sql.insert("noticeboard.voteinsert",vo);
	}
	
//-----------------------------------------------------------------------------
	
	public NoticeBoardVO editlistgroup(int aboardNo) {
		System.out.println("notice editlistgroup dao 확인"+aboardNo);
		return sql.selectOne("noticeboard.editlistgroup", aboardNo);
	}

	public void hits(int aboardNo) {
		sql.update("noticeboard.hits", aboardNo);
	}

	public void payinsert(NoticeBoardVO vo) {
		System.out.println("notice payinsert dao 확인"+vo);
		sql.insert("noticeboard.payinsert",vo);
	}
	
	public NoticeBoardVO payresult(NoticeBoardVO vo) {
		System.out.println("notice payresult dao 확인=====================================");
		System.out.println("payresult dao "+vo);
		return sql.selectOne("noticeboard.payresult", vo);
	}

	public int paycount(NoticeBoardVO noticeBoardVO) {
		System.out.println("notice paycount dao 확인");
		return sql.update("noticeboard.paycount", noticeBoardVO);
	}
/*
	public NoticeBoardVO findHeart(Map<String, Object> map) {
		System.out.println("notice findHeart dao 확인");
		return sql.selectOne("noticeboard.findHeart",map);
	}
*/
	public NoticeBoardVO findHeart(NoticeBoardVO vo) {
		return sql.selectOne("noticeboard.findHeart",vo);
	}
	
	public int insertHeart(NoticeBoardVO vo) {
		return sql.insert("noticeboard.insertHeart", vo);
	}

	public void deleteHeart(NoticeBoardVO vo) {
		sql.delete("noticeboard.deleteHeart",vo);
		
	}
}