package com.team4.localer.deal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DealController {
	
	@RequestMapping("/selBard")
	public String selBard() {
		return "sell/localBoard";
	}
}
