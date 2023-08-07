package com.firmeet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertReply(ReplyVO replyVO) {
	
		return session.insert("reply.insertReply", replyVO);
	}

	
	public ReplyVO getReply(ReplyVO replyVO) {

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
