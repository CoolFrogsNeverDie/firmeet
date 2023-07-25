package com.firmeet.vo;

import java.sql.Date;
import java.util.List;

public class ClubVo {

		public int clubId;
		public String clubName;
		public Date cre_date;
		public int max;
		public int preNum;
		public String intro1;
		public String intro2;
		public String address1;
		public String address2;
		public String img1;
		public String img2;
		public String detailT;
		public String detailL;
		public String detailP;
		public String detailE;
		public String detailW;
		
		private List<Integer> tagNo;

		private CategoryVo cateVO;
		private TagVo tagVo;
		
		public ClubVo(int clubId, String clubName, Date cre_date, int max, int preNum, String intro1, String intro2,
				String address1, String address2, String img1, String img2, String detailT, String detailL,
				String detailP, String detailE, String detailW) {
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
		}

		public ClubVo() {
			super();
		}

		public int getClubId() {
			return clubId;
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

		public List<Integer> getTagNo() {
			return tagNo;
		}
		
		public void setTagNo(List<Integer> tagNo) {
			this.tagNo = tagNo;
		}
		
		@Override
		public String toString() {
			return "ClubVo [clubId=" + clubId + ", clubName=" + clubName + ", cre_date=" + cre_date + ", max=" + max
					+ ", preNum=" + preNum + ", intro1=" + intro1 + ", intro2=" + intro2 + ", address1=" + address1
					+ ", address2=" + address2 + ", img1=" + img1 + ", img2=" + img2 + ", detailT=" + detailT
					+ ", detailL=" + detailL + ", detailP=" + detailP + ", detailE=" + detailE + ", detailW=" + detailW
					+ "]";
		}
		
		
		
}
