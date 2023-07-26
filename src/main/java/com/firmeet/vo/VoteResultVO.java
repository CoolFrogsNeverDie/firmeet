package com.firmeet.vo;

public class VoteResultVO {
	private int vote1Cnt;
	private int vote2Cnt;
	private int vote3Cnt;
	private int vote4Cnt;
	private int vote5Cnt;
	
	public VoteResultVO() {

	}
	
	public VoteResultVO(int vote1Cnt, int vote2Cnt, int vote3Cnt, int vote4Cnt, int vote5Cnt) {
		super();
		this.vote1Cnt = vote1Cnt;
		this.vote2Cnt = vote2Cnt;
		this.vote3Cnt = vote3Cnt;
		this.vote4Cnt = vote4Cnt;
		this.vote5Cnt = vote5Cnt;
	}

	public int getVote1Cnt() {
		return vote1Cnt;
	}

	public void setVote1Cnt(int vote1Cnt) {
		this.vote1Cnt = vote1Cnt;
	}

	public int getVote2Cnt() {
		return vote2Cnt;
	}

	public void setVote2Cnt(int vote2Cnt) {
		this.vote2Cnt = vote2Cnt;
	}

	public int getVote3Cnt() {
		return vote3Cnt;
	}

	public void setVote3Cnt(int vote3Cnt) {
		this.vote3Cnt = vote3Cnt;
	}

	public int getVote4Cnt() {
		return vote4Cnt;
	}

	public void setVote4Cnt(int vote4Cnt) {
		this.vote4Cnt = vote4Cnt;
	}

	public int getVote5Cnt() {
		return vote5Cnt;
	}

	public void setVote5Cnt(int vote5Cnt) {
		this.vote5Cnt = vote5Cnt;
	}

	@Override
	public String toString() {
		return "VoteResultVO [vote1Cnt=" + vote1Cnt + ", vote2Cnt=" + vote2Cnt + ", vote3Cnt=" + vote3Cnt
				+ ", vote4Cnt=" + vote4Cnt + ", vote5Cnt=" + vote5Cnt + "]";
	}

}
