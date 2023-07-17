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
	
//	@Autowired
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
	  
	  public CategoryVo selectCate(int cateNo) {
		  
		  CategoryVo categoryVo =  session.selectOne("club.selectCate",cateNo);
		  System.out.println(cateNo);
		  return categoryVo;
	  }
	  
	  public void insertClub(CategoryVo categoryVo) {
		  session.insert("club.insertCate",categoryVo);
		  System.out.println(categoryVo);
	  }
	  
	  
	  public void selectTag(TagVo tagVo) {
		  session.selectOne("club.selectTag",tagVo);
		  System.out.println(tagVo);
	  }
	  
	  public void insertClub(TagVo tagVo) {
		  session.insert("club.insertTag", tagVo);
		  System.out.println(tagVo);
	  }
	
}
