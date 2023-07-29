package com.firmeet.vo;

public class PayresultVO {
	private int payresultNo;
	private int meetNo;
	private String memberId;
	private int paycount;
	private String payvoteDate;
	
	public PayresultVO() {
		super();
	}

	public int getPayresultNo() {
		return payresultNo;
	}

	public void setPayresultNo(int payresultNo) {
		this.payresultNo = payresultNo;
	}

	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPaycount() {
		return paycount;
	}

	public void setPaycount(int paycount) {
		this.paycount = paycount;
	}

	public String getPayvoteDate() {
		return payvoteDate;
	}

	public void setPayvoteDate(String payvoteDate) {
		this.payvoteDate = payvoteDate;
	}

	@Override
	public String toString() {
		return "PayresultVO [payresultNo=" + payresultNo + ", meetNo=" + meetNo + ", memberId=" + memberId
				+ ", paycount=" + paycount + ", payvoteDate=" + payvoteDate + "]";
	}
	
}
