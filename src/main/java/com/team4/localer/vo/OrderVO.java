package com.team4.localer.vo;

public class OrderVO {
	private int o_num;
	private String userid; //구매자 아이디
	private int num;
	private String opt_str;
	private int o_mtd;
	private String card_num;
	private String card_com;
	private int o_cnt;
	private int o_price;
	private int o_ship;
	private String o_date;
	private int o_conf;
	private String o_status;
	
	/////sell_item
	private int i_num;
	private String i_subject;
	private String i_userid; //판매자 아이디
	private String i_price;//원래가격
	private String i_img1;
	private int fu_money;
	private int hap_money;
	
	
	public int getFu_money() {
		return fu_money;
	}
	public void setFu_money(int fu_money) {
		this.fu_money = fu_money;
	}
	public int getHap_money() {
		return hap_money;
	}
	public void setHap_money(int hap_money) {
		this.hap_money = hap_money;
	}
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOpt_str() {
		return opt_str;
	}
	public void setOpt_str(String opt_str) {
		this.opt_str = opt_str;
	}
	public int getO_mtd() {
		return o_mtd;
	}
	public void setO_mtd(int o_mtd) {
		this.o_mtd = o_mtd;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getCard_com() {
		return card_com;
	}
	public void setCard_com(String card_com) {
		this.card_com = card_com;
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
	public int getO_ship() {
		return o_ship;
	}
	public void setO_ship(int o_ship) {
		this.o_ship = o_ship;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getO_conf() {
		return o_conf;
	}
	public void setO_conf(int o_conf) {
		this.o_conf = o_conf;
	}
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	
	
	
	public String getI_userid() {
		return i_userid;
	}
	public void setI_userid(String i_userid) {
		this.i_userid = i_userid;
	}
	public String getI_price() {
		return i_price;
	}
	public void setI_price(String i_price) {
		this.i_price = i_price;
	}
	public String getI_subject() {
		return i_subject;
	}
	public void setI_subject(String i_subject) {
		this.i_subject = i_subject;
	}
	public String getI_img1() {
		return i_img1;
	}
	public void setI_img1(String i_img1) {
		this.i_img1 = i_img1;
	}
	
	
	
}
