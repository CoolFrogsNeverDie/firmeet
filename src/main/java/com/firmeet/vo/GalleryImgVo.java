package com.firmeet.vo;

public class GalleryImgVo {
	private int imgNo;
	private int galleryNo;
	private String imgName;
	private String imgSave;
	private long imgSize;
	private String imgRoot;
	private String regDate;
	private int clubId;
	private String memberId;
	private int likeCnt;

	public GalleryImgVo() {
		super();
	}

	
	
	public GalleryImgVo(int imgNo, int galleryNo, String imgName, String imgSave, long imgSize, String imgRoot,
			String regDate, int clubId, String memberId, int likeCnt) {
		super();
		this.imgNo = imgNo;
		this.galleryNo = galleryNo;
		this.imgName = imgName;
		this.imgSave = imgSave;
		this.imgSize = imgSize;
		this.imgRoot = imgRoot;
		this.regDate = regDate;
		this.clubId = clubId;
		this.memberId = memberId;
		this.likeCnt = likeCnt;
	}



	public GalleryImgVo(int imgNo, int galleryNo, String imgName, String imgSave, long imgSize, String imgRoot,
			String regDate, int clubId, String memberId) {
		super();
		this.imgNo = imgNo;
		this.galleryNo = galleryNo;
		this.imgName = imgName;
		this.imgSave = imgSave;
		this.imgSize = imgSize;
		this.imgRoot = imgRoot;
		this.regDate = regDate;
		this.clubId = clubId;
		this.memberId = memberId;
	}

	public GalleryImgVo(int imgNo, int galleryNo, String imgName, String imgSave, long imgSize, String imgRoot,
			String regDate, int clubId) {
		super();
		this.imgNo = imgNo;
		this.galleryNo = galleryNo;
		this.imgName = imgName;
		this.imgSave = imgSave;
		this.imgSize = imgSize;
		this.imgRoot = imgRoot;
		this.regDate = regDate;
		this.clubId = clubId;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgSave() {
		return imgSave;
	}

	public void setImgSave(String imgSave) {
		this.imgSave = imgSave;
	}

	public long getImgSize() {
		return imgSize;
	}

	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}

	public String getImgRoot() {
		return imgRoot;
	}

	public void setImgRoot(String imgRoot) {
		this.imgRoot = imgRoot;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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

	
	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	@Override
	public String toString() {
		return "GalleryImgVo [imgNo=" + imgNo + ", galleryNo=" + galleryNo + ", imgName=" + imgName + ", imgSave="
				+ imgSave + ", imgSize=" + imgSize + ", imgRoot=" + imgRoot + ", regDate=" + regDate + ", clubId="
				+ clubId + ", memberId=" + memberId + ", likeCnt=" + likeCnt + "]";
	}

}
