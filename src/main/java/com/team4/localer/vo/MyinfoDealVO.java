package com.team4.localer.vo;

public class MyinfoDealVO {
	private int num;//회원판매글번호
	private String userid;
	
	private String share_userid;
	
	private int s_cate;//카테고리 1: 식료품, 2:생필품
	private String s_subject;//제목
	private int s_cnt;//모집인원
	private String s_content;
	private String s_img1;
	private String s_img2;
	private String s_img3;
	private String s_log;//위치
	private String s_gu;//활동지역
	private int s_price;//가격
	private String s_date;//약속날짜-시간
	private int s_status;//판매상태 1:판매중, 2:판매완료
	private String s_writedate;//등록일
	private int s_hit;
	private String s_tag;//태그
	private int reportCnt;//해당 게시글에 대한 신고 횟수
	
	//joinus
	private int j_num;
	private int numjoin;
	private String j_status;
	private String j_writedate;
	
	//판매자 아이디
	private String sellerid;
	
	
	//group
	private String g_subject;
	private String g_writedate;
	private String g_gu;
	
	
	
	public String getG_subject() {
		return g_subject;
	}
	public void setG_subject(String g_subject) {
		this.g_subject = g_subject;
	}
	public String getG_writedate() {
		return g_writedate;
	}
	public void setG_writedate(String g_writedate) {
		this.g_writedate = g_writedate;
	}
	public String getG_gu() {
		return g_gu;
	}
	public void setG_gu(String g_gu) {
		this.g_gu = g_gu;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public String getShare_userid() {
		return share_userid;
	}
	public void setShare_userid(String share_userid) {
		this.share_userid = share_userid;
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
	public int getS_cate() {
		return s_cate;
	}
	public void setS_cate(int s_cate) {
		this.s_cate = s_cate;
	}
	public String getS_subject() {
		return s_subject;
	}
	public void setS_subject(String s_subject) {
		this.s_subject = s_subject;
	}
	public int getS_cnt() {
		return s_cnt;
	}
	public void setS_cnt(int s_cnt) {
		this.s_cnt = s_cnt;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_img1() {
		return s_img1;
	}
	public void setS_img1(String s_img1) {
		this.s_img1 = s_img1;
	}
	public String getS_img2() {
		return s_img2;
	}
	public void setS_img2(String s_img2) {
		this.s_img2 = s_img2;
	}
	public String getS_img3() {
		return s_img3;
	}
	public void setS_img3(String s_img3) {
		this.s_img3 = s_img3;
	}
	public String getS_log() {
		return s_log;
	}
	public void setS_log(String s_log) {
		this.s_log = s_log;
	}
	public String getS_gu() {
		return s_gu;
	}
	public void setS_gu(String s_gu) {
		this.s_gu = s_gu;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public int getS_status() {
		return s_status;
	}
	public void setS_status(int s_status) {
		this.s_status = s_status;
	}
	public String getS_writedate() {
		return s_writedate;
	}
	public void setS_writedate(String s_writedate) {
		this.s_writedate = s_writedate;
	}
	public int getS_hit() {
		return s_hit;
	}
	public void setS_hit(int s_hit) {
		this.s_hit = s_hit;
	}
	public String getS_tag() {
		return s_tag;
	}
	public void setS_tag(String s_tag) {
		this.s_tag = s_tag;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public int getJ_num() {
		return j_num;
	}
	public void setJ_num(int j_num) {
		this.j_num = j_num;
	}
	public int getNumjoin() {
		return numjoin;
	}
	public void setNumjoin(int numjoin) {
		this.numjoin = numjoin;
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
