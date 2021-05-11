package com.team4.localer.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SellerController {
	
	//착한발견 (셀러)
	@RequestMapping("/selBard")
	public String selBard() {
		return "deal/sellBoard";
	}
	
	
	@RequestMapping("/selWrite")
	public String selWrite() {
		return "deal/sellWrite";
	}
	
	
	
	@RequestMapping("/sellView")
	public String selView() {
		return "deal/sellView";
	}
	
	
	@RequestMapping("/sellBuy")
	public String sellBuy() {
		return "deal/sellBuy";
	}
	
	@RequestMapping("/sellerInfo")
	public String sellerInfo() {
		return "deal/sellerInfo";
	}
	
	
}
