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
import com.firmeet.vo.TagVo;

@Repository
public class ClubDao {
	
	@Autowired
	private SqlSession session;
	
	// 회원이 가입한 클럽 목록 조회 메서드
	public List<ClubVo> getMemClub(String memberId){
		
		List<ClubVo> memClubList = session.selectList("club.getMemClub", memberId);
		 System.out.println(memClubList);
		
		return memClubList;
	}
	
	// 클럽 생성 메서드
	public void insertClub(ClubVo clubVo){
	      System.out.println("ClubDao.insertClub()");
	      System.out.println(clubVo);
	      session.insert("club.insertClub",clubVo);
	     
	   }
	  
	// 클럽 관리자 권한 설정 메서드	
	public void insertAdmin(ClubMemVo clubMemVo) {
		  
		  System.out.println("ClubDao.insertAdmin()");
		  session.insert("club.insertAdmin" , clubMemVo); 
	}
		 
    // 클럽 카테고리 정보 삽입 메서드
	 public void insertClubCate(CategoryVo cateVo) {
		 
		 session.insert("club.insertClubCate",cateVo);
		 
	 }
	 
	 // 클럽 태그 정보 삽입 메서드
	 public void insertClubTag(TagVo tagVo) {
		
		session.insert("club.insertClubTag",tagVo);
	 }
	 
	 // 클럽 목록 조회 메서드
	 public List<ClubVo> clubList() {
		 List<ClubVo> clubVo = session.selectList("club.clubSum");
		 return clubVo;
	 }
	 public ClubVo clubInfo(int clubId) {
		 
		 ClubVo clubVo= session.selectOne("club.getClubVo", clubId);
		 return clubVo;
	 } 
	 
	 // 클럽 가입 처리 메서드
	 public void clubJoinMem(ClubMemVo clubMemVo) {
		 session.insert("club.insertMem", clubMemVo);
	 }

	 // 게시글이 속한 클럽 이름 조회 메서드
	 public String getClubName(BoardVO boardVO) {
		 
		 return session.selectOne("club.getClubName", boardVO);
	 }
	 
	    // 클럽 정보 조회 메서드	 
	 /*클럽 서비스에서 호출한 놈*/
	public ClubVo getClubVo(int clubId) {
		
	ClubVo clubVo= session.selectOne("club.getClubName", clubId);
		
	System.out.println(clubVo); 
	return clubVo;
		
	}
	
    // 태그 정보 조회 메서드
	 public TagVo selectTag(int tagNo) {
		 TagVo selectedTag = session.selectOne("club.selectTag",tagNo);
		 System.out.println(selectedTag);

		 return selectedTag;
	 }

	// 클럽 멤버 레벨 확인 메서드
	public ClubVo checkMemLevel(String memberId, int clubId) {
	      System.out.println("ClubDao.checkMemLevel()");
	      System.out.println("clubId : "+clubId);
	      System.out.println("memberId : "+memberId);
	      
	      Map<String, Object> cMap = new HashMap<>();
	      cMap.put("clubId", clubId);
	      cMap.put("memberId", memberId);
	      System.out.println("cMap : "+cMap);
	      
	      ClubVo memLevel =session.selectOne("club.checkMemLevel", cMap);
	      System.out.println("memLevel : "+memLevel);
	      
		return memLevel;
	}
	 
	public List<TagVo> getClubTagRank(ClubVo clubVO){
		
		List<TagVo> list = 	session.selectList("club.ClubTagRank", clubVO);
		
		return list;
	}
	
	public List<ClubVo> searchList(ClubVo clubVo) {
		System.out.println("clubDao.searchList()");
		System.out.println(clubVo);
		List<ClubVo> list = session.selectList("club.searchList", clubVo);
		System.out.println(list);
		return list;
	}
	 
}
