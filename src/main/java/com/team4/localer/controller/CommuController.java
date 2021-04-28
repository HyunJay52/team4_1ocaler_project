package com.team4.localer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuController {
	@RequestMapping("/commuMain")
	public String commuMain() {
		return "community/commuMain";
	}
	@RequestMapping("/commuBoard")
	public String commuBoard() {
		return "community/commuBoard";
	}
	@RequestMapping("/commuWrite")
	public String commuWrite() {
		return "community/commuWrite";
	}
	
	@RequestMapping("/commuView")
	public String commuView() {
		return "community/commuView";
	}
	
	@RequestMapping("/commuEdit")
	public String commuEdit() {
		return "community/commuEdit";
	}
	
}
