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

	public void editwrite(NoticeBoardVO vo) {
		System.out.println("notice editwrite dao 확인");
		sql.insert("noticeboard.editwrite", vo);
		System.out.println("dao 넘어오는 값 확인 : " + vo);
	}

	public List<NoticeBoardVO> editlist() {
		System.out.println("notice editlist dao 확인");
		return sql.selectList("noticeboard.editlist");
	}

	
}