package com.firmeet.vo;

public class NoticeBoardVO {
	
	private int aboardNo;
	private int clubId;
	private String memberId;
	private int	meetNo;
	private int	aboardVal;
	private String title;
	private String aboardDate;
	private int	likeCnt;
	private String boardContent;
	private String voteEnd;
	private int	minPerson;
	private int maxPerson;
	private int price;
	
	public NoticeBoardVO() {
		
	}
	
	public NoticeBoardVO(int aboardNo, int clubId, String memberId, int aboardVal, String title, String aboardDate,
			String boardContent) {
		super();
		this.aboardNo = aboardNo;
		this.clubId = clubId;
		this.memberId = memberId;
		this.aboardVal = aboardVal;
		this.title = title;
		this.aboardDate = aboardDate;
		this.boardContent = boardContent;
	}

	public NoticeBoardVO(int aboardNo, int clubId, String memberId, int meetNo, int aboardVal, String title,
			String aboardDate, int likeCnt, String boardContent, String voteEnd, int minPerson, int maxPerson,
			int price) {
		super();
		this.aboardNo = aboardNo;
		this.clubId = clubId;
		this.memberId = memberId;
		this.meetNo = meetNo;
		this.aboardVal = aboardVal;
		this.title = title;
		this.aboardDate = aboardDate;
		this.likeCnt = likeCnt;
		this.boardContent = boardContent;
		this.voteEnd = voteEnd;
		this.minPerson = minPerson;
		this.maxPerson = maxPerson;
		this.price = price;
	}

	public int getAboardNo() {
		return aboardNo;
	}

	public void setAboardNo(int aboardNo) {
		this.aboardNo = aboardNo;
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

	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public int getAboardVal() {
		return aboardVal;
	}

	public void setAboardVal(int aboardVal) {
		this.aboardVal = aboardVal;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAboardDate() {
		return aboardDate;
	}

	public void setAboardDate(String aboardDate) {
		this.aboardDate = aboardDate;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getVoteEnd() {
		return voteEnd;
	}

	public void setVoteEnd(String voteEnd) {
		this.voteEnd = voteEnd;
	}

	public int getMinPerson() {
		return minPerson;
	}

	public void setMinPerson(int minPerson) {
		this.minPerson = minPerson;
	}

	public int getMaxPerson() {
		return maxPerson;
	}

	public void setMaxPerson(int maxPerson) {
		this.maxPerson = maxPerson;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [aboardNo=" + aboardNo + ", clubId=" + clubId + ", memberId=" + memberId + ", meetNo="
				+ meetNo + ", aboardVal=" + aboardVal + ", title=" + title + ", aboardDate=" + aboardDate + ", likeCnt="
				+ likeCnt + ", boardContent=" + boardContent + ", voteEnd=" + voteEnd + ", minPerson=" + minPerson
				+ ", maxPerson=" + maxPerson + ", price=" + price + "]";
	}

}
