package com.firmeet.vo;

import java.sql.Date;

public class UploadVo {

	private int aboardNo;
	private int clubId;
	private String oriName;
	private String saveName;
	private long size;
	private String path;
	private Date uploadDate;
	
	public UploadVo(int aboardNo, int clubId, String oriName, String saveName, long size, String path,
			Date uploadDate) {
		super();
		this.aboardNo = aboardNo;
		this.clubId = clubId;
		this.oriName = oriName;
		this.saveName = saveName;
		this.size = size;
		this.path = path;
		this.uploadDate = uploadDate;
	}

	public UploadVo() {
		super();
	}

	public int getAboardNo() {
		return aboardNo;
	}

	public void setAboardNo(int aboardNo) {
		this.aboardNo = aboardNo;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "UploadVo [aboardNo=" + aboardNo + ", clubId=" + clubId + ", oriName=" + oriName + ", saveName="
				+ saveName + ", size=" + size + ", path=" + path + ", uploadDate=" + uploadDate + "]";
	}
	
	
	
	
}
