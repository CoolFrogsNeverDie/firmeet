package com.firmeet.vo;

public class MeetVo {
	private int meetNo;
	private int clubId;
	private String meetName;
	private int meetYear;
	private int meetMon;
		
	public MeetVo() {
		super();
	}
	
	public MeetVo(int meetNo, int clubId, String meetName, int meetYear, int meetMon) {
		super();
		this.meetNo = meetNo;
		this.clubId = clubId;
		this.meetName = meetName;
		this.meetYear = meetYear;
		this.meetMon = meetMon;
	}

	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public String getMeetName() {
		return meetName;
	}

	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}
	
	public int getMeetYear() {
		return meetYear;
	}

	public void setMeetYear(int meetYear) {
		this.meetYear = meetYear;
	}

	public int getMeetMon() {
		return meetMon;
	}

	public void setMeetMon(int meetMon) {
		this.meetMon = meetMon;
	}

	@Override
	public String toString() {
		return "MeetVo [meetNo=" + meetNo + ", clubId=" + clubId + ", meetName=" + meetName + ", meetYear=" + meetYear
				+ ", meetMon=" + meetMon + "]";
	}

	
	
	
	
}


