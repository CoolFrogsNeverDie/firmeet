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
import com.firmeet.vo.ClubQnaVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.QnaVO;
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
	 
	 public int searchMainList2(String keyword){
		 Map<String, String> bMap = new HashMap<String, String>();
		 bMap.put("keyword", keyword);
		 
		 int totalCount = session.selectOne("club.totalCount2", bMap);
		return totalCount;
	 }
	 
	 public List<ClubVo> clubList2(int startRnum , int endRnum, String keyword) {
		System.out.println("ClubDao.clubList2()");
			
		Map<String, Object> bMap = new HashMap<String, Object>();
		bMap.put("startRnum", startRnum);
		bMap.put("endRnum", endRnum);
		bMap.put("keyword", keyword);
		
		
		System.out.println(bMap);
		List<ClubVo> clubList = session.selectList("club.selectList4", bMap);
			System.out.println(clubList);
			return clubList;
		 
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
	
	public List<ClubVo> searchList(int startRnum , int endRnum, String keyword, ClubVo clubVo) {
		System.out.println("clubDao.searchList()");
		
		System.out.println("=================================");
		System.out.println(clubVo);
		
		
		
		Map<String,Object> mMap = new HashMap<String, Object>();
		mMap.put("startRnum", startRnum);
		mMap.put("endRnum", endRnum);
		mMap.put("keyword", keyword);
		mMap.put("address1", clubVo.getAddress1());
		mMap.put("address2", clubVo.getAddress2());
		mMap.put("cateNo",clubVo.getCateNo());
		mMap.put("tagNo" ,clubVo.getTagNo());
		System.err.println(mMap);
		List<ClubVo> list = session.selectList("club.searchList", mMap);
		System.out.println(list);
		return list;
	}
	
	 
	public void clubQ(ClubQnaVo clubQnaVo) {
		System.out.println("ClubDao.ClubQList()");
		System.out.println(clubQnaVo);
		session.insert("club.insertQList", clubQnaVo);
		
	}
	
	public List<ClubQnaVo> qnaList(int clubId) {
		System.out.println("ClubDao.qnaList()");
		System.out.println(clubId);
		
		List<ClubQnaVo> qnaList = session.selectList("club.qnaList",clubId);
		return qnaList;
	}
	
	public int totalQna(int clubId){
		System.out.println("BoardDao.totalCount()");
		
		int totalCount = session.selectOne("club.totalQna",clubId);
		return totalCount;
	}
	
	public List<ClubQnaVo> qnaList2(int startRnum, int endRnum) {
		System.out.println("ClubDao.qnaList2()");
		
		Map<String, Integer> qMap = new HashMap<String, Integer>();
		qMap.put("startRnum", startRnum);
		qMap.put("endRnum", endRnum);
		
		System.out.println(qMap);
		
		List<ClubQnaVo> qnaList = session.selectList("club.qnaList2", qMap);
		
		
	
		System.out.println(qnaList);
		
		return qnaList;
	}

	public int checkPrenum(ClubVo clubVO) {
		
		int result =  session.selectOne("club.checkClubMax",clubVO);
		
		return result;
	}

	public List<QnaVO> getClubQnaList(MemberVo memberVO) {
		
		List<QnaVO> qnaList = session.selectList("club.getClubQnaList", memberVO);
		
		return qnaList;
	}

	public int updateQnaAnswer(QnaVO qnaVO) {
		
		System.out.println("여기까지 값 오는지 확인 : " + qnaVO);
		int row = session.update("club.updateQnaAnswer",qnaVO); 
				
		return row;
	}
	
	
}
