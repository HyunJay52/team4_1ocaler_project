package com.team4.localer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	//주석달아보기
	@RequestMapping("/main")//관리자 메인페이지 
	public ModelAndView main(HttpSession session) {
		session.setAttribute("logId", "admin");
		ModelAndView mav = new ModelAndView();
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
	
		////////////여기는 지워야한다,,,ㅎ
	@RequestMapping("/spend_sel")//판매관리
	public ModelAndView spend_sel() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/spend_sel");
		return mav;
	}
	@RequestMapping("/cspage")//판매관리
	public ModelAndView cspage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/cspage");
		return mav;
	}
	@RequestMapping("/persnal")//판매관리
	public ModelAndView persnal() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/persnal");
		return mav;
	}
	@RequestMapping("/question")//판매관리
	public ModelAndView question() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/question");
		return mav;
	}
	
}

