package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.MyInfoService;
import com.team4.localer.vo.MemberVO;

@Controller
public class MyinfoController {
	@Inject
	MyInfoService service;
	
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
	@RequestMapping("/myInfoMain")
	public String myInfoMain() {
		return "myInfo/myInfoMain";
	}
	@RequestMapping("/myInfo")
	public ModelAndView myInfo(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myInfo/myInfo");
		
		
		return mav;
	}
	@RequestMapping("/myInfoLoad")
	public String myInfoLoad() {
		return "myInfo/myInfoLoad";
	}
	
	@RequestMapping("/myInfoDelivery")
	public String myInfoDelivery() {
		return "myInfo/myInfoDelivery";
	}
	
	@RequestMapping("/myInfoDeal")
	public String myInfoDeal() {
		return "myInfo/myInfoDeal";
	}
	
	@RequestMapping("/myInfoFarmerDeal")
	public String myInfoFarmerDeal() {
		return "myInfo/myInfoFarmerDeal";
	}
	
	@RequestMapping("/myInfoReview")
	public String myInfoReview() {
		return "myInfo/myInfoReview";
	}
	@RequestMapping("/myInfoActivity")
	public String myInfoActivity() {
		return "myInfo/myInfoActivity";
	}
	@RequestMapping("/myInfoSaleHistory")
	public String myInfoSaleHistory() {
		return "myInfo/myInfoSaleHistory";
	}
	@RequestMapping("/myInfoSeller")
	public String myInfoSeller() {
		return "myInfo/myInfoSeller";
	}
	@RequestMapping("/myInfoProductManagement")
	public String myInfoProductManagement(){
		return "myInfo/myInfoProductManagement";
		
	}
	@RequestMapping("/myInfoShippingManagement")
	public String myInfoShippingManagement() {
		return "myInfo/myInfoShippingManagement";
	}
	@RequestMapping("/myInfoSalesManagement")
	public String myInfoSalesManagement() {
		return "myInfo/myInfoSalesManagement";
	}
	@RequestMapping("/myInfoStatistics")
	public String myInfoStatistics() {
		return "myInfo/myInfoStatistics";
	}
	@RequestMapping("/myInfoReviewManagement")
	public String myInfoReviewManagement() {
		return "myInfo/myInfoReviewManagement";
	}
}
