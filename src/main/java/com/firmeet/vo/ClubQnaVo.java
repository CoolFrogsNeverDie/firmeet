package com.firmeet.vo;

import java.sql.Date;

public class ClubQnaVo {
	
	private int qnaNo;
	private int clubId;
	private String memberId;
	private String qnaCotent;
	private Date qnaDate;
	private String answerContent;
	private Date answerDate;
	
	
	public ClubQnaVo() {
		super();
	}


	public ClubQnaVo(int qnaNo, int clubId, String memberId, String qnaCotent, Date qnaDate, String answerContent,
			Date answerDate) {
		super();
		this.qnaNo = qnaNo;
		this.clubId = clubId;
		this.memberId = memberId;
		this.qnaCotent = qnaCotent;
		this.qnaDate = qnaDate;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
	}


	public int getQnaNo() {
		return qnaNo;
	}


	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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


	public String getQnaCotent() {
		return qnaCotent;
	}


	public void setQnaCotent(String qnaCotent) {
		this.qnaCotent = qnaCotent;
	}


	public Date getQnaDate() {
		return qnaDate;
	}


	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}


	public String getAnswerContent() {
		return answerContent;
	}


	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}


	public Date getAnswerDate() {
		return answerDate;
	}


	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}


	@Override
	public String toString() {
		return "ClubQnaVo [qnaNo=" + qnaNo + ", clubId=" + clubId + ", memberId=" + memberId + ", qnaCotent="
				+ qnaCotent + ", qnaDate=" + qnaDate + ", answerContent=" + answerContent + ", answerDate=" + answerDate
				+ "]";
	}

	
	
	
}
