package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.TagVo;

@Repository
public class ClubDao {
	
	@Autowired
	private SqlSession session;
	
	public List<ClubVo> getMemClub(String memberId){
		
		List<ClubVo> memClubList = session.selectList("club.getMemClub", memberId);
		 System.out.println(memClubList);
		
		return memClubList;
	}
	
	  public void insertClub(ClubVo clubVo){
	      System.out.println("ClubDao.insertClub()");
	      System.out.println(clubVo);
	      session.insert("club.insertClub",clubVo);
	     
	   }
	  
	 public void insertCate(CategoryVo cateVO) {
		 
		 System.out.println("넘어온 값 확인 " + cateVO);
		 session.insert("club.insertClubCate",cateVO);
		 
	 }
	 
	 public void insertTag(TagVo tagVo) {
		 System.out.println("넘어온 값 확인" + tagVo);
	 }
	 
	 public void clubJoinMem(ClubVo clubVo ,MemberVo memberVo) {
		 session.insert("cllub.insertMem", clubVo);
		 session.insert("cllub.insertMem", memberVo);
	 }
}
