package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertReply(ReplyVO replyVO) {
	
		System.out.println("DAO까지 오는지 확인" + replyVO);
		session.insert("reply.insertReply", replyVO);
		
		return 0;
	}

	
	public ReplyVO getReply(ReplyVO replyVO) {
		System.out.println("DAO로 넘어오는 객체 댓글 가져오기용"  + replyVO);
		return session.selectOne("reply.getReply",replyVO);
	}
	
	public int checkReply(ReplyVO replyVO){
		
		return session.selectOne("reply.checkReply", replyVO);
	}
	
	
	public int updateReplyStat(ReplyVO replyVO) {
		
		return session.update("reply.updateDelStat", replyVO);
	}
	
	public int deleteReply(ReplyVO replyVO) {
		
		return session.delete("reply.deleteReply", replyVO);
	}
	
}
