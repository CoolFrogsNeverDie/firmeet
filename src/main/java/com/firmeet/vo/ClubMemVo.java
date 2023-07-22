package com.firmeet.vo;

import java.sql.Date;

public class ClubMemVo {

	public int clubMemNo;
	public String memberId;
	public int clubId;
	public String memLevel;
	public Date joinDate;
	
	public ClubMemVo(int clubMemNo, String memberId, int clubId, String memLevel, Date joinDate) {
		super();
		this.clubMemNo = clubMemNo;
		this.memberId = memberId;
		this.clubId = clubId;
		this.memLevel = memLevel;
		this.joinDate = joinDate;
	}

	public ClubMemVo() {
		super();
	}

	public int getClubMemNo() {
		return clubMemNo;
	}

	public void setClubMemNo(int clubMemNo) {
		this.clubMemNo = clubMemNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public String getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "clubMemVo [clubMemNo=" + clubMemNo + ", memberId=" + memberId + ", clubId=" + clubId + ", memLevel="
				+ memLevel + ", joinDate=" + joinDate + "]";
	}
	
	
	
	
}
