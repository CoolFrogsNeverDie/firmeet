package com.firmeet.vo;

public class NoticeImgVO {
	
	private int aboardNo;
	private int clubId;
	private String poriginname;
	private String psaveName;
	private long psize;
	private String ppath;
	private String pdate;
	
	public NoticeImgVO(int aboardNo, int clubId, String poriginname, String psaveName, long psize, String ppath, String pdate) {
		super();
		this.aboardNo = aboardNo;
		this.clubId = clubId;
		this.poriginname = poriginname;
		this.psaveName = psaveName;
		this.psize = psize;
		this.ppath = ppath;
		this.pdate = pdate;
	}

	public NoticeImgVO() {
		
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

	public String getPoriginname() {
		return poriginname;
	}

	public void setPoriginname(String poriginname) {
		this.poriginname = poriginname;
	}

	public String getPsaveName() {
		return psaveName;
	}

	public void setPsaveName(String psaveName) {
		this.psaveName = psaveName;
	}

	public long getPsize() {
		return psize;
	}

	public void setPsize(long psize) {
		this.psize = psize;
	}

	public String getPpath() {
		return ppath;
	}

	public void setPpath(String ppath) {
		this.ppath = ppath;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	@Override
	public String toString() {
		return "NoticeImg [aboardNo=" + aboardNo + ", clubId=" + clubId + ", poriginname=" + poriginname + ", psaveName="
				+ psaveName + ", psize=" + psize + ", ppath=" + ppath + ", pdate=" + pdate + "]";
	}
	
}
