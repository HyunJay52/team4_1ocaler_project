package com.team4.localer.vo;

public class AdminspendVO {
	private int totalcharge;//총 충전금액
	private int totalspend;//총 사용금액
	private int chargemoney;//해당월 충전액,
	private int spendmoney;//해당월 사용액
	private int chargecnt;//해당월 충전회수
	private int cardcnt;//카드 충전횟수
	private int moneycnt;//무통장 충전횟수
	
	public int getTotalcharge() {
		return totalcharge;
	}
	public void setTotalcharge(int totalcharge) {
		this.totalcharge = totalcharge;
	}
	public int getTotalspend() {
		return totalspend;
	}
	public void setTotalspend(int totalspend) {
		this.totalspend = totalspend;
	}
	public int getChargemoney() {
		return chargemoney;
	}
	public void setChargemoney(int chargemoney) {
		this.chargemoney = chargemoney;
	}
	public int getSpendmoney() {
		return spendmoney;
	}
	public void setSpendmoney(int spendmoney) {
		this.spendmoney = spendmoney;
	}
	public int getChargecnt() {
		return chargecnt;
	}
	public void setChargecnt(int chargecnt) {
		this.chargecnt = chargecnt;
	}
	public int getCardcnt() {
		return cardcnt;
	}
	public void setCardcnt(int cardcnt) {
		this.cardcnt = cardcnt;
	}
	public int getMoneycnt() {
		return moneycnt;
	}
	public void setMoneycnt(int moneycnt) {
		this.moneycnt = moneycnt;
	}
	
}
