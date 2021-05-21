package com.team4.localer.vo;


public class AdminstatisVO {

	//sell_item
	private int i_num;//판매글번호 
	private String i_subject;//판매글제목
	private String i_writedate;//판매글작성일
	//ordertbl sum,count 부분
	private int o_conf1;//구매확정 전
	private int o_conf2;//구매확정후 
	private int price_total;//구매확정 가격 합산 
	//회원관리 부분 통계 
	private int total;
	private int new_mem;
	private int sell_mem;
	private int hu_mem;
	private int tal_mem;
	
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getNew_mem() {
		return new_mem;
	}
	public void setNew_mem(int new_mem) {
		this.new_mem = new_mem;
	}
	public int getSell_mem() {
		return sell_mem;
	}
	public void setSell_mem(int sell_mem) {
		this.sell_mem = sell_mem;
	}
	public int getHu_mem() {
		return hu_mem;
	}
	public void setHu_mem(int hu_mem) {
		this.hu_mem = hu_mem;
	}
	public int getTal_mem() {
		return tal_mem;
	}
	public void setTal_mem(int tal_mem) {
		this.tal_mem = tal_mem;
	}
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public String getI_subject() {
		return i_subject;
	}
	public void setI_subject(String i_subject) {
		this.i_subject = i_subject;
	}
	public String getI_writedate() {
		return i_writedate;
	}
	public void setI_writedate(String i_writedate) {
		this.i_writedate = i_writedate;
	}
	public int getO_conf1() {
		return o_conf1;
	}
	public void setO_conf1(int o_conf1) {
		this.o_conf1 = o_conf1;
	}
	public int getO_conf2() {
		return o_conf2;
	}
	public void setO_conf2(int o_conf2) {
		this.o_conf2 = o_conf2;
	}
	public int getPrice_total() {
		return price_total;
	}
	public void setPrice_total(int price_total) {
		this.price_total = price_total;
	}
	

}
