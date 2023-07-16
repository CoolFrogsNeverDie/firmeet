package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.NoticeBoardVO;

@Repository
public class NoticeBoardDAO {

	@Autowired
	private SqlSession sql;

	public List<NoticeBoardVO> noticelist() {
		System.out.println("notice noticelist dao  확인");
		return sql.selectList("noticeboard.noticelist");
	}

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

	public NoticeBoardVO editlist(int aboardNo) {
		System.out.println("notice editlist dao 확인"+aboardNo);
		return sql.selectOne("noticeboard.editlist", aboardNo);
	}

	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert dao 확인"+vo);
		sql.insert("noticeboard.voteinsert",vo);
	}

	public int editgroupwrite(NoticeBoardVO vo) {
		System.out.println("dao editgroupwrite"+vo);

		int meetNo = sql.insert("noticeboard.editgroupwrite", vo);
		System.out.println("dao editgroupwrite 넘어오는 값 확인 : " + vo);
		System.out.println("dao editgroupwrite 넘어오는 값 확인 : " + vo.getMeetNo());
		return meetNo;		
	}

	public NoticeBoardVO editlistgroup(int aboardNo) {
		System.out.println("notice editlistgroup dao 확인"+aboardNo);
		return sql.selectOne("noticeboard.editlistgroup", aboardNo);
	}

//	public List<NoticeBoardVO> votecount() {
//		System.out.println("notice count dao 확인");
//		return sql.selectList("noticeboard.votecount");
//	}

//	public int editgroupwrite(NoticeBoardVO vo) {
//		System.out.println("dao editgroupwrite"+vo);
		//여기서 안들어감
//		int meetNo = sql.insert("noticeboard.editgroupwrite", vo);
//		System.out.println("dao editgroupwrite 넘어오는 값 확인 : " + vo);
//		System.out.println("dao editgroupwrite 넘어오는 값 확인 : " + vo.getMeetNo());
//		return meetNo;
//	}

}