package com.team4.localer.vo;

public class QnAVO {
	private int q_num;
	private int num;
	private String userid;
	private int q_status;
	private String q_content;
	private String q_writedate;
	private String q_answer; //답변
	private String q_adate;	// 답변일
	
	//sell_item
	private int i_num;
	private int sel_num;
	private String i_subject;
	
	private String sellerid;//판매자 아이디

	
	//21-05-24 WOW
	private int qnaCnt;
	
	
	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getQ_status() {
		return q_status;
	}

	public void setQ_status(int q_status) {
		this.q_status = q_status;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_writedate() {
		return q_writedate;
	}

	public void setQ_writedate(String q_writedate) {
		this.q_writedate = q_writedate;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	public String getQ_adate() {
		return q_adate;
	}

	public void setQ_adate(String q_adate) {
		this.q_adate = q_adate;
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

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public int getQnaCnt() {
		return qnaCnt;
	}

	public void setQnaCnt(int qnaCnt) {
		this.qnaCnt = qnaCnt;
	}
	
	
	
	
}
