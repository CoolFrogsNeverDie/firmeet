package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;

@Repository
public class ClubDao {
	
	@Autowired
	private SqlSession session;
	
	public List<ClubVo> getMemClub(MemberVo memberVO){
		
		List<ClubVo> memClubList = session.selectList("club.getMemClub", memberVO);
		
		return memClubList;
	}
	
	  public void insertClub(ClubVo clubVo){
	      System.out.println("ClubDao.insertClub()");
	      System.out.println(clubVo);
	      session.insert("club.insertClub",clubVo);
	   }
	
}
