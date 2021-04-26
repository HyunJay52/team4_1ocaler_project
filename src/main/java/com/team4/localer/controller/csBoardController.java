package com.team4.localer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class csBoardController {
	@RequestMapping("/oftenQna")
	public String oftenQna() {
		return "csBoard/oftenQna";
	}
	
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "csBoard/qnaWrite";
	}
	@RequestMapping("/cs_qnaOk")
	public String cs_qnaOk() {
		System.out.println("1:1문의 접수하기 클릭");
		return "csBoard/oftenQna";
	}
	
	@RequestMapping("/reportWrite")
	public String reportWrite() {
		return "csBoard/reportWrite";
	}
	
	@RequestMapping("/cs_repOk")
	public String cs_repOk() {
		return "csBoard/reportWrite";
	}
	
}
