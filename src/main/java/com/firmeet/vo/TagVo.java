package com.firmeet.vo;

public class TagVo {
	private int tagNo;
	private int clubId;
	private String tagName;
	private String memberId;
	private int totalCnt;
	private int tagCnt;
	
	public TagVo(int tagNo, int clubId, String tagName, String memberId) {
		super();
		this.tagNo = tagNo;
		this.clubId = clubId;
		this.tagName = tagName;
		this.memberId = memberId;
	}

	public TagVo() {
		super();
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getTagCnt() {
		return tagCnt;
	}

	public void setTagCnt(int tagCnt) {
		this.tagCnt = tagCnt;
	}

	@Override
	public String toString() {
		return "TagVo [tagNo=" + tagNo + ", clubId=" + clubId + ", tagName=" + tagName + ", memberId=" + memberId
				+ ", totalCnt=" + totalCnt + ", tagCnt=" + tagCnt + "]";
	}
	
	
	
	
}
