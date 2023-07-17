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
		
		List<ClubVo> joinList = clubDAO.getMemClub(memberVO);
		
		return joinList;
	}
	
	public Map<String, Object> getMemSche(CalendarVO calendarVO){
		Map<String, Object> scheList = new HashMap<>();
		
		if(calendarVO.getViewOption2() != -88) {
			List<ScheduleVO> clubSche = scheduleDAO.getMemClubSche(calendarVO);
			scheList.put("clubSche", clubSche);
		}if(calendarVO.getViewOption2() == -99 || calendarVO.getViewOption2() == -88) {
			List<ScheduleVO> perSche = scheduleDAO.getMemPerSche(calendarVO);
			scheList.put("perSche", perSche);
		}
		
		return scheList;
	}
	
	public void addPerSche(ScheduleVO scheduleVO) {
		
		scheduleDAO.insertPerSche(scheduleVO);
		
	}
	
}
