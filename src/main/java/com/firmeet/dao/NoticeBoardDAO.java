package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.AreplyVO;
import com.firmeet.vo.BoardVO;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.ReplyVO;
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
	
	public NoticeBoardVO editlist(NoticeBoardVO vo) {
		System.out.println("notice editlist dao 확인"+vo);
		return sql.selectOne("noticeboard.editlist", vo);
	}
	
	public VoteResultVO voteresult(NoticeBoardVO vo) {
		System.out.println("notice voteresult dao 확인"+vo);
		return sql.selectOne("noticeboard.voteresult", vo);
	}
	
//-----------------------------------------------------------------------------
	
	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert dao 확인"+vo);
		sql.insert("noticeboard.voteinsert",vo);
	}
	
//-----------------------------------------------------------------------------
	
	public NoticeBoardVO editlistgroup(NoticeBoardVO vo) {
		System.out.println("notice editlistgroup dao 확인"+vo);
		return sql.selectOne("noticeboard.editlistgroup", vo);
	}

	public void hits(NoticeBoardVO vo) {
		sql.update("noticeboard.hits", vo.getAboardNo());
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

	public NoticeBoardVO findHeart(NoticeBoardVO vo) {
		return sql.selectOne("noticeboard.findHeart",vo);
	}
	
	public int insertHeart(NoticeBoardVO vo) {
		return sql.insert("noticeboard.insertHeart", vo);
	}

	public void deleteHeart(NoticeBoardVO vo) {
		sql.delete("noticeboard.deleteHeart",vo);
		
	}
	
	public List<AreplyVO> getBoardComment(NoticeBoardVO vo) {
		return sql.selectList("noticeboard.getComment",vo);
	}
	
}