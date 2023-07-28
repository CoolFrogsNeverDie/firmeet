package com.firmeet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.AreplyVO;

@Repository
public class AreplyDAO {
	
	@Autowired
	SqlSession sql;
	
	
	public int insertReply(AreplyVO vo) {
		System.out.println("DAO까지 오는지 확인" + vo);
		sql.insert("areply.insertReply", vo);
		return 0;
	}
	
	public AreplyVO getReply(AreplyVO vo) {
		System.out.println("DAO로 넘어오는 객체 댓글 가져오기용"  + vo);
		return sql.selectOne("areply.getReply",vo);
	}
	
	public int checkReply(AreplyVO vo){
		return sql.selectOne("areply.checkReply", vo);
	}
	
	
	public int updateReplyStat(AreplyVO vo) {
		return sql.update("areply.updateDelStat", vo);
	}
	
	public int deleteReply(AreplyVO vo) {
		return sql.delete("areply.deleteReply", vo);
	}

}
