package com.firmeet.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

public class ClubVo {

	private int clubId;
	private String clubName;
	private Date cre_date;
	private int max;
	private int preNum;
	private String intro1;
	private String intro2;
	private String address1;
	private String address2;
	private String img1;
	private String img2;
	private String detailT;
	private String detailL;
	private String detailP;
	private String detailE;
	private String detailW;
	private int[] tagNo; /* form=>컨트롤러 */
	private List<TagVo> clubTagList;
	
	private CategoryVo cateVO;
	private TagVo tagVo;
	private int memlevel;
	private int clubMemNo;
	private String color1;
	private String color2;
	private String color3;
	private String color4;
	private int colorType;
	
	
	/* public List<TagVo> tagList; */ /* DB=>화면 */

	private int cateNo;
	private String category;

	public ClubVo() {
		super();
	}

	public ClubVo(int clubId, String clubName, int memlevel) {
		super();
		this.clubId = clubId;
		this.clubName = clubName;
		this.memlevel = memlevel;
	}

	public ClubVo(int clubId, String clubName, Date cre_date, int max, int preNum, String intro1, String intro2,
			String address1, String address2, String img1, String img2, String detailT, String detailL, String detailP,
			String detailE, String detailW, int[] tagNo, CategoryVo cateVO, TagVo tagVo, int cateNo, String category) {
		super();
		this.clubId = clubId;
		this.clubName = clubName;
		this.cre_date = cre_date;
		this.max = max;
		this.preNum = preNum;
		this.intro1 = intro1;
		this.intro2 = intro2;
		this.address1 = address1;
		this.address2 = address2;
		this.img1 = img1;
		this.img2 = img2;
		this.detailT = detailT;
		this.detailL = detailL;
		this.detailP = detailP;
		this.detailE = detailE;
		this.detailW = detailW;
		this.tagNo = tagNo;
		this.cateVO = cateVO;
		this.tagVo = tagVo;
		this.cateNo = cateNo;
		this.category = category;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public Date getCre_date() {
		return cre_date;
	}

	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getPreNum() {
		return preNum;
	}

	public void setPreNum(int preNum) {
		this.preNum = preNum;
	}

	public String getIntro1() {
		return intro1;
	}

	public void setIntro1(String intro1) {
		this.intro1 = intro1;
	}

	public String getIntro2() {
		return intro2;
	}

	public void setIntro2(String intro2) {
		this.intro2 = intro2;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getDetailT() {
		return detailT;
	}

	public void setDetailT(String detailT) {
		this.detailT = detailT;
	}

	public String getDetailL() {
		return detailL;
	}

	public void setDetailL(String detailL) {
		this.detailL = detailL;
	}

	public String getDetailP() {
		return detailP;
	}

	public void setDetailP(String detailP) {
		this.detailP = detailP;
	}

	public String getDetailE() {
		return detailE;
	}

	public void setDetailE(String detailE) {
		this.detailE = detailE;
	}

	public String getDetailW() {
		return detailW;
	}

	public void setDetailW(String detailW) {
		this.detailW = detailW;
	}

	public int[] getTagNo() {
		return tagNo;
	}

	public void setTagNo(int[] tagNo) {
		this.tagNo = tagNo;
	}

	public CategoryVo getCateVO() {
		return cateVO;
	}

	public void setCateVO(CategoryVo cateVO) {
		this.cateVO = cateVO;
	}

	public TagVo getTagVo() {
		return tagVo;
	}

	public void setTagVo(TagVo tagVo) {
		this.tagVo = tagVo;
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

	public int getMemlevel() {
		return memlevel;
	}

	public void setMemlevel(int memlevel) {
		this.memlevel = memlevel;
	}

	public List<TagVo> getClubTagList() {
		return clubTagList;
	}

	public void setClubTagList(List<TagVo> clubTagList) {
		this.clubTagList = clubTagList;
	}
	
	
	
	public int getClubMemNo() {
		return clubMemNo;
	}

	public void setClubMemNo(int clubMemNo) {
		this.clubMemNo = clubMemNo;
	}

	public String getColor1() {
		return color1;
	}

	public void setColor1(String color1) {
		this.color1 = color1;
	}

	public String getColor2() {
		return color2;
	}

	public void setColor2(String color2) {
		this.color2 = color2;
	}

	public String getColor3() {
		return color3;
	}

	public void setColor3(String color3) {
		this.color3 = color3;
	}

	public String getColor4() {
		return color4;
	}

	public void setColor4(String color4) {
		this.color4 = color4;
	}

	
	public int getColorType() {
		return colorType;
	}

	public void setColorType(int colorType) {
		this.colorType = colorType;
	}

	@Override
	public String toString() {
		return "ClubVo [clubId=" + clubId + ", clubName=" + clubName + ", cre_date=" + cre_date + ", max=" + max
				+ ", preNum=" + preNum + ", intro1=" + intro1 + ", intro2=" + intro2 + ", address1=" + address1
				+ ", address2=" + address2 + ", img1=" + img1 + ", img2=" + img2 + ", detailT=" + detailT + ", detailL="
				+ detailL + ", detailP=" + detailP + ", detailE=" + detailE + ", detailW=" + detailW + ", tagNo="
				+ Arrays.toString(tagNo) + ", clubTagList=" + clubTagList + ", cateVO=" + cateVO + ", tagVo=" + tagVo
				+ ", memlevel=" + memlevel + ", clubMemNo=" + clubMemNo + ", color1=" + color1 + ", color2=" + color2
				+ ", color3=" + color3 + ", color4=" + color4 + ", colorType=" + colorType + ", cateNo=" + cateNo
				+ ", category=" + category + "]";
	}

	

	
}
