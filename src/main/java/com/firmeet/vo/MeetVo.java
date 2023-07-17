package com.firmeet.vo;

public class MeetVo {
	private int meetNo;
	private int clubId;
	private String meetName;
		
	public MeetVo() {
		super();
	}

	public MeetVo(int meetNo, int clubId, String meetName) {
		super();
		this.meetNo = meetNo;
		this.clubId = clubId;
		this.meetName = meetName;
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

	@Override
	public String toString() {
		return "MeetVo [meetNo=" + meetNo + ", clubId=" + clubId + ", meetName=" + meetName + "]";
	}
	
	
	
}


