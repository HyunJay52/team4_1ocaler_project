package com.team4.localer.vo;

import java.text.NumberFormat;

public class SellitemVO {
	private String userid;//작성자
	private String sel_prof; //셀러회원 프로필 사진 
	
	private int i_num;//셀러판매글번호
	private int sel_num;//셀러회원번호
	private String i_subject;
	private String i_gu;//활동지역
	private int i_cnt;//판매수량
	private String i_content;//내용
	private String i_img1;
	private String i_img2;
	private String i_img3;
	private int i_price;//가격
	private String i_priceStr;
	private int i_ship;//배송비
	private String i_period;//판매기간
	private int i_status;//판매상태 1.판매중, 2.판매완료
	private String i_writedate;//등록일
	private int i_hit;
	private String i_tag;//판매글태그

	private int orderCount; //주문 수
	private int revenue; // 총 판매액
	
	private int myItem; // 내 아이템 수
	private int sale; // 판매 중
	private int completed; // 판매 완료
	private int expected; // 종료 예정
	private int itemStop;// 판매 중단
	 
	
	
	public int getMyItem() {
		return myItem;
	}
	public void setMyItem(int myItem) {
		this.myItem = myItem;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getCompleted() {
		return completed;
	}
	public void setCompleted(int completed) {
		this.completed = completed;
	}
	public int getExpected() {
		return expected;
	}
	public void setExpected(int expected) {
		this.expected = expected;
	}
	public int getItemStop() {
		return itemStop;
	}
	public void setItemStop(int itemStop) {
		this.itemStop = itemStop;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getRevenue() {
		return revenue;
	}
	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}
	public String getI_priceStr() {
		i_priceStr = NumberFormat.getInstance().format(i_price);
		return i_priceStr;
	}
	public void setI_priceStr(String i_priceStr) {
		this.i_priceStr = i_priceStr;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSel_prof() {
		return sel_prof;
	}
	public void setSel_prof(String sel_prof) {
		this.sel_prof = sel_prof;
	}
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public int getSel_num() {
		return sel_num;
	}
	public void setSel_num(int sel_num) {
		this.sel_num = sel_num;
	}
	public String getI_subject() {
		return i_subject;
	}
	public void setI_subject(String i_subject) {
		this.i_subject = i_subject;
	}
	public String getI_gu() {
		return i_gu;
	}
	public void setI_gu(String i_gu) {
		this.i_gu = i_gu;
	}
	public int getI_cnt() {
		return i_cnt;
	}
	public void setI_cnt(int i_cnt) {
		this.i_cnt = i_cnt;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	public String getI_img1() {
		return i_img1;
	}
	public void setI_img1(String i_img1) {
		this.i_img1 = i_img1;
	}
	public String getI_img2() {
		return i_img2;
	}
	public void setI_img2(String i_img2) {
		this.i_img2 = i_img2;
	}
	public String getI_img3() {
		return i_img3;
	}
	public void setI_img3(String i_img3) {
		this.i_img3 = i_img3;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public int getI_ship() {
		return i_ship;
	}
	public void setI_ship(int i_ship) {
		this.i_ship = i_ship;
	}
	public String getI_period() {
		return i_period;
	}
	public void setI_period(String i_period) {
		this.i_period = i_period;
	}
	public int getI_status() {
		return i_status;
	}
	public void setI_status(int i_status) {
		this.i_status = i_status;
	}
	public String getI_writedate() {
		return i_writedate;
	}
	public void setI_writedate(String i_writedate) {
		this.i_writedate = i_writedate;
	}
	public int getI_hit() {
		return i_hit;
	}
	public void setI_hit(int i_hit) {
		this.i_hit = i_hit;
	}
	public String getI_tag() {
		return i_tag;
	}
	public void setI_tag(String i_tag) {
		this.i_tag = i_tag;
	}

	
	
}
