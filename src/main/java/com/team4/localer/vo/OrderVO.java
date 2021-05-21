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
	//private String i_price;//원래가격
	private String i_img1;
	private int fu_money;
	private int hap_money;

	private String sel_prof; //셀러회원 프로필 사진 
	
	//private int i_num;//셀러판매글번호
	private int sel_num;//셀러회원번호
	private String i_gu;//활동지역
	private int i_cnt;//판매수량
	private String i_content;//내용
	//private String i_img1;
	private String i_img2;
	private String i_img3;
	private int i_price;//가격
	private int i_ship;//배송비
	private String i_period;//판매기간
	private int i_status;//판매상태 1.판매중, 2.판매완료
	private String i_writedate;//등록일
	private int i_hit;
	private String i_tag;//판매글태그	
	//판매상품 판매자 아이디
	private String sellerid;

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

	public String getI_userid() {
		return i_userid;
	}

	public void setI_userid(String i_userid) {
		this.i_userid = i_userid;
	}

	public String getI_img1() {
		return i_img1;
	}

	public void setI_img1(String i_img1) {
		this.i_img1 = i_img1;
	}

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

	public String getSel_prof() {
		return sel_prof;
	}

	public void setSel_prof(String sel_prof) {
		this.sel_prof = sel_prof;
	}

	public int getSel_num() {
		return sel_num;
	}

	public void setSel_num(int sel_num) {
		this.sel_num = sel_num;
	}

	public String getI_gu() {
		return i_gu;
	}

	public void setI_gu(String i_gu) {
		this.i_gu = i_gu;
	}

	public int getI_cnt() {
		return i_cnt;
	}

	public void setI_cnt(int i_cnt) {
		this.i_cnt = i_cnt;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public String getI_img2() {
		return i_img2;
	}

	public void setI_img2(String i_img2) {
		this.i_img2 = i_img2;
	}

	public String getI_img3() {
		return i_img3;
	}

	public void setI_img3(String i_img3) {
		this.i_img3 = i_img3;
	}

	public int getI_price() {
		return i_price;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
	}

	public int getI_ship() {
		return i_ship;
	}

	public void setI_ship(int i_ship) {
		this.i_ship = i_ship;
	}

	public String getI_period() {
		return i_period;
	}

	public void setI_period(String i_period) {
		this.i_period = i_period;
	}

	public int getI_status() {
		return i_status;
	}

	public void setI_status(int i_status) {
		this.i_status = i_status;
	}

	public String getI_writedate() {
		return i_writedate;
	}

	public void setI_writedate(String i_writedate) {
		this.i_writedate = i_writedate;
	}

	public int getI_hit() {
		return i_hit;
	}

	public void setI_hit(int i_hit) {
		this.i_hit = i_hit;
	}

	public String getI_tag() {
		return i_tag;
	}

	public void setI_tag(String i_tag) {
		this.i_tag = i_tag;
	}

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	
	
	
}
