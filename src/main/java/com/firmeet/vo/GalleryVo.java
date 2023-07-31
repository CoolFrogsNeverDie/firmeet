package com.firmeet.vo;

public class GalleryVo {
	private int galleryNo;
	private int clubId;
	private int meetNo;
	private String memberId;
		
	public GalleryVo() {
		super();
	}

	public GalleryVo(int galleryNo, int clubId, int meetNo, String memberId) {
		super();
		this.galleryNo = galleryNo;
		this.clubId = clubId;
		this.meetNo = meetNo;
		this.memberId = memberId;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "GalleryVo [galleryNo=" + galleryNo + ", clubId=" + clubId + ", meetNo=" + meetNo + ", memberId="
				+ memberId + "]";
	}
}
