package com.team4.localer.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.team4.localer.service.GroupService;
import com.team4.localer.service.JoinUsService;
import com.team4.localer.service.LikeItService;
import com.team4.localer.vo.GroupPageVO;
import com.team4.localer.vo.GroupVO;


@Controller
public class GroupController{
	
	@Inject
	GroupService groupService;
	@Inject
	LikeItService likeItService;
	@Inject
	JoinUsService joinUsService;
	
	@RequestMapping("/groupPage")
	public String groupOpen(HttpSession session) {//나중에 지워야할값 지금 세션 확인위해 해놓은것
		session.setAttribute("logId", "goguma1234");
		session.setAttribute("logName", "감자");
		session.setAttribute("logStatus", "Y");
		session.setAttribute("logGu", "강서구");
		return "group/groupMapView";
	}
	
	
	@RequestMapping("/eatPage")
	public ModelAndView eatPage(GroupPageVO pageVO, GroupVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("likeList",likeItService.LikeItSelectAll((String)session.getAttribute("logId")));
		mav.addObject("eatList",groupService.GroupEatList(pageVO.getLoc_gu()));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("group/eatView");
		return mav;
	}
	
	
	@RequestMapping("/withPage")
	public ModelAndView withPage(GroupPageVO pageVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("likeList",likeItService.LikeItSelectAll((String)session.getAttribute("logId")));
		mav.addObject("withList",groupService.GroupWithList(pageVO.getLoc_gu()));
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
	public ModelAndView writeFormOk(GroupPageVO pageVO, GroupVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		vo.setUserid((String)session.getAttribute("logId"));
		System.out.println(vo.getUserid());
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
	
	
	
	@RequestMapping("/eatViewPage")
	public ModelAndView eatPageView(GroupPageVO pageVO, int num, HttpSession session) {
		ModelAndView mav = new ModelAndView(); 
		groupService.hitCount(num);
		
		mav.addObject("joinList",joinUsService.joinSelect((String)session.getAttribute("logId")));
		mav.addObject("vo",groupService.eatViewPageResult(num));
		mav.addObject("pageVO",pageVO); //num,gu, (추가사항=>pageNum,searchKey,searchWord)
		mav.setViewName("group/eatViewPage");
		return mav;
	}
	
	
	
	@RequestMapping("/withViewPage")
	public ModelAndView withPageView(GroupPageVO pageVO, int num) {
		ModelAndView mav = new ModelAndView();	
		groupService.hitCount(num);
		
		mav.addObject("vo",groupService.withViewPageResult(num));
		mav.addObject("pageVO", pageVO);//num,gu, (추가사항=>pageNum,searchKey,searchWord)
		mav.setViewName("group/withViewPage");
		return mav;
	}
}
