package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.MemberService;
import com.team4.localer.vo.MemberVO;

@Controller
public class MemberController {
	@Inject
	MemberService service;
	
	@RequestMapping("/login")
	public String loginFrm() {
		return "member/login";
	}
	
	@RequestMapping(value="/loginConfrim", method=RequestMethod.POST)
	public String loginConfirm(MemberVO vo, HttpSession ses) {
		String goPage = "";
		MemberVO logVO = service.memLogin(vo);
		if(logVO.getMem_name()!=null && !logVO.getMem_name().equals("")) {
			ses.setAttribute("logId", logVO.getUserid());
			ses.setAttribute("logName", logVO.getMem_name());
			ses.setAttribute("logLoc_gu", logVO.getLoc_gu());
			goPage = "home";
		}else {
			goPage = "member/login";
		}
		return goPage;
	}
// 일반회원가입	
	@RequestMapping("/joinMember")
	public String joinMember() {
		return "member/joinMember";
	}
	@RequestMapping(value="memJoinOk", method = RequestMethod.POST)
	public ModelAndView memJoinOk(MemberVO vo) {
		System.out.println("입력확인"+vo.getUserid()+",   "+vo.getMem_content());
		
		return null;
	}
// 셀러회원가입
	@RequestMapping("/joinSeller")
	public String joinSeller() {
		return "member/joinSeller";
	}
}
