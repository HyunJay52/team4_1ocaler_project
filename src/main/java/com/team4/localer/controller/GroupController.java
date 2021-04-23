package com.team4.localer.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.vo.GroupVO;

@Controller
public class GroupController {

	
	GroupVO vo = new GroupVO();
	
	@RequestMapping("/groupPage")
	public String groupOpen() {
		return "group/groupMapView";
	}
	
	
	@RequestMapping("/eatPage")
	public ModelAndView eatPage(GroupVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		System.out.println(vo.getG_loc());
		mav.setViewName("group/eatView");
		return mav;
	}
	
	
	@RequestMapping("/withPage")
	public ModelAndView withPage(GroupVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		System.out.println(vo.getG_loc());
		mav.setViewName("group/withView");
		return mav;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView GroupWriteForm(GroupVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("group/groupWriteForm");
		return mav;
	}
	
	
}
