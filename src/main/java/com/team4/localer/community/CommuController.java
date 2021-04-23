package com.team4.localer.community;

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
}
