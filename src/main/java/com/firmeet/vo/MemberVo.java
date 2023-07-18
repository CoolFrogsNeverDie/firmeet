package com.firmeet.vo;

public class MemberVo {

	public String memberId;
	public String memberPhone;
	public String memberName;
	public String memberPw;
	public int memberPri;
	
	private CategoryVo cateVo;
	private TagVo tagVo;
	
	public MemberVo(String memberId, String memberPhone, String memberName, String memberPw, int memberPri) {
		super();
		this.memberId = memberId;
		this.memberPhone = memberPhone;
		this.memberName = memberName;
		this.memberPw = memberPw;
		this.memberPri = memberPri;
	}

	public MemberVo() {
		super();
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

	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memberPhone=" + memberPhone + ", memberName=" + memberName
				+ ", memberPw=" + memberPw + ", memberPri=" + memberPri + "]";
	}
	
	
}
