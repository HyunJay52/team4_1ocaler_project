package com.team4.localer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyinfoController {
	
	@RequestMapping("/myInfoCheck")
	public String myInfoCheck() {
		return "/myInfo/myInfoCheck";
	}
	@RequestMapping("/pwdCheck")
	public ModelAndView pwdCheck(String userpwd, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myInfo/myInfo");
		
		return mav;
	}
	@RequestMapping("/info")
	public String main() {
		return "myInfo/myInfoMain";
	}
	@RequestMapping("/myInfo")
	public String myInfo() {
		return "myInfo/myInfo";
	}
	@RequestMapping("/load")
	public String load() {
		return "myInfo/myInfoLoad";
	}
	
	@RequestMapping("/delivery")
	public String delivery() {
		return "myInfo/myDelivery";
	}
	
	@RequestMapping("/myDeal")
	public String myDeal() {
		return "myInfo/myDeal";
	}
	
	@RequestMapping("/farmerDeal")
	public String farmerDeal() {
		return "myInfo/farmerDeal";
	}
	
	@RequestMapping("/myInfoReview")
	public String review() {
		return "myInfo/myInfoReview";
	}
	@RequestMapping("/myActivity")
	public String myActivity() {
		return "myInfo/myActivity";
	}
	@RequestMapping("/myInfoSaleHistory")
	public String myInfoSaleHistory() {
		return "myInfo/myInfoSaleHistory";
	}
	
//	@RequestMapping("/sellerInfo")
//	public String sellerInfo() {
//		return "myInfo/sellerInfo";
//	}
	@RequestMapping("/myInfoProductManagement")
	public String myInfoProductManagement(){
		return "myInfo/myInfoProductManagement";
		
	}
	@RequestMapping("/myInfoShippingManagement")
	public String myInfoShippingManagement() {
		return "myInfo/myInfoShippingManagement";
	}
}
