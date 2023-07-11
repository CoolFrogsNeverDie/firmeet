package com.firmeet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.firmeet.vo.CalendarVO;
import com.firmeet.vo.ScheduleVO;

@Repository
public class ScheduleDAO {
	
	public List<ScheduleVO> getClubSche(CalendarVO calendarVO){
		
		System.out.println("getClubSche in dao : " + calendarVO );
		
		return null;
	}
	
}
