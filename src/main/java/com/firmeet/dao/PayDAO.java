package com.firmeet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.AccountBookVo;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.PayresultVO;

@Repository
public class PayDAO {
	
	@Autowired
	SqlSession sql;
	
	public int payinsert(PayresultVO vo) {
		System.out.println("payinsertDAO까지 오는지 확인" + vo);
		sql.insert("pay.payinsert", vo);
		return 0;
	}
	
	public int payupdate(PayresultVO vo) {
		System.out.println("payupdateDAO까지 오는지 확인" + vo);
		return sql.update("pay.payupdate", vo);
	}

	public PayresultVO paycnt(NoticeBoardVO vo) {
		System.out.println("DAO로 넘어오는 cnt 가져오기용"  + vo);
		return sql.selectOne("pay.paycnt",vo);
	}

	public void accountMaker(AccountBookVo avo) {
		System.out.println("결제했을때 가계부 작성"  + avo);
		sql.insert("pay.accountMaker", avo);
	}
	
}