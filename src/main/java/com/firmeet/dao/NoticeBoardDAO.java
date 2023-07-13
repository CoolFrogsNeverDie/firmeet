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
		int count = sql.insert("noticeboard.editwrite", vo);
		System.out.println("dao 넘어오는 값 확인 : " + vo);
		return count;
	}

	public NoticeBoardVO editlist(int aboardNo) {
		System.out.println("notice editlist dao 확인");
		System.out.println("notice editlist dao 확인"+aboardNo);
		
		return sql.selectOne("noticeboard.editlist", aboardNo);
	}

	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("dao voteinsert"+vo);
		sql.insert("NoticeBoardVO.voteinsert", vo);
	}

	public NoticeBoardVO votelist(int aboardNo) {
		System.out.println("NoticeBoardVO 넘어오는 값 확인 : " + aboardNo);
		return sql.selectOne("NoticeBoardVO.votelist",aboardNo);
	}

	
}