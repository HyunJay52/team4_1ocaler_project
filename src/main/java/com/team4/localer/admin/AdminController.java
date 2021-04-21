package com.team4.localer.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
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
	
}
