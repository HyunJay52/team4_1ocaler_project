package com.team4.localer.vo;

public class BoardVO {
	
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
	
	private String locgu;
	
	private String recipe_cate;
	
	//좋아요갯수
	private int numlike;
	
	//댓글갯수
	private int repcont;
	
	//게시글 순번
	private String numselect;  
	
	//배열?
	private int gu_select;
	
	//신고횟수
	private int reportCount;

	// 새로운글 
	private int newDate;
	
	
	//플필그거
	private String mem_sub;
	private String mem_post;
	private String mem_rev;
	private String mem_prof;
	private String mem_nick;
	

	// 그거.. 음....썸네일사진
	private String b_img1;

	public String getB_img1() {
		return b_img1;
	}

	public void setB_img1(String b_img1) {
		this.b_img1 = b_img1;
	}

	public int getNumlike() {
		return numlike;
	}

	public void setNumlike(int numlike) {
		this.numlike = numlike;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public int getGu_select() {
		return gu_select;
	}

	public void setGu_select(int gu_select) {
		this.gu_select = gu_select;
	}

	public String getNumselect() {
		return numselect;
	}

	public void setNumselect(String numselect) {
		this.numselect = numselect;
	}

	public int getRepcont() {
		return repcont;
	}

	public void setRepcont(int repcont) {
		this.repcont = repcont;
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

	public String getLocgu() {
		return locgu;
	}

	public void setLocgu(String locgu) {
		this.locgu = locgu;
	}

	public String getRecipe_cate() {
		return recipe_cate;
	}

	public void setRecipe_cate(String recipe_cate) {
		this.recipe_cate = recipe_cate;
	}

	public int getNewDate() {
		return newDate;
	}

	public void setNewDate(int newDate) {
		this.newDate = newDate;
	}

	public String getMem_sub() {
		return mem_sub;
	}

	public void setMem_sub(String mem_sub) {
		this.mem_sub = mem_sub;
	}

	public String getMem_post() {
		return mem_post;
	}

	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}

	public String getMem_rev() {
		return mem_rev;
	}

	public void setMem_rev(String mem_rev) {
		this.mem_rev = mem_rev;
	}

	public String getMem_prof() {
		return mem_prof;
	}

	public void setMem_prof(String mem_prof) {
		this.mem_prof = mem_prof;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	
	
	
	
	
}
