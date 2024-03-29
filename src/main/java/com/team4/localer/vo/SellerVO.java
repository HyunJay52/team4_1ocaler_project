package com.team4.localer.vo;

public class SellerVO {
	private int sel_num;//셀러번호
	private String userid;
	private int sel_lvl;//셀러등급
	private String sel_name;//사업자명
	private String company;//상호명
	private String com_num;//사업자번호
	private String com_numStr;
	private String sel_tel;//고객상담번호
	private String sel_telStr;
	private String sel_email;//판매자 이메일
	private int sel_zip;//우편번호
	private String sel_addr;//주소
	private String sel_detail;//상세주소
	private String sel_prof;//셀러프로필
	private String sel_content;//셀러설명
	private String bank;//은행명
	private String acc_name;//계좌주
	private String account;
	private int sel_count;//판매자 게시글 개수
	//private int account;계좌번호
	private String sel_date;//셀러 신청일,승인일
	private int sel_status;//셀러 상태정보 0:탈퇴, 1:활동, 2:정지
	
	
	//판매자 관리 페이지 필요에 의한 변수,,,ㅎ
	private int mem_status;//1.정상, 2.휴면, 3.블랙,
	private int mem_type;//1.일반, 2.셀러
	private int reportCount;//쌓인신고
	
	//2021.05.24 hj
	private int rec_m;
	private int qnacnt;
//	private String rec_m;
//	private String qnacnt;
	
	private int selljoinCnt;
	
	
	
	
	public int getSelljoinCnt() {
		return selljoinCnt;
	}
	public void setSelljoinCnt(int selljoinCnt) {
		this.selljoinCnt = selljoinCnt;
	}
	public String getCom_numStr() {
		com_numStr=com_num.substring(0,3)+"-";
		com_numStr+=com_num.substring(3,5)+"-";
		com_numStr+=com_num.substring(5);
		return com_numStr;
	}
	public void setCom_numStr(String com_numStr) {
		this.com_numStr = com_numStr;
	}
	public String getSel_telStr() {
		sel_telStr=sel_tel.substring(0,3)+"-";
		sel_telStr+=sel_tel.substring(3,7)+"-";
		sel_telStr+=sel_tel.substring(7);
		return sel_telStr;
	}
	public void setSel_telStr(String sel_telStr) {
		this.sel_telStr = sel_telStr;
	}
	public int getSel_count() {
		return sel_count;
	}
	public void setSel_count(int sel_count) {
		this.sel_count = sel_count;
	}
	public int getSel_num() {
		return sel_num;
	}
	public void setSel_num(int sel_num) {
		this.sel_num = sel_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSel_lvl() {
		return sel_lvl;
	}
	public void setSel_lvl(int sel_lvl) {
		this.sel_lvl = sel_lvl;
	}
	public String getSel_name() {
		return sel_name;
	}
	public void setSel_name(String sel_name) {
		this.sel_name = sel_name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCom_num() {
		return com_num;
	}
	public void setCom_num(String com_num) {
		this.com_num = com_num;
	}
	public String getSel_tel() {
		return sel_tel;
	}
	public void setSel_tel(String sel_tel) {
		this.sel_tel = sel_tel;
	}
	public String getSel_email() {
		return sel_email;
	}
	public void setSel_email(String sel_email) {
		this.sel_email = sel_email;
	}
	public int getSel_zip() {
		return sel_zip;
	}
	public void setSel_zip(int sel_zip) {
		this.sel_zip = sel_zip;
	}
	public String getSel_addr() {
		return sel_addr;
	}
	public void setSel_addr(String sel_addr) {
		this.sel_addr = sel_addr;
	}
	public String getSel_detail() {
		return sel_detail;
	}
	public void setSel_detail(String sel_detail) {
		this.sel_detail = sel_detail;
	}
	public String getSel_prof() {
		return sel_prof;
	}
	public void setSel_prof(String sel_prof) {
		this.sel_prof = sel_prof;
	}
	public String getSel_content() {
		return sel_content;
	}
	public void setSel_content(String sel_content) {
		this.sel_content = sel_content;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getSel_date() {
		return sel_date;
	}
	public void setSel_date(String sel_date) {
		this.sel_date = sel_date;
	}
	public int getSell_status() {
		return sel_status;
	}
	public void setSell_status(int sel_status) {
		this.sel_status = sel_status;
	}
	public int getMem_status() {
		return mem_status;
	}
	public void setMem_status(int mem_status) {
		this.mem_status = mem_status;
	}
	public int getMem_type() {
		return mem_type;
	}
	public void setMem_type(int mem_type) {
		this.mem_type = mem_type;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public int getSel_status() {
		return sel_status;
	}
	public void setSel_status(int sel_status) {
		this.sel_status = sel_status;
	}
	public int getRec_m() {
		return rec_m;
	}
	public void setRec_m(int rec_m) {
		this.rec_m = rec_m;
	}
	public int getQnacnt() {
		return qnacnt;
	}
	public void setQnacnt(int qnacnt) {
		this.qnacnt = qnacnt;
	}
//	public String getRec_m() {
//		return rec_m;
//	}
//	public void setRec_m(String rec_m) {
//		this.rec_m = rec_m;
//	}
//	public String getQnacnt() {
//		return qnacnt;
//	}
//	public void setQnacnt(String qnacnt) {
//		this.qnacnt = qnacnt;
//	}
}
