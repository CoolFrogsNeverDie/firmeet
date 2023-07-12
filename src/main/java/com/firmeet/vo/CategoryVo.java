package com.firmeet.vo;

public class CategoryVo {
	public int cateNum;
	public int memCateNum;
	public int clubCateNum;
	public int clubId;
	public String memberId;
	public String category;
	
	public CategoryVo(int cateNum, int memCateNum, int clubCateNum, int clubId, String memberId, String category) {
		super();
		this.cateNum = cateNum;
		this.memCateNum = memCateNum;
		this.clubCateNum = clubCateNum;
		this.clubId = clubId;
		this.memberId = memberId;
		this.category = category;
	}

	public CategoryVo() {
		super();
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public int getMemCateNum() {
		return memCateNum;
	}

	public void setMemCateNum(int memCateNum) {
		this.memCateNum = memCateNum;
	}

	public int getClubCateNum() {
		return clubCateNum;
	}

	public void setClubCateNum(int clubCateNum) {
		this.clubCateNum = clubCateNum;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "CategoryVo [cateNum=" + cateNum + ", memCateNum=" + memCateNum + ", clubCateNum=" + clubCateNum
				+ ", clubId=" + clubId + ", memberId=" + memberId + ", category=" + category + "]";
	}
	
	
	
}

