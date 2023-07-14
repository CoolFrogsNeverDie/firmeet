package com.firmeet.vo;

import java.sql.Date;

public class ScheduleVO {
	
	private int boardNo;
	private int perScheNo;
	private int meetNo;
	private int meetCate;
	private int clubId;
	private String clubName;
	private String title;
	private String content;
	private String frontTitle;
	private Date startDate;
	private Date endDate;
	private String place;
	private String address1;
	private String address2;
	
	public ScheduleVO() {
		super();
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getPerScheNo() {
		return perScheNo;
	}

	public void setPerScheNo(int perScheNo) {
		this.perScheNo = perScheNo;
	}

	
	
	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
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

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFrontTitle() {
		return frontTitle;
	}

	public void setFrontTitle(String frontTitle) {
		this.frontTitle = frontTitle;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	@Override
	public String toString() {
		return "ScheduleVO [boardNo=" + boardNo + ", perScheNo=" + perScheNo + ", meetNo=" + meetNo + ", meetCate="
				+ meetCate + ", clubId=" + clubId + ", clubName=" + clubName + ", title=" + title + ", content="
				+ content + ", frontTitle=" + frontTitle + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", place=" + place + ", address1=" + address1 + ", address2=" + address2 + "]";
	}


	
}
