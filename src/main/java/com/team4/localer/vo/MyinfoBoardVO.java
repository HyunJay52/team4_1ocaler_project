package com.team4.localer.vo;

public class MyinfoBoardVO {
	private int num;
	private String userid;
	private String b_gu;
	private int up_cate;
	private int down_cate;
	private String b_subject;
	private String b_content;
	private String b_writedate;
	private int b_hit;
	private String b_tag;
	private String b_img1;
	
	//댓글
	private int rep_num;
	private String rep_content;
	private String rep_date;
	
	//댓글 수
	private int reply;
	
	//qna
	private int q_num;
	private int q_status;
	private String q_content;
	private String q_writedate;
	private String q_answer; //답변
	private String q_adate;	// 답변일
	
	//sell_item
	private int i_num;
	private int sel_num;
	private String i_subject;
	private String sellerid;
	
	
	
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
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
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public String getRep_date() {
		return rep_date;
	}
	public void setRep_date(String rep_date) {
		this.rep_date = rep_date;
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
	public String getB_gu() {
		return b_gu;
	}
	public void setB_gu(String b_gu) {
		this.b_gu = b_gu;
	}
	public int getUp_cate() {
		return up_cate;
	}
	public void setUp_cate(int up_cate) {
		this.up_cate = up_cate;
	}
	public int getDown_cate() {
		return down_cate;
	}
	public void setDown_cate(int down_cate) {
		this.down_cate = down_cate;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writedate() {
		return b_writedate;
	}
	public void setB_writedate(String b_writedate) {
		this.b_writedate = b_writedate;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public String getB_tag() {
		return b_tag;
	}
	public void setB_tag(String b_tag) {
		this.b_tag = b_tag;
	}
	public String getB_img1() {
		return b_img1;
	}
	public void setB_img1(String b_img1) {
		this.b_img1 = b_img1;
	}
	
	
}
