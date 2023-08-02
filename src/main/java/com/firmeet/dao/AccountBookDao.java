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

	/**
	 * 클럽 ID에 해당하는 회계 리스트 조회
	 */
	public List<AccountBookVo> getList(int clubId) {
	    System.out.println("AccountBookDao getList 확인");
	    System.out.println(clubId);
	    
	    List<AccountBookVo> aList = session.selectList("accountbook.accountList", clubId);
	    
	    System.out.println("돌아온 아이 " + aList);
	    
	    return aList;
	}

	/**
	 * 클럽 ID에 해당하는 모임 리스트 조회
	 */
	public List<ScheduleVO> getMeet(int clubId) {
	    System.out.println("AccountBookDao getMeet 확인");
	    System.out.println(clubId);
		
	    List<ScheduleVO> sList = session.selectList("accountbook.meetList", clubId);
	    
	    System.out.println("돌아온 아이 " + sList);
	    
	    return sList;
	}

	/**
	 * 회계 데이터 업로드
	 */
	public void upload(AccountBookVo aBookVo) {
		 System.out.println("AccountBookDao upload 확인");
		 System.out.println(aBookVo);
		 
		 session.insert("accountbook.meetUpload", aBookVo);
	}

	/**
	 * 회계 데이터 검색
	 */
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
		
		List<AccountBookVo> searchResult = session.selectList("accountbook.search", sMap);
		System.out.println(searchResult);
		
		return searchResult;
	}

	/*-------------------------------------마이겔러리---------------------------- */

	/**
	 * 마이겔러리 - 클럽 ID에 해당하는 회계 리스트 조회
	 */
	public List<AccountBookVo> getMyList(String memberId) {
	    System.out.println("AccountBookDao getMyList 확인");
	    System.out.println(memberId);
	    
	    List<AccountBookVo> aList = session.selectList("accountbook.myAccountList", memberId);
	    
	    System.out.println("돌아온 아이 " + aList);
	    
	    return aList;
	}

	//맴버이름 설정
	public String setMemberName(String memberId) {
	    System.out.println("맴버이름 설정");
		String meetName =session.selectOne("accountbook.setMemberName", memberId);
	    System.out.println(meetName);
	    
		return meetName;
	}

	//모임이름 설정
	public String setMeetName(int meetNo) {
	    System.out.println("모임이름 설정");
		String meetName =session.selectOne("accountbook.setMeetName", meetNo);
	    System.out.println(meetName);
	    
		return meetName;
	}
}
