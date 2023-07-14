package com.firmeet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.AccountBookVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.NoticeBoardVO;

@Repository
public class AccountBookDao {
	
	@Autowired
	private SqlSession session;

	public List<AccountBookVo> getList(int clubId) {
	    System.out.println("AccountBookDao getList 확인");
	    System.out.println(clubId);
	    
	    List<AccountBookVo> aList = session.selectList("accountbook.accountList", clubId);
	    
	    System.out.println("돌아온 아이 " + aList);
	    
	    return aList;
	}
}
