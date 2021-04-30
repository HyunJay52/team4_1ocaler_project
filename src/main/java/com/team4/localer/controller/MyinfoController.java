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

	@RequestMapping("/myInfo")
	public ModelAndView checkMyInfo(HttpSession ses, MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)ses.getAttribute("logId"));
		
		MemberVO myInfoVO = service.goMyinfopage(vo);
		if(myInfoVO != null) {
			try {
				mav.addObject("myVO", myInfoVO);
				mav.setViewName("myInfo/myInfo");
			}catch(NullPointerException nullep) {
				nullep.printStackTrace();
				mav.setViewName("redirect:myInfoCheck");
				return mav;
			}
			
		}else {
			mav.setViewName("redirect:myInfoCheck");
		}
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
