package com.firmeet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.BoardVO;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubMemVo;
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
	  
		
	public void insertAdmin(ClubMemVo clubMemVo) {
		  
		  System.out.println("ClubDao.insertAdmin()");
		  session.insert("club.insertAdmin" , clubMemVo); 
	}
		 
	 public void insertClubCate(CategoryVo cateVo) {
		 
		
		 session.insert("club.insertClubCate",cateVo);
		 
	 }
	 
	 public void insertClubTag(TagVo tagVo) {
		
		session.insert("club.insertClubTag",tagVo);
	 }
	 
	 public List<ClubVo> clubList(int clubId) {
		 List<ClubVo> clubVo = session.selectList("club.clubSum",clubId);
		 return clubVo;
	 }
	 
	 public void clubJoinMem(ClubVo clubVo ,MemberVo memberVo) {
		 session.insert("cllub.insertMem", clubVo);
		 session.insert("cllub.insertMem", memberVo);
	 }

	 public String getClubName(BoardVO boardVO) {
		 
		 return session.selectOne("club.getClubName", boardVO);
	 }
	 
	 /*클럽 서비스에서 호출한 놈*/
	public ClubVo getClubVo(int clubId) {
		
	ClubVo clubVo= session.selectOne("club.getClubName", clubId);
		
	System.out.println(clubVo); 
	return clubVo;
		
	}
	
	 public TagVo selectTag(int tagNo) {
		 TagVo selectedTag = session.selectOne("club.selectTag",tagNo);
		 System.out.println(selectedTag);

		 return selectedTag;
	 }

	public ClubVo checkMemLevel(String memberId, int clubId) {
	      System.out.println("ClubDao.checkMemLevel()");
	      System.out.println("memberId : "+memberId);
	      System.out.println("clubId : "+clubId);
	      
	      Map<String, Object> cMap = new HashMap<>();
	      cMap.put("memberId", memberId);
	      cMap.put("clubId", clubId);
	      System.out.println("cMap : "+cMap);
	      
	      ClubVo memLevel =session.selectOne("club.checkMemLevel", cMap);
	      System.out.println("memLevel : "+memLevel);
	      
		return memLevel;
	}
	 
	 
}
