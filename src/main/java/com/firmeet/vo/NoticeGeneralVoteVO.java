package com.firmeet.vo;

public class NoticeGeneralVoteVO {

	private int voteNo;
	private int aboardNo;
	private String voteTitle;
	private String vote1;
	private String vote2;
	private String vote3;
	private String vote4;
	private String vote5;
	private int totalNum;
	private String finDate;
	
	public NoticeGeneralVoteVO() {

	}
	
	public NoticeGeneralVoteVO(int voteNo, int aboardNo, String voteTitle, String vote1, String vote2, String vote3,
			int totalNum, String finDate) {
		super();
		this.voteNo = voteNo;
		this.aboardNo = aboardNo;
		this.voteTitle = voteTitle;
		this.vote1 = vote1;
		this.vote2 = vote2;
		this.vote3 = vote3;
		this.totalNum = totalNum;
		this.finDate = finDate;
	}

	public NoticeGeneralVoteVO(int voteNo, int aboardNo, String voteTitle, String vote1, String vote2, String vote3,
			String vote4, String vote5, int totalNum, String finDate) {
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

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public int getAboardNo() {
		return aboardNo;
	}

	public void setAboardNo(int aboardNo) {
		this.aboardNo = aboardNo;
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

	@Override
	public String toString() {
		return "NoticeGeneralVoteVO [voteNo=" + voteNo + ", aboardNo=" + aboardNo + ", voteTitle=" + voteTitle
				+ ", vote1=" + vote1 + ", vote2=" + vote2 + ", vote3=" + vote3 + ", vote4=" + vote4 + ", vote5=" + vote5
				+ ", totalNum=" + totalNum + ", finDate=" + finDate + "]";
	}

}