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
import com.firmeet.vo.ScheduleVO;

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

	public List<ScheduleVO> getMeet(int clubId) {
	    System.out.println("AccountBookDao getMeet 확인");
	    System.out.println(clubId);
		
	    List<ScheduleVO> sList = session.selectList("accountbook.meetList", clubId);
	    
	    System.out.println("돌아온 아이 " + sList);
	    
	    return sList;
	}

	public void upload(AccountBookVo aBookVo) {
		 System.out.println("AccountBookDao upload 확인");
		 System.out.println(aBookVo);
		 
		 session.insert("accountbook.meetUpload", aBookVo);
	}

	public List<AccountBookVo> search(int clubId, String startDate, String endDate, String searchText) {
		System.out.println("AccountBookDao search 확인");
		System.out.println(clubId);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(searchText);
		
		Map<String, Object> sMap = new HashMap<>();
		sMap.put("clubId", clubId);
		sMap.put("startDate", startDate);
		sMap.put("endDate", endDate);
		sMap.put("searchText", searchText);
		
		List<AccountBookVo> searchResult =session.selectList("accountbook.search",sMap);
		System.out.println(searchResult);
		
		return searchResult;
	}
}
