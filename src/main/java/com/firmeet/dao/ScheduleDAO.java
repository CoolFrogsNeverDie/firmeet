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
		
		return session.selectList("schedule.getClubSchedule",calendarVO);
	}
	
	public List<ScheduleVO> getMemClubSche(CalendarVO calendarVO){
		return session.selectList("schedule.getMemClubSche", calendarVO);
	}

	public List<ScheduleVO> getMemPerSche(CalendarVO calendarVO){
		return session.selectList("schedule.getMemPerSche", calendarVO);
	}
	
	public void insertPerSche(ScheduleVO scheduleVO) {
		session.insert("schedule.insertPerSche", scheduleVO);
	}
	
	public ScheduleVO getPerScheDetail(ScheduleVO scheduleVO) {
		
		return session.selectOne("schedule.getPerScheDetail",scheduleVO);
	}
	
	public int deletePerSche(ScheduleVO scheduleVO) {
		
		return session.delete("schedule.deletePerSche", scheduleVO);
	}

	public int updateSche(ScheduleVO scheduleVO) {
		
		return session.update("schedule.updatePerSche", scheduleVO);
	}

	public List<ScheduleVO> getClubSche2(CalendarVO calendarVO) {
		
		return session.selectList("schedule.getClubSchedule2", calendarVO);
	}
	
}
