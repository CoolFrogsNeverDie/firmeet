package com.firmeet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSession session;
	
	public int addReply(ReplyVO replyVO) {
	
		System.out.println("DAO까지 오는지 확인" + replyVO);
		
		
		return 0;
	}
	
}
