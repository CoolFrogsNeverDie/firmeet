package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.NoticeGeneralVoteVO;

@Repository
public class NoticeBoardDAO {

	@Autowired
	private SqlSession sql;

	public List<NoticeBoardVO> noticelist() {
		System.out.println("notice noticelist dao  확인");
		return sql.selectList("noticeboard.noticelist");
	}

	public void editwrite(NoticeBoardVO vo) {
		System.out.println("notice editwrite dao 확인");
		sql.insert("noticeboard.editwrite", vo);
		System.out.println("dao 넘어오는 값 확인 : " + vo);
	}

	public NoticeBoardVO editlist(int aboardNo) {
		System.out.println("notice editlist dao 확인");
		System.out.println("notice editlist dao 확인"+aboardNo);
		
		return sql.selectOne("noticeboard.editlist", aboardNo);
	}

	public void voteinsert(NoticeGeneralVoteVO vo) {
		System.out.println("notice voteinsert dao 확인");
		sql.insert("noticegeneral.voteinsert", vo);
		System.out.println("dao 넘어오는 값 확인 : " + vo);
	}

	
}