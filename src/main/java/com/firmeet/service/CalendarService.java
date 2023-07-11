package com.firmeet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.ScheduleDAO;
import com.firmeet.vo.CalendarVO;
import com.firmeet.vo.ScheduleVO;

@Service
public class CalendarService {
	
	@Autowired
	ScheduleDAO scheduleDAO;
	
	public List<ScheduleVO> getClubSche(CalendarVO calendarVO){
		
		System.out.println("Service까지 오는지 확인  : " + calendarVO);
		scheduleDAO.getClubSche(calendarVO);
		
		return null;
	}

}
