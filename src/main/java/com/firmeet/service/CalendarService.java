package com.firmeet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.ClubDao;
import com.firmeet.dao.ScheduleDAO;
import com.firmeet.vo.CalendarVO;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.ScheduleVO;

@Service
public class CalendarService {
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	@Autowired
	private ClubDao clubDAO;
	
	public List<ScheduleVO> getClubSche(CalendarVO calendarVO){
		
		List<ScheduleVO> list = scheduleDAO.getClubSche(calendarVO);
		
		return list;
	}

	public List<ClubVo> setCalOption(MemberVo memberVO){
		
		List<ClubVo> joinList = clubDAO.getMemClub(memberVO.getMemberId());
		
		return joinList;
	}
	
	public Map<String, Object> getMemSche(CalendarVO calendarVO){
		Map<String, Object> scheList = new HashMap<>();
		//일정 종류(일정, 결제) 옵션 viewOption 1, 그룹 옵션 viewOption2
		//나의 일정만 보기가 아니라면 그룹 일정 가져오기
		
		if(calendarVO.getViewOption2() != -88) {
			List<ScheduleVO> clubSche = scheduleDAO.getMemClubSche(calendarVO);
			System.out.println("들어가는 객체 정보 확인 " + calendarVO);
			scheList.put("clubSche", clubSche);
		//전체보기나 나의 일정보기면 개인 일정 가져오기
		}if(calendarVO.getViewOption2() == -99 || calendarVO.getViewOption2() == -88) {
			List<ScheduleVO> perSche = scheduleDAO.getMemPerSche(calendarVO);
			scheList.put("perSche", perSche);
		}
		
		return scheList;
	}
	
	public void addPerSche(ScheduleVO scheduleVO) {
		
		scheduleDAO.insertPerSche(scheduleVO);
		
	}
	
	public ScheduleVO getPerScheDatail(ScheduleVO scheduleVO){
		
		ScheduleVO vo = scheduleDAO.getPerScheDetail(scheduleVO);
		
		System.out.println("돌아온 상세 정보" + vo);
		return vo;
	}
	
	public boolean deletePerSche(ScheduleVO scheduleVO) {
		boolean result = false;
		
		if( scheduleDAO.deletePerSche(scheduleVO) >0) {
			result = true;
		}
		
		return result;
	}

	public void editSche(ScheduleVO scheduleVO) {
		
		scheduleDAO.updateSche(scheduleVO);
		
	}

	public List<ScheduleVO> getClubSche2(CalendarVO calendarVO) {
			
		List<ScheduleVO> list = scheduleDAO.getClubSche2(calendarVO);
		
		return list;
	}
	
}	
