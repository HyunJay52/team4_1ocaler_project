package com.team4.localer.vo;

public class Item_optionVO {
	private int opt_num; // 옵션번호
	private int i_num;//셀러판매글번호
	private String option_title;//옵션제목
	private String option_content;//옵션내용
	private int o_price; //옵션가격
	public int getOpt_num() {
		return opt_num;
	}
	public void setOpt_num(int opt_num) {
		this.opt_num = opt_num;
	}
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public String getOption_title() {
		return option_title;
	}
	public void setOption_title(String option_title) {
		this.option_title = option_title;
	}
	public String getOption_content() {
		return option_content;
	}
	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	


}
