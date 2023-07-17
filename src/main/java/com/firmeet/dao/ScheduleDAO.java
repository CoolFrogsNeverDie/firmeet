package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.CalendarVO;
import com.firmeet.vo.ScheduleVO;

@Repository
public class ScheduleDAO {
	
	@Autowired
	SqlSession session;
	
	public List<ScheduleVO> getClubSche(CalendarVO calendarVO){
		
		System.out.println("getClubSche in dao : " + calendarVO );
		List<ScheduleVO> list = session.selectList("schedule.getClubSchedule",calendarVO);
		System.out.println("넘어온 스케줄 리스트 확인 : " + list);
		
		return list;
	}
	
	public List<ScheduleVO> getMemClubSche(CalendarVO calendarVO){
		System.out.println("DAO까지 오는지 확인 club  : " + calendarVO);
		List<ScheduleVO> clubScheList = session.selectList("schedule.getMemClubSche", calendarVO);
		System.out.println("불러온 club Sche " + clubScheList);
		return clubScheList;
	}

	public List<ScheduleVO> getMemPerSche(CalendarVO calendarVO){
		System.out.println("DAO까지 오는지 확인 per : " + calendarVO);
		List<ScheduleVO> perScheList = session.selectList("schedule.getMemPerSche", calendarVO);
		System.out.println("불러온 per sche" + perScheList);
		return perScheList;
	}
	
	public void insertPerSche(ScheduleVO scheduleVO) {
		
		System.out.println("개인일정 추가 DAO까찌 오는지 확인  : " + scheduleVO);
		session.insert("schedule.insertPerSche", scheduleVO);
	}
	
}
