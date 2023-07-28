package com.firmeet.vo;

public class AreplyVO {
	
	private int replyNo;
	private int aboardNo;
	private String memberId;
	private String memberName;
	private String replyContent;
	private String replyDate;
	private int replyGroup;
	private int deep;
	private int stat;
	
	public AreplyVO() {
		super();
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getAboardNo() {
		return aboardNo;
	}

	public void setAboardNo(int aboardNo) {
		this.aboardNo = aboardNo;
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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public int getReplyGroup() {
		return replyGroup;
	}

	public void setReplyGroup(int replyGroup) {
		this.replyGroup = replyGroup;
	}

	public int getDeep() {
		return deep;
	}

	public void setDeep(int deep) {
		this.deep = deep;
	}

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	@Override
	public String toString() {
		return "AreplyVO [replyNo=" + replyNo + ", aboardNo=" + aboardNo + ", memberId=" + memberId + ", memberName="
				+ memberName + ", replyContent=" + replyContent + ", replyDate=" + replyDate + ", replyGroup="
				+ replyGroup + ", deep=" + deep + ", stat=" + stat + "]";
	}


}
