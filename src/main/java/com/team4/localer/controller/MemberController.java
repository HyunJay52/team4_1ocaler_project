package com.team4.localer.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team4.localer.service.MemberService;

@Controller
public class MemberController {
	@Inject
	MemberService service;
	
	@RequestMapping("/login")
	public String loginFrm() {
		return "member/login";
	}
	
// 일반회원가입
	@RequestMapping(value="/loginConfrim", method=RequestMethod.POST)
	public String loginConfirm() {
		return "member/login";
	}
	
	@RequestMapping("/joinMember")
	public String joinMember() {
		return "member/joinMember";
	}
// 셀러회원가입
	@RequestMapping("/joinSeller")
	public String joinSeller() {
		return "member/joinSeller";
	}
}
