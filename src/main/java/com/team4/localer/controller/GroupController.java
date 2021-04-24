package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.GroupService;
import com.team4.localer.vo.GroupPageVO;
import com.team4.localer.vo.GroupVO;

@Controller
public class GroupController {
	
	@Inject
	GroupService groupService;
	
	@RequestMapping("/groupPage")
	public String groupOpen(HttpSession session) {//나중에 지워야할값 지금 세션 확인위해 해놓은것
		session.setAttribute("logId", "goguma1234");
		session.setAttribute("logName", "고구마");
		session.setAttribute("logStatus", "Y");
		session.setAttribute("logGu", "강서구");
		return "group/groupMapView";
	}
	
	
	@RequestMapping("/eatPage")
	public ModelAndView eatPage(GroupPageVO pageVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageVO",pageVO);
		mav.setViewName("group/eatView");
		return mav;
	}
	
	
	@RequestMapping("/withPage")
	public ModelAndView withPage(GroupPageVO pageVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageVO",pageVO);
		mav.setViewName("group/withView");
		return mav;
	}
	
	@RequestMapping("/writeForm")
	public ModelAndView GroupWriteForm(GroupPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageVO",pageVO);
		mav.setViewName("group/groupWriteForm");
		return mav;
	}
	
	@RequestMapping(value="/writeFormOk", method=RequestMethod.POST)
	public ModelAndView writeFormOk(GroupPageVO pageVO, GroupVO vo) {
		ModelAndView mav = new ModelAndView();
		
		vo.setUserid("goguma1234");
		vo.setG_gu("강서구");
		
		if(vo.getG_loc2()==null || vo.getG_loc2().equals("")) {
			if(groupService.groupInsert(vo)>0) {
				System.out.println("성공했다@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				if(vo.getUp_cate().equals("한끼미식회")) {
					mav.addObject("loc_gu",pageVO.getLoc_gu());
					mav.setViewName("redirect:eatPage");
				}else {
					mav.addObject("loc_gu",pageVO.getLoc_gu());
					mav.setViewName("redirect:withPage");
				}
			}else {
				System.out.println("실패했다@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
					mav.setViewName("group/writeFormOk");
			}
		}else {
			if(groupService.groupBigMartInsert(vo)>0) {
				System.out.println("창고형마트 인설트 성공했다@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				mav.addObject("loc_gu",pageVO.getLoc_gu());
				mav.setViewName("redirect:withPage");
			}else {
				System.out.println("창고형마트 인설트 실패했다@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				mav.setViewName("group/writeFormOk");
			}
		}
		System.out.println("userid-==>"+vo.getUserid());
		System.out.println("up_cate==>"+vo.getUp_cate());
		System.out.println("down_cate==>"+vo.getDown_cate());
		System.out.println("g_gu=======>"+vo.getG_gu());
		System.out.println("g_subject===>"+vo.getG_subject());
		System.out.println("g_content====>"+vo.getG_content());
		System.out.println("g_cnt===>"+vo.getG_cnt());
		System.out.println("g_date===>"+vo.getG_date());
		System.out.println("g_time==>"+vo.getG_time());
		System.out.println("g_loc1===>"+vo.getG_loc1());
		System.out.println("g_loc2-===>"+vo.getG_loc2());
		System.out.println("g_tag=====>"+vo.getG_tag());
		
		
		
		
		
		
		
		return mav;
	}
	
	
	
	@RequestMapping("/eatPageView")
	public ModelAndView eatPageView(GroupPageVO vo) {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("group/eatPageView");
		return mav;
	}
	
	
	
	@RequestMapping("/withPageView")
	public ModelAndView withPageView(GroupPageVO vo) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("group/withPageView");
		return mav;
	}
	
	
	
	
}
