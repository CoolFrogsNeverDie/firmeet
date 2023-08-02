package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.AreplyVO;
import com.firmeet.vo.GalleryVo;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.VoteResultVO;

@Repository
public class NoticeBoardDAO {

	@Autowired
	private SqlSession sql;

	public List<NoticeBoardVO> noticelist(String keyword) {
		System.out.println("notice noticelist dao  확인");
		return sql.selectList("noticeboard.noticelist", keyword);
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

	public List<AreplyVO> getBoardComment(NoticeBoardVO vo) {
		return sql.selectList("noticeboard.getComment",vo);
	}
	
	public int likeCancle(NoticeBoardVO vo) {
		System.out.println("라이크캔슬");
		return sql.delete("noticeboard.deletelike",vo);
	}

	public void insertLike(NoticeBoardVO vo) {
		System.out.println("라이크 인서트");
		sql.insert("noticeboard.insertLike",vo);
	}

	public NoticeBoardVO getLike(NoticeBoardVO vo) {
		System.out.println("라이크셀렉트");
		return sql.selectOne("noticeboard.getLike", vo);
	}
	
	public void galleryinsert(NoticeBoardVO vo) {
		System.out.println("dao galleryinsert"+vo);
		
		sql.insert("noticeboard.galleryinsert", vo);
		System.out.println("dao galleryinsert 넘어오는 값 확인 : " + vo);
		System.out.println("dao galleryinsert 넘어오는 값 확인 : " + vo.getMeetNo());
		System.out.println("dao galleryinsert 넘어오는 값 확인 : " + vo.getMemberId());
		System.out.println("dao galleryinsert 넘어오는 값 확인 : " + vo.getGalleryNo()+vo.getId());
	}

	public void aupdate(NoticeBoardVO vo) {
		sql.update("noticeboard.aupdate",vo);
	}


}