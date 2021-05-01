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
	
	//커뮤 게시판보기
	@RequestMapping("/commuBoard")
	public ModelAndView commuBoard(BoardVO vo , HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("commuList",boardService.commuSelect(vo));
		mav.addObject("vo",vo);
		mav.setViewName("community/commuBoard");
	//	return "community/commuBoard";
		return mav;
	}
	@RequestMapping("/commuWrite")
	public String commuWrite() {
		return "community/commuWrite";
	}
	
	//커뮤 글쓰기...
	@RequestMapping(value="/commuWriteOk", method=RequestMethod.POST)
	public ModelAndView commuWriteOk(BoardVO vo , HttpServletRequest req) {
		ModelAndView mav= new ModelAndView();
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setB_gu((String)req.getSession().getAttribute("logLoc_gu"));
		
		
		System.out.println(vo.getUserid());
		System.out.println(vo.getB_gu());
		
		mav.addObject("vo",vo);
		if(boardService.commuInsert(vo)>0) {
			
			mav.setViewName("redirect:commuView");
		}else {
			mav.setViewName("redirect:boardWrite");
		}
		return mav;
	}
	
	//커뮤 글 보기
	@RequestMapping("/commuView")
	public ModelAndView commuView(int num) {
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("vo",boardService.commuViewSelect(num));
		
		mav.setViewName("community/commuView");
		return mav;
	}
	
	@RequestMapping("/commuEdit")
	public String commuEdit() {
		return "community/commuEdit";
	}
	
}
