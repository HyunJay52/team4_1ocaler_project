package com.team4.localer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.CsService;
import com.team4.localer.vo.CsVO;

@Controller
public class AdminController {
	
	@Inject
	CsService csService;
	
	
	@RequestMapping("/main")//관리자 메인페이지 
	public ModelAndView main(HttpSession session) {
		session.setAttribute("logId", "admin");
		ModelAndView mav = new ModelAndView();
		//cstable 전체 list 불러오기 
		mav.addObject("list",csService.boardAllSelect());
		mav.setViewName("admin/main");
		return mav;
	}
	@RequestMapping("/m_mem")//회원관리-일반회원 
	public ModelAndView m_mem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/m_mem");
		return mav;
	}
	@RequestMapping("/m_sel")//회원관리-일반회원 
	public ModelAndView m_sel() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/m_sel");
		return mav;
	}
	@RequestMapping("/selManage")//판매관리
	public ModelAndView selManage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/selManage");
		return mav;
	}
	@RequestMapping("/boardManage")//판매관리
	public ModelAndView boardManage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/boardManage");
		return mav;
	}
	@RequestMapping("/publicwrite")//판매관리
	public ModelAndView publicwrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/publicwrite");
		return mav;
	}
	@RequestMapping("/statis_mem")//판매관리
	public ModelAndView statis_mem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/statis_mem");
		return mav;
	}
	@RequestMapping("/statis_board")//판매관리
	public ModelAndView statis_board() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/statis_board");
		return mav;
	}
	@RequestMapping("/spend_mem")//판매관리
	public ModelAndView spend_mem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/spend_mem");
		return mav;
	}
	
	@RequestMapping("/spend_sel")//판매관리
	public ModelAndView spend_sel() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/spend_sel");
		return mav;
	}
	@RequestMapping("/cspage")//판매관리
	public ModelAndView cspage() {
		ModelAndView mav = new ModelAndView();
		//신고글 리스트 select
		mav.addObject("list",csService.reportSelect());
		mav.setViewName("admin/cspage");
		return mav;
	}
	@RequestMapping("/oftenAndCs")
	@ResponseBody
	public List<CsVO> oftenAndCs(String cate){
		ModelAndView mav = new ModelAndView();
		//cate : oftenq(자주하는질문), report(신고),cs(1:1문의)
		if(cate=="oftenq"||cate.equals("oftenq")) {
			//자주하는 질문
			return csService.oftenqSelect();
		}else if(cate=="report"||cate.equals("report")) {
			//신고글
			return csService.reportSelect();
		}else{//1:1문의
			return csService.boardAllSelect();
		}
	}
	
	@RequestMapping("/persnal")//판매관리
	public ModelAndView persnal(int cs_num) {
		//csTbl에서 문의글 1개 가져오기 
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", csService.boardSelect(cs_num));
		mav.setViewName("admin/persnal");
		return mav;
	}
	@RequestMapping("/question")//판매관리
	public ModelAndView question() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/question");
		return mav;
	}
	//1:1문의 답변달아주기
	@RequestMapping(value="/persnalOk", method=RequestMethod.POST)
	public ModelAndView persnalOk(CsVO vo) {
		ModelAndView mav = new ModelAndView();
		//csTbl 업데이트문 
		if(csService.boardUpdate(vo)>0) {//답변달기 성공
			mav.setViewName("redirect:main");
		}else {//실패
			mav.addObject("cs_num",vo.getCs_num());
			mav.setViewName("redirect:persnal");
		}
		return mav;
	}
	//자주하는 질문 수정 
	@RequestMapping("/oftenQWriteEdit")
	public ModelAndView oftenQWriteEdit(int num) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/oftenQWrite");
		return mav;
	}
}

