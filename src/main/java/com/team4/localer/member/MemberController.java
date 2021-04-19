package com.team4.localer.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@RequestMapping("/login")
	public String loginFrm() {
		return "member/login";
	}
	
	@RequestMapping(value="/loginConfrim", method=RequestMethod.POST)
	public String loginConfirm() {
		return null;
	}
	
	@RequestMapping("/joinMember")
	public String joinMember() {
		return "member/joinMember";
	}
}
