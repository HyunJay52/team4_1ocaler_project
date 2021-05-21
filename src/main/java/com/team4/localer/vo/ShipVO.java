package com.team4.localer.vo;

public class ShipVO {
	private int o_num;     // 주문번호
	private String buyer;  // 구매하는사람
	private String getter; // 받는사람
	private String sender; // 보내는사람(셀러)
	private int ship_no;	// 송장번호
	private String ship_com; //택배사
	
	private String ship_zip; //우편번호
	private String ship_addr; //주소
	private String ship_detail; //상세주소
	private String ship_tel; //연락처
	private String shipping; // 배송상태
	private String b_date; //구매일
	
	private String ship_date; //발송일
	private String ship_msg; //요청사항
	private int ship_cnt; //배송수량
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getGetter() {
		return getter;
	}
	public void setGetter(String getter) {
		this.getter = getter;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public int getShip_no() {
		return ship_no;
	}
	public void setShip_no(int ship_no) {
		this.ship_no = ship_no;
	}
	public String getShip_com() {
		return ship_com;
	}
	public void setShip_com(String ship_com) {
		this.ship_com = ship_com;
	}
	public String getShip_zip() {
		return ship_zip;
	}
	public void setShip_zip(String ship_zip) {
		this.ship_zip = ship_zip;
	}
	public String getShip_addr() {
		return ship_addr;
	}
	public void setShip_addr(String ship_addr) {
		this.ship_addr = ship_addr;
	}
	public String getShip_detail() {
		return ship_detail;
	}
	public void setShip_detail(String ship_detail) {
		this.ship_detail = ship_detail;
	}
	public String getShip_tel() {
		return ship_tel;
	}
	public void setShip_tel(String ship_tel) {
		this.ship_tel = ship_tel;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getShip_date() {
		return ship_date;
	}
	public void setShip_date(String ship_date) {
		this.ship_date = ship_date;
	}
	public String getShip_msg() {
		return ship_msg;
	}
	public void setShip_msg(String ship_msg) {
		this.ship_msg = ship_msg;
	}
	public int getShip_cnt() {
		return ship_cnt;
	}
	public void setShip_cnt(int ship_cnt) {
		this.ship_cnt = ship_cnt;
	}
	



}
