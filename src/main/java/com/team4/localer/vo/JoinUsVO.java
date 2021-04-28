package com.team4.localer.vo;

public class JoinUsVO {
	private int j_num;
	private int numJoin;
	private String userid;
	private String j_status;
	private String j_writedate;
	
	//j_status의 갯수를 저장하는 변수(디비에 저장되는건 아니고)
	/*
	 * private int j_count;
	 * 
	 * 
	 * 
	 * 
	 * public int getJ_count() { return j_count; } public void setJ_count(int
	 * j_count) { this.j_count = j_count; }
	 */
	public int getJ_num() {
		return j_num;
	}
	public void setJ_num(int j_num) {
		this.j_num = j_num;
	}
	public int getNumJoin() {
		return numJoin;
	}
	public void setNumJoin(int numJoin) {
		this.numJoin = numJoin;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getJ_status() {
		return j_status;
	}
	public void setJ_status(String j_status) {
		this.j_status = j_status;
	}
	public String getJ_writedate() {
		return j_writedate;
	}
	public void setJ_writedate(String j_writedate) {
		this.j_writedate = j_writedate;
	}
	
	
	
	
}
