package com.team4.localer.myInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyinfoController {
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
}
