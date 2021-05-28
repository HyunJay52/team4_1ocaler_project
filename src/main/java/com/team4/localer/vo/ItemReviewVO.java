package com.team4.localer.vo;

public class ItemReviewVO {
	private int re_num;
	private String userid;
	private int num;
	private int re_rate;
	private String re_content;
	private String re_img;
	private String re_writedate;
	
	private String re_subject; //각 상품들의 제목을 re_subject로 담는다
	private String sellerid;

	
	//21-05-24 //총갯수가져올 변수만듬
	private int totalCnt;
	private int reRate1;
	
	public String getRe_subject() {
		return re_subject;
	}
	public void setRe_subject(String re_subject) {
		this.re_subject = re_subject;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
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
	public int getRe_rate() {
		return re_rate;
	}
	public void setRe_rate(int re_rate) {
		this.re_rate = re_rate;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_img() {
		return re_img;
	}
	public void setRe_img(String re_img) {
		this.re_img = re_img;
	}
	public String getRe_writedate() {
		return re_writedate;
	}
	public void setRe_writedate(String re_writedate) {
		this.re_writedate = re_writedate;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getReRate1() {
		return reRate1;
	}
	public void setReRate1(int reRate1) {
		this.reRate1 = reRate1;
	}
	
	
}
