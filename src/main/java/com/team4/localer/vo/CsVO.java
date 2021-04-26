package com.team4.localer.vo;

public class CsVO {
	private int cs_num;
	private String userid;
	private String cs_cate; //카테고리
	private String cs_subject;
	private String cs_content;
	private int cs_status; //상태  1:미처리 2:처리완료
	private String cs_answer;
	private String cs_writedate; //문의등록일
	private String cs_date; //답변등록일
	
	public int getCs_num() {
		return cs_num;
	}
	public void setCs_num(int cs_num) {
		this.cs_num = cs_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCs_cate() {
		return cs_cate;
	}
	public void setCs_cate(String cs_cate) {
		this.cs_cate = cs_cate;
	}
	public String getCs_subject() {
		return cs_subject;
	}
	public void setCs_subject(String cs_subject) {
		this.cs_subject = cs_subject;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	
	public int getCs_status() {
		return cs_status;
	}
	public void setCs_status(int cs_status) {
		this.cs_status = cs_status;
	}
	public String getCs_answer() {
		return cs_answer;
	}
	public void setCs_answer(String cs_answer) {
		this.cs_answer = cs_answer;
	}
	public String getCs_writedate() {
		return cs_writedate;
	}
	public void setCs_writedate(String cs_writedate) {
		this.cs_writedate = cs_writedate;
	}
	public String getCs_date() {
		return cs_date;
	}
	public void setCs_date(String cs_date) {
		this.cs_date = cs_date;
	}
	

}
