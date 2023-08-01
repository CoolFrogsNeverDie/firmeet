package com.firmeet.vo;

import java.sql.Date;

public class QnaVO {
	
	private int qnaNo;
	private String memberId;
	private String memberName;
	private String qnaContent;
	private String answerContent;
	private Date qnaDate;
	private Date answerDate;
	
	public QnaVO() {
		super();
	}
	
	
	public int getQnaNo() {
		return qnaNo;
	}


	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}


	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public Date getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}


	@Override
	public String toString() {
		return "QnaVO [qnaNo=" + qnaNo + ", memberId=" + memberId + ", memberName=" + memberName + ", qnaContent="
				+ qnaContent + ", answerContent=" + answerContent + ", qnaDate=" + qnaDate + ", answerDate="
				+ answerDate + "]";
	}

	
	
}
