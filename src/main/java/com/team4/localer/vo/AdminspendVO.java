package com.team4.localer.vo;

public class AdminspendVO {
	private int totalcharge;//총 충전금액
	private int totalspend;//총 사용금액
	private int chargemoney;//해당월 충전액,
	private int spendmoney;//해당월 사용액
	private int chargecnt;//해당월 충전회수
	private int cardcnt;//카드 충전횟수
	private int moneycnt;//무통장 충전횟수
	private String userid;//충전아이디
	private int charge_point;//충전 포인트
	private int add_point;//받아야할 포인트
	private int spend_point;//사용한 포인트
	
	//modal1 리스트 
	private int item_num;//판매글번호
	private String sel_subject;//판매글제목
	private String sel_userid;//판매자
	private String sp_date;//사용 날짜
	
	
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getSel_subject() {
		return sel_subject;
	}
	public void setSel_subject(String sel_subject) {
		this.sel_subject = sel_subject;
	}
	public String getSel_userid() {
		return sel_userid;
	}
	public void setSel_userid(String sel_userid) {
		this.sel_userid = sel_userid;
	}
	public String getSp_date() {
		return sp_date;
	}
	public void setSp_date(String sp_date) {
		this.sp_date = sp_date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	
	public int getCharge_point() {
		return charge_point;
	}
	public void setCharge_point(int charge_point) {
		this.charge_point = charge_point;
	}
	public int getAdd_point() {
		return add_point;
	}
	public void setAdd_point(int add_point) {
		this.add_point = add_point;
	}
	public int getSpend_point() {
		return spend_point;
	}
	public void setSpend_point(int spend_point) {
		this.spend_point = spend_point;
	}
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
