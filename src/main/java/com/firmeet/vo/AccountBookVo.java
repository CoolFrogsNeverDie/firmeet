package com.firmeet.vo;

import java.util.Date;

public class AccountBookVo {
    private int id;
    private int clubId;
    private int meetNo;
    private String memberId;
    private int amount;
    private String datetime;
    private String category;
    private String purpose;
    private String incomeExpense;
    private String receipt;
    private int payment;
    
    public AccountBookVo() {
    	  // 기본 생성자 내용
    	}
    
	public AccountBookVo(int id, int clubId, int meetNo, String memberId, int amount, String datetime, String category,
			String purpose, String incomeExpense, String receipt, int payment) {
		super();
		this.id = id;
		this.clubId = clubId;
		this.meetNo = meetNo;
		this.memberId = memberId;
		this.amount = amount;
		this.datetime = datetime;
		this.category = category;
		this.purpose = purpose;
		this.incomeExpense = incomeExpense;
		this.receipt = receipt;
		this.payment = payment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getIncomeExpense() {
		return incomeExpense;
	}

	public void setIncomeExpense(String incomeExpense) {
		this.incomeExpense = incomeExpense;
	}

	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "AccountBookVo [id=" + id + ", clubId=" + clubId + ", meetNo=" + meetNo + ", memberId=" + memberId
				+ ", amount=" + amount + ", datetime=" + datetime + ", category=" + category + ", purpose=" + purpose
				+ ", incomeExpense=" + incomeExpense + ", receipt=" + receipt + ", payment=" + payment + "]";
	}
}
