package com.team4.localer.vo;

public class Item_optionVO {
	private int opt_num; // 옵션번호
	private int i_num;//셀러판매글번호
	private String[] option_title;//옵션제목
	private String[] option_content;//옵션내용
	private int[] o_price; //옵션가격
	
	private String option_title_str;
	private String option_content_str;
	private String o_price_str;

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

	public int[] getO_price() {
		return o_price;
	}
	public void setO_price(int[] o_price) {
		this.o_price = o_price;
		
		String o_price_variable = "";
		for(int i=0; i<o_price.length; i++) {
			o_price_variable += o_price[i]+"/";
		}
		o_price_str = o_price_variable;
		
	}
	public String[] getOption_title() {
		return option_title;
	}
	public void setOption_title(String[] option_title) {
		this.option_title = option_title;
		
		String option_title_variable = "";
		for(int i=0; i<option_title.length; i++) {
			option_title_variable += option_title[i]+"/";
		}
		option_title_str = option_title_variable;
		
	}
	public String[] getOption_content() {
		return option_content;
	}
	public void setOption_content(String[] option_content) {
		this.option_content = option_content;
		
		String option_content_variable = "";
		for(int i=0; i<option_content.length; i++) {
			option_content_variable += option_content[i]+"/";
		}
		option_content_str = option_content_variable;
		
	}
	public String getOption_title_str() {
		return option_title_str;
	}
	public void setOption_title_str(String option_title_str) {
		this.option_title_str = option_title_str;
	}
	public String getOption_content_str() {
		return option_content_str;
	}
	public void setOption_content_str(String option_content_str) {
		this.option_content_str = option_content_str;
	}
	public String getO_price_str() {
		return o_price_str;
	}
	public void setO_price_str(String o_price_str) {
		this.o_price_str = o_price_str;
	}



}
