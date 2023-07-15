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
	private int voteNo;
	private String voteTitle;
	private String vote1 = "";
	private String vote2 = "";
	private String vote3 = "";
	private String vote4 = "";
	private String vote5 = "";
	private int totalNum;
	private String finDate;
	private int voteResult;
	private String choice;
	private String voteDate;
	private int meetYear;
	private int meetMon;
	private String meetName;
	private String startDate;
	private String endDate;
	private String meetTime;
	private String meetPlace;
	private int address1=0;
	private int address2=0;
	
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
	
	public NoticeBoardVO(int aboardNo, String title, String aboardDate, String boardContent, int voteNo,
			String voteTitle, String vote1, String vote2, String vote3, String vote4, String vote5, int totalNum,
			String finDate) {
		super();
		this.aboardNo = aboardNo;
		this.title = title;
		this.aboardDate = aboardDate;
		this.boardContent = boardContent;
		this.voteNo = voteNo;
		this.voteTitle = voteTitle;
		this.vote1 = vote1;
		this.vote2 = vote2;
		this.vote3 = vote3;
		this.vote4 = vote4;
		this.vote5 = vote5;
		this.totalNum = totalNum;
		this.finDate = finDate;
	}
	
	public NoticeBoardVO(int voteNo, int aboardNo,
			String voteTitle, String vote1, String vote2, String vote3, String vote4, String vote5, int totalNum,
			String finDate) {
		super();
		this.voteNo = voteNo;
		this.aboardNo = aboardNo;
		this.voteTitle = voteTitle;
		this.vote1 = vote1;
		this.vote2 = vote2;
		this.vote3 = vote3;
		this.vote4 = vote4;
		this.vote5 = vote5;
		this.totalNum = totalNum;
		this.finDate = finDate;
	}
	
	public NoticeBoardVO(String memberId, int voteNo, int voteResult, String choice, String voteDate) {
		super();
		this.memberId = memberId;
		this.voteNo = voteNo;
		this.voteResult = voteResult;
		this.choice = choice;
		this.voteDate = voteDate;
	}
	
	public NoticeBoardVO(int clubId, int meetNo, int meetYear, int meetMon, String meetName, String startDate,
			String endDate, String meetTime, String meetPlace, int address1, int address2) {
		super();
		this.clubId = clubId;
		this.meetNo = meetNo;
		this.meetYear = meetYear;
		this.meetMon = meetMon;
		this.meetName = meetName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.meetTime = meetTime;
		this.meetPlace = meetPlace;
		this.address1 = address1;
		this.address2 = address2;
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

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public String getVoteTitle() {
		return voteTitle;
	}

	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}

	public String getVote1() {
		return vote1;
	}

	public void setVote1(String vote1) {
		this.vote1 = vote1;
	}

	public String getVote2() {
		return vote2;
	}

	public void setVote2(String vote2) {
		this.vote2 = vote2;
	}

	public String getVote3() {
		return vote3;
	}

	public void setVote3(String vote3) {
		this.vote3 = vote3;
	}

	public String getVote4() {
		return vote4;
	}

	public void setVote4(String vote4) {
		this.vote4 = vote4;
	}

	public String getVote5() {
		return vote5;
	}

	public void setVote5(String vote5) {
		this.vote5 = vote5;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public String getFinDate() {
		return finDate;
	}

	public void setFinDate(String finDate) {
		this.finDate = finDate;
	}

	public int getVoteResult() {
		return voteResult;
	}

	public void setVoteResult(int voteResult) {
		this.voteResult = voteResult;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getVoteDate() {
		return voteDate;
	}

	public void setVoteDate(String voteDate) {
		this.voteDate = voteDate;
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

	public String getMeetName() {
		return meetName;
	}

	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}

	public String getMeetPlace() {
		return meetPlace;
	}

	public void setMeetPlace(String meetPlace) {
		this.meetPlace = meetPlace;
	}

	public int getAddress1() {
		return address1;
	}

	public void setAddress1(int address1) {
		this.address1 = address1;
	}

	public int getAddress2() {
		return address2;
	}

	public void setAddress2(int address2) {
		this.address2 = address2;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [aboardNo=" + aboardNo + ", clubId=" + clubId + ", memberId=" + memberId + ", meetNo="
				+ meetNo + ", aboardVal=" + aboardVal + ", title=" + title + ", aboardDate=" + aboardDate + ", likeCnt="
				+ likeCnt + ", boardContent=" + boardContent + ", voteEnd=" + voteEnd + ", minPerson=" + minPerson
				+ ", maxPerson=" + maxPerson + ", price=" + price + ", voteNo=" + voteNo + ", voteTitle=" + voteTitle
				+ ", vote1=" + vote1 + ", vote2=" + vote2 + ", vote3=" + vote3 + ", vote4=" + vote4 + ", vote5=" + vote5
				+ ", totalNum=" + totalNum + ", finDate=" + finDate + ", voteResult=" + voteResult + ", choice="
				+ choice + ", voteDate=" + voteDate + ", meetYear=" + meetYear + ", meetMon=" + meetMon + ", meetName="
				+ meetName + ", startDate=" + startDate + ", endDate=" + endDate + ", meetTime=" + meetTime
				+ ", meetPlace=" + meetPlace + ", address1=" + address1 + ", address2=" + address2 + "]";
	}

}
