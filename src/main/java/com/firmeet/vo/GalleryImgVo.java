package com.firmeet.vo;

public class GalleryImgVo {
    private int imgNo;
    private int galleryNo;
    private String imgName;
    private String imgSave;
    private String imgSize;
    private String imgRoot;
    private String regDate;
        
	public GalleryImgVo() {
		super();
	}

	public GalleryImgVo(int imgNo, int galleryNo, String imgName, String imgSave, String imgSize, String imgRoot,
			String regDate) {
		super();
		this.imgNo = imgNo;
		this.galleryNo = galleryNo;
		this.imgName = imgName;
		this.imgSave = imgSave;
		this.imgSize = imgSize;
		this.imgRoot = imgRoot;
		this.regDate = regDate;
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

	public String getImgSize() {
		return imgSize;
	}

	public void setImgSize(String imgSize) {
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

	@Override
	public String toString() {
		return "GalleryImgVo [imgNo=" + imgNo + ", galleryNo=" + galleryNo + ", imgName=" + imgName + ", imgSave="
				+ imgSave + ", imgSize=" + imgSize + ", imgRoot=" + imgRoot + ", regDate=" + regDate + "]";
	}
}
