package com.team4.localer.group;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GroupController {

	@Autowired
	SqlSession sqlSession;
	
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
}
