package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.BoardService;
import com.team4.localer.vo.BoardVO;

@Controller
public class CommuController {
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("/commuMain")
	public String commuMain() { //커뮤 메인으로 이동
		return "community/commuMain";
	}
	@RequestMapping("/commuBoard")
	public String commuBoard(BoardVO vo , HttpServletRequest req) {
		return "community/commuBoard";
	}
	@RequestMapping("/commuWrite")
	public String commuWrite() {
		return "community/commuWrite";
	}
	@RequestMapping(value="/commuWriteOk", method=RequestMethod.POST)
	public ModelAndView commuWriteOk(BoardVO vo , HttpServletRequest req) {
		ModelAndView mav= new ModelAndView();
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setB_gu((String)req.getSession().getAttribute("logLoc_gu"));
		
		
		System.out.println(vo.getUserid());
		System.out.println(vo.getB_gu());
		
		mav.addObject("vo",vo);
		
		return mav;
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
