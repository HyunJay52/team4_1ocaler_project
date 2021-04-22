package com.team4.localer.myInfo;

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
		return "myInfo/main";
	}
	@RequestMapping("/myInfo")
	public String myInfo() {
		return "myInfo/myInfo";
	}
	@RequestMapping("/load")
	public String load() {
		return "myInfo/load";
	}
	
	@RequestMapping("/delivery")
	public String delivery() {
		return "myInfo/myDelivery";
	}
	
	@RequestMapping("/myDeal")
	public String myDeal() {
		return "myInfo/myDeal";
	}
}
