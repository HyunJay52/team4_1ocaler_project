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
	//셀러정산 부분
	private int totalsale;//총매출
	private int totalmoney;//총수익
	private int monthsale;//이번달 매출
	private int monthmoney;//이번달 수익
	private int month1;//3월 총 판매글
	private int month2;//4월 총 판매글
	private int month3;//5월 총 판매글
	private int sp_be;//정산전
	private int sp_af;//정산완료
	private int sel_num;
	private int sel_cnt;//판매수량
	private int sel_price;//판매가격
	private int fee;//수수료
	private int remoney;//정산금

	//modal1 리스트 
	private int item_num;//판매글번호
	private String sel_subject;//판매글제목
	private String sel_userid;//판매자
	private String sp_date;//사용 날짜
	//selspend modal리스트
	private int num;
	private int o_cnt;
	private int o_price;
	private String o_date;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getO_cnt() {
		return o_cnt;
	}
	public void setO_cnt(int o_cnt) {
		this.o_cnt = o_cnt;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getRemoney() {
		return remoney;
	}
	public void setRemoney(int remoney) {
		this.remoney = remoney;
	}
	public int getSel_num() {
		return sel_num;
	}
	public void setSel_num(int sel_num) {
		this.sel_num = sel_num;
	}
	public int getSel_cnt() {
		return sel_cnt;
	}
	public void setSel_cnt(int sel_cnt) {
		this.sel_cnt = sel_cnt;
	}
	public int getSel_price() {
		return sel_price;
	}
	public void setSel_price(int sel_price) {
		this.sel_price = sel_price;
	}
	public int getSp_be() {
		return sp_be;
	}
	public void setSp_be(int sp_be) {
		this.sp_be = sp_be;
	}
	public int getSp_af() {
		return sp_af;
	}
	public void setSp_af(int sp_af) {
		this.sp_af = sp_af;
	}
	public int getMonth1() {
		return month1;
	}
	public void setMonth1(int month1) {
		this.month1 = month1;
	}
	public int getMonth2() {
		return month2;
	}
	public void setMonth2(int month2) {
		this.month2 = month2;
	}
	public int getMonth3() {
		return month3;
	}
	public void setMonth3(int month3) {
		this.month3 = month3;
	}
	public int getMonthsale() {
		return monthsale;
	}
	public void setMonthsale(int monthsale) {
		this.monthsale = monthsale;
	}
	public int getMonthmoney() {
		return monthmoney;
	}
	public void setMonthmoney(int monthmoney) {
		this.monthmoney = monthmoney;
	}
	public int getTotalsale() {
		return totalsale;
	}
	public void setTotalsale(int totalsale) {
		this.totalsale = totalsale;
	}
	public int getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(int totalmoney) {
		this.totalmoney = totalmoney;
	}
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
