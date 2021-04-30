package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.MyInfoService;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.MemberVO;

@Controller
public class MyinfoController {
	@Inject
	MyInfoService service;
	
	//비밀번호 재확인 페이지
	@RequestMapping("/myInfoCheck")
	public String myInfoCheck() {
		return "/myInfo/myInfoCheck";
	}

	//내 정보 페이지 진입시 비밀번호 재확인
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
	
	//내정보 메인화면 페이지
	@RequestMapping("/myInfoMain")
	public ModelAndView myInfoMain(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		if(userid.equals("") || userid == null) {
			mav.setViewName("member/login");		
		}else {
			mav.addObject("myVO", service.setMyinfo(userid));
			mav.setViewName("myInfo/myInfoMain");
		}
		return mav;
	}
	
	//내정보 충전 페이지
	@RequestMapping("/myInfoLoad")
	public ModelAndView myInfoLoad(HttpSession ses) {
		String myPoint = "0";
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		if(userid != null || userid != "") {
			myPoint = service.joinPoint(userid);
		}
		System.out.println(myPoint);
		mav.addObject("myPoint", myPoint);
		mav.setViewName("myInfo/myInfoLoad");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/myInfoPointCharge", method=RequestMethod.POST)
	public int myInfoPointCharge(HttpServletRequest req, Cha_pVO vo) {

		System.out.println("충전액"+vo.getCha_point());

		//유저 ID 세팅
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		//충전 수단 세팅 : 카드결제밖에 없음으로 1 고정
		vo.setCha_mth(1);			
		int result = service.pointCharge(vo);
		
		return result;
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
