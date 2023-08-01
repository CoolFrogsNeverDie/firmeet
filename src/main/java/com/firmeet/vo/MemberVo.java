package com.firmeet.vo;

import java.util.Arrays;
import java.util.List;

public class MemberVo {

	private String memberId;
	private String memberPhone;
	private String memberName;
	private String memberPw;
	private int memberPri;
	
	private int[] tagNo;
	private int cateNo;
	private int clubmemNo;
	private String category;
	
	
	private CategoryVo cateVo;
	private TagVo tagVo;
	private List<TagVo> tagList;	
	
	
	private int startNum;
	private int endNum;
	private int clubId;
	
	public MemberVo() {
		super();
	}


	public MemberVo(String memberId, String memberPhone, String memberName, String memberPw, int memberPri, int[] tagNo,
			int cateNo, String category, CategoryVo cateVo, TagVo tagVo) {
		super();
		this.memberId = memberId;
		this.memberPhone = memberPhone;
		this.memberName = memberName;
		this.memberPw = memberPw;
		this.memberPri = memberPri;
		this.tagNo = tagNo;
		this.cateNo = cateNo;
		this.category = category;
		this.cateVo = cateVo;
		this.tagVo = tagVo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberPw() {
		return memberPw;
	}


	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}


	public int getMemberPri() {
		return memberPri;
	}


	public void setMemberPri(int memberPri) {
		this.memberPri = memberPri;
	}


	public int[] getTagNo() {
		return tagNo;
	}


	public void setTagNo(int[] tagNo) {
		this.tagNo = tagNo;
	}


	public int getCateNo() {
		return cateNo;
	}


	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public CategoryVo getCateVo() {
		return cateVo;
	}


	public void setCateVo(CategoryVo cateVo) {
		this.cateVo = cateVo;
	}


	public TagVo getTagVo() {
		return tagVo;
	}


	public void setTagVo(TagVo tagVo) {
		this.tagVo = tagVo;
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
	
	

	public int getClubmemNo() {
		return clubmemNo;
	}


	public void setClubmemNo(int clubmemNo) {
		this.clubmemNo = clubmemNo;
	}
	

	public int getClubId() {
		return clubId;
	}


	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	
	

	public List<TagVo> getTagList() {
		return tagList;
	}


	public void setTagList(List<TagVo> tagList) {
		this.tagList = tagList;
	}


	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memberPhone=" + memberPhone + ", memberName=" + memberName
				+ ", memberPw=" + memberPw + ", memberPri=" + memberPri + ", tagNo=" + Arrays.toString(tagNo)
				+ ", cateNo=" + cateNo + ", clubmemNo=" + clubmemNo + ", category=" + category + ", cateVo=" + cateVo
				+ ", tagVo=" + tagVo + ", tagList=" + tagList + ", startNum=" + startNum + ", endNum=" + endNum
				+ ", clubId=" + clubId + "]";
	}


	

	
}
