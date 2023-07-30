package com.firmeet.vo;

import java.sql.Date;
import java.util.List;

public class BoardVO {
	
	private int boardNo;
	private int clubId;
	private String clubName;
	private String memberId;
	private String memberName;
	private String content;
	private int likeCnt;
	private List<ReplyVO> replyList;
	private Date boardDate;
	private int startNum;
	private int endNum;
	private String keyword;
	private String keyword2;
	private int likeNo;
	
	public BoardVO() {
		super();
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public List<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", clubId=" + clubId + ", clubName=" + clubName + ", memberId="
				+ memberId + ", memberName=" + memberName + ", content=" + content + ", likeCnt=" + likeCnt
				+ ", replyList=" + replyList + ", boardDate=" + boardDate + ", startNum=" + startNum + ", endNum="
				+ endNum + ", keyword=" + keyword + ", keyword2=" + keyword2 + ", likeNo=" + likeNo + "]";
	}


	
}
