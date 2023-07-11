package com.firmeet.vo;

import java.sql.Date;

public class ScheduleVO {
	
	private int boardNo;
	private int meetNo;
	private int meetCate;
	private int clubId;
	private String title;
	private Date startDate;
	private Date endDate;
	public ScheduleVO() {
		super();
	}
	
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMeetNo() {
		return meetNo;
	}
	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}
	public int getMeetCate() {
		return meetCate;
	}
	public void setMeetCate(int meetCate) {
		this.meetCate = meetCate;
	}
	public int getClubId() {
		return clubId;
	}
	public void setClubId(int clubNo) {
		this.clubId = clubNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date start) {
		this.startDate = start;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date end) {
		this.endDate = end;
	}

	@Override
	public String toString() {
		return "ScheduleVO [boardNo=" + boardNo + ", meetNo=" + meetNo + ", meetCate=" + meetCate + ", clubId=" + clubId
				+ ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

	
	
	
}
