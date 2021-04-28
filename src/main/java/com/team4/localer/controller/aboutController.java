package com.team4.localer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class aboutController {
	
	@RequestMapping("/aboutUs")
	public String aboutUs() {
		return "about/introduce";
	}
	
	@RequestMapping("/routeUs")
	public String routeUs() {
		return "about/routeUs";
	}
}
