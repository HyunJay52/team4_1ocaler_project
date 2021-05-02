package com.team4.localer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DealController {
	
	//착한발견 (셀러)
	@RequestMapping("/selBard")
	public String selBard() {
		return "deal/sellBoard";
	}
	//동네직구(회원)
	@RequestMapping("/memberBoard")
	public String memberBoard() {
		return "deal/memberBoard";
	}
	
	@RequestMapping("/selWrite")
	public String selWrite() {
		return "deal/sellWrite";
	}
	
	@RequestMapping("/memberWrite")
	public String memberWrite() {
		 return "deal/memberWrite";
	}
	
	@RequestMapping("/memberView")
	public String memberView() {
		return "deal/memberView";
	}
	
	@RequestMapping("/sellView")
	public String selView() {
		return "deal/sellView";
	}
	@RequestMapping("/memberEdit")
	public String memeberEdit() {
		return	"deal/memberEdit";
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
