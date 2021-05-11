package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.DealShareService;
import com.team4.localer.vo.DealShareVO;

@Controller
public class DealController {
	
	@Inject
	DealShareService dealshareService;
	
	//동네직구(회원)
	@RequestMapping("/memberBoard")
	public String memberBoard() {
		return "deal/memberBoard";
	}
	

	
	@RequestMapping("/memberWrite")
	public ModelAndView memberWrite(DealShareVO vo,HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
		mav.setViewName("deal/memberWrite");
		
		 return mav;
	}
	
	
	//글쓰기
	@RequestMapping(value = "/memWriteOk" , method = RequestMethod.POST)
	public ModelAndView memWriteOk (DealShareVO vo,HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setS_gu((String)req.getSession().getAttribute("logLoc_gu"));
		
		mav.addObject("vo",vo);
		
		if(dealshareService.dealInsert(vo)>0) {
//			DealShareVO vo2 =dealshareService.dealOneselect(vo);
//			mav.addObject("vo",vo2);
//			mav.addObject("num", vo2.getNum());
//			mav.setViewName("redirect:memberView");
			mav.setViewName("redirect:memberWrite");
		}else {// 실피했을때
			mav.setViewName("redirect:memberWrite");
		}
		
		
		return mav;
	}
	
	@RequestMapping("/memberView")
	public String memberView() {
		return "deal/memberView";
	}
	

	@RequestMapping("/memberEdit")
	public String memeberEdit() {
		return	"deal/memberEdit";
	}
	

	

	
	
}
