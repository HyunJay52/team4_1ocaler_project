package com.team4.localer.vo;

public class Item_optionVO {
	private int opt_num; // 옵션번호
	private int i_num;//셀러판매글번호
	private String option_title;//옵션제목
	private String option_content;//옵션내용
	private String o_price; //옵션가격

	private String[] option_titles;
	private String[] option_contents;
	private String[] o_prices;
	
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
	
	//나누기
	public void setOption_title(String option_title) {
		this.option_title = option_title;		
		option_titles = option_title.split(",");
	}

	public String getOption_content() {
		return option_content;
	}
	
	//나누기 
	public void setOption_content(String option_content) {
		this.option_content = option_content;	
		option_contents = option_content.split(",");
	}
	
	public String getO_price() {
		return o_price;
	}
	
	//나누기
	public void setO_price(String o_price) {
		this.o_price = o_price;
		o_prices = o_price.split(","); 

		
	}
	
	
	
	
	public String[] getOption_titles() {
		return option_titles;
	}
	public void setOption_titles(String[] option_titles) {
		this.option_titles = option_titles;
	}
	public String[] getOption_contents() {
		return option_contents;
	}
	public void setOption_contents(String[] option_contents) {
		this.option_contents = option_contents;
	}
	public String[] getO_prices() {
		return o_prices;
	}
	public void setO_prices(String[] o_prices) {
		this.o_prices = o_prices;
	}


	
	
	
	

	
	
	
	
	
	




}
