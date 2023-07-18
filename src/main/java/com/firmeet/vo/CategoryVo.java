package com.firmeet.vo;

public class CategoryVo {
	public int cateNo;
	public int clubId;
	public String memberId;
	public String category;
	
	public CategoryVo(int cateNo, int clubId, String memberId, String category) {
		super();
		this.cateNo = cateNo;
		this.clubId = clubId;
		this.memberId = memberId;
		this.category = category;
	}

	public CategoryVo() {
		super();
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
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
		return "CategoryVo [cateNo=" + cateNo + ", clubId=" + clubId + ", memberId=" + memberId + ", category="
				+ category + "]";
	}
	
	
	
	
	
	
	
	
	
}

