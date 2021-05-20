package com.team4.localer.vo;

public class ChatVO {

	//chatroom vo
	private int r_num;
	private String r_name;
	private String r_writedate;
	
	//chatmsg vo
	private String sender;
	private String getter;
	private String msg;
	private String c_writedate;
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_writedate() {
		return r_writedate;
	}
	public void setR_writedate(String r_writedate) {
		this.r_writedate = r_writedate;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getGetter() {
		return getter;
	}
	public void setGetter(String getter) {
		this.getter = getter;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getC_writedate() {
		return c_writedate;
	}
	public void setC_writedate(String c_writedate) {
		this.c_writedate = c_writedate;
	}
	
}
