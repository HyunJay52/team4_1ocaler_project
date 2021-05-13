package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team4.localer.service.CsService;
import com.team4.localer.vo.CsVO;
import com.team4.localer.vo.ReportVO;

@Controller
public class csBoardController {
	
	@Inject
	CsService service;
	
	@RequestMapping("/oftenQna")
	public String oftenQna() {
		return "csBoard/oftenQna";
	}
	
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "csBoard/qnaWrite";
	}
	//cs_qnaOk
	@RequestMapping("/cs_qnaOk")
	public String cs_qnaOk(HttpSession ses, CsVO vo) {
		String returnView = "";

		String userid = (String)ses.getAttribute("logId");
		vo.setUserid(userid);
		
		if(service.csQnaInsert(vo)>0) {
			returnView = "csBoard/qnaWrite";
		}else {
			returnView = "member/historyBack";
		}
		
		return returnView;
	}
	
	@RequestMapping("/reportWrite")
	public String reportWrite(int num, Model model, HttpServletRequest req) {
		String returnView = "";
		
		if(num>0) {
			model.addAttribute("num", num);
			returnView = "csBoard/reportWrite";
		}else {
			returnView = "member/historyBack";
		}
		return returnView;
	}
	
	@RequestMapping("/cs_repOk")
	public String cs_repOk(ReportVO vo, HttpSession ses) {
		String returnView = "";
		
		vo.setUserid((String)ses.getAttribute("logId"));
		
		int result = service.reportInsert(vo);
		
		if(result>0) {
			returnView = "csBoard/reportWrite";
		}else {
			returnView = "member/historyBack";
		}
		return returnView;
	}
	
}
