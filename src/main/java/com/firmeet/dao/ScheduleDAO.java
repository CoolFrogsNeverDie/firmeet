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
	
}
