package com.firmeet.vo;

public class CalendarVO {

	private int clubId;
	private int viewOption;
	private int month;
	
	
	
	public CalendarVO() {
		super();
	}
	public int getClubId() {
		return clubId;
	}
	public void setClubId(int clubId) {
		this.clubId = clubId;
	}
	public int getViewOption() {
		return viewOption;
	}
	public void setViewOption(int viewOption) {
		this.viewOption = viewOption;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "CalendarVO [clubId=" + clubId + ", viewOption=" + viewOption + ", month=" + month + "]";
	}
	
	
}	
