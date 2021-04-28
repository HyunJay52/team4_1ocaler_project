package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.localer.service.JoinUsService;

@Controller
public class JoinUsController {

	
	@Inject
	JoinUsService joinUsService;
	
	@RequestMapping("/joinInsert")
	@ResponseBody
	public String joinInsert(int num, HttpSession session) {
		return joinUsService.joinInsert(num, (String)session.getAttribute("logId"))+"";
	}
	
	@RequestMapping("/joinDelete")
	public String joinDelete(int num, HttpSession session) {
		return joinUsService.joinDelete(num, (String)session.getAttribute("logId"))+"";
	}
	
}
