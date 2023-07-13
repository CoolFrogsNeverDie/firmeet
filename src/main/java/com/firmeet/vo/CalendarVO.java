package com.firmeet.vo;

public class CalendarVO {

	private int clubId;
	private String memberId;	
	private int viewOption1;
	private int viewOption2;
	private int years;
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


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getViewOption1() {
		return viewOption1;
	}


	public void setViewOption1(int viewOption1) {
		this.viewOption1 = viewOption1;
	}


	public int getViewOption2() {
		return viewOption2;
	}


	public void setViewOption2(int viewOption2) {
		this.viewOption2 = viewOption2;
	}


	public int getYears() {
		return years;
	}


	public void setYears(int years) {
		this.years = years;
	}


	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
		this.month = month;
	}


	@Override
	public String toString() {
		return "CalendarVO [clubId=" + clubId + ", memberId=" + memberId + ", viewOption1=" + viewOption1
				+ ", viewOption2=" + viewOption2 + ", years=" + years + ", month=" + month + "]";
	}
	
	

	
	
}	
