package com.firmeet.vo;

public class GalleryLikeVo {

	private int imgNo;
	private String likeMember;

	public GalleryLikeVo() {
		super();
	}

	public GalleryLikeVo(int imgNo, String likeMember) {
		super();
		this.imgNo = imgNo;
		this.likeMember = likeMember;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getLikeMember() {
		return likeMember;
	}

	public void setLikeMember(String likeMember) {
		this.likeMember = likeMember;
	}

	@Override
	public String toString() {
		return "GalleryLikeVo [imgNo=" + imgNo + ", likeMember=" + likeMember + "]";
	}

}
