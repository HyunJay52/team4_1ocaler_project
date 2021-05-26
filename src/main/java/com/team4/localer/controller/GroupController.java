package com.team4.localer.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.team4.localer.service.GroupService;
import com.team4.localer.service.JoinUsService;
import com.team4.localer.service.LikeItService;
import com.team4.localer.service.MemberService;
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
	@Inject
	MemberService memberService;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	
	
	@RequestMapping("/groupPage")
	public String groupOpen(HttpSession session) {//나중에 지워야할값 지금 세션 확인위해 해놓은것
		return "group/groupMapView";
	}
	
	
	@RequestMapping("/eatPage")
	public ModelAndView eatPage(GroupPageVO pageVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		

		pageVO.setPageNum(pageVO.getPageNum());
		pageVO.setSearchKey(pageVO.getSearchKey());
		pageVO.setSearchWord(pageVO.getSearchWord());
		
		pageVO.setTotalRecord(groupService.groupTotalRecoedCount(pageVO)); // pageVO 안에 totalPageRecordNum 대입함		
		
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			mav.addObject("likeList",likeItService.LikeItSelectAll((String)session.getAttribute("logId")));
		}
		mav.addObject("eatList",groupService.GroupListAll(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("group/eatView");
		return mav;
	}
	
	
	@RequestMapping("/withPage")
	public ModelAndView withPage(GroupPageVO pageVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		pageVO.setPageNum(pageVO.getPageNum());
		pageVO.setSearchKey(pageVO.getSearchKey());
		pageVO.setSearchWord(pageVO.getSearchWord());
		pageVO.setTotalRecord(groupService.groupTotalRecoedCount(pageVO));
		
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
		mav.addObject("likeList",likeItService.LikeItSelectAll((String)session.getAttribute("logId")));
		}
		mav.addObject("withList",groupService.GroupListAll(pageVO));
		mav.addObject("pageVO",pageVO);
		mav.setViewName("group/withView");
		
		return mav;
	}
	
	@RequestMapping("/groupEditForm")
	public ModelAndView groupEditFrm(GroupVO vo, GroupPageVO pageVO, HttpSession session){
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.getNum());
		if(vo.getUserid().equals(session.getAttribute("logId"))) {
			if(pageVO.getCategory().equals("한끼미식회")) {
				GroupVO eatVO = groupService.eatViewPageResult(vo.getNum());
				mav.addObject("eatVO",eatVO);
			}else {
				GroupVO withVO = groupService.withViewPageResult(vo.getNum());
				mav.addObject("withVO",withVO);
			}
			
		}
		System.out.println(pageVO.getSearchWord());
		System.out.println(pageVO.getSearchKey());
		mav.addObject("pageVO",pageVO);
		mav.setViewName("group/groupEditForm");
		return mav;
	}
	
	@RequestMapping("/groupEditOk")
	public ModelAndView groupEditOk(GroupVO vo, GroupPageVO pageVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(vo.getUserid().equals(session.getAttribute("logId"))){
			if(groupService.groupRecordUpdate(vo)>0) {
				if(vo.getUp_cate().equals("한끼미식회")) {
					mav.addObject("num",vo.getNum());
					mav.addObject("loc_gu",pageVO.getLoc_gu());
					mav.addObject("category",vo.getUp_cate());
					mav.addObject("pageNum",pageVO.getPageNum());
					if(pageVO.getSearchWord()!=null) {
						mav.addObject("searchKey",pageVO.getSearchKey());
						mav.addObject("searchWord",pageVO.getSearchWord());						
					}
					mav.setViewName("redirect:eatViewPage");
				}else {
					mav.addObject("num",vo.getNum());
					mav.addObject("loc_gu",pageVO.getLoc_gu());
					mav.addObject("category",vo.getUp_cate());
					mav.addObject("pageNum",pageVO.getPageNum());
					if(pageVO.getSearchWord()!=null && !pageVO.getSearchWord().equals("")) {
						mav.addObject("searchKey",pageVO.getSearchKey());
						mav.addObject("searchWord",pageVO.getSearchWord());						
					}
					mav.setViewName("redirect:withViewPage");
				}
			}else {
				mav.setViewName("group/historyBack");
			}
		}	
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
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView writeFormOk(GroupPageVO pageVO, GroupVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		vo.setUserid((String)session.getAttribute("logId"));
		System.out.println(vo.getUserid());
		vo.setG_gu(pageVO.getLoc_gu());
		System.out.println(vo.getG_gu());
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜잭션호출
		TransactionStatus status  = transactionManager.getTransaction(def);
		try {
			if(vo.getG_loc2()==null || vo.getG_loc2().equals("")) {
				if(groupService.groupInsert(vo)>0) {
					if(vo.getUp_cate().equals("한끼미식회")) {
						mav.addObject("category",pageVO.getCategory());
						mav.addObject("loc_gu",pageVO.getLoc_gu());
						mav.setViewName("redirect:eatPage");
					}else {
						mav.addObject("category",pageVO.getCategory());
						mav.addObject("loc_gu",pageVO.getLoc_gu());
						mav.setViewName("redirect:withPage");
					}
				}else {
						mav.setViewName("group/historyBack");
				}
			}else {
				if(groupService.groupBigMartInsert(vo)>0) {
					mav.addObject("category",pageVO.getCategory());
					mav.addObject("loc_gu",pageVO.getLoc_gu());
					mav.setViewName("redirect:withPage");
				}else {
					mav.setViewName("group/historyBack");
				}
			}

			//멤버 게시글수 카운트해주는 메서드
			memberService.memPostCount(vo.getUserid());
			
			//트랜젝션 commit실행
			transactionManager.commit(status);
		}catch(Exception e) {
			System.out.println(e.getMessage()+"abc@@@@@@@@@@@@@@@@");
			e.printStackTrace();
			mav.setViewName("group/historyBack");
			
		}
				
		return mav;
	}
	
	
	
	@RequestMapping("/eatViewPage")
	public ModelAndView eatPageView(GroupPageVO pageVO, int num, HttpSession session) {
		ModelAndView mav = new ModelAndView(); 
		groupService.hitCount(num);
		System.out.println(joinUsService.getJCount(num)+"여기요 ");
		
		mav.addObject("appNum",joinUsService.getJCount(num));
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			mav.addObject("joinList",joinUsService.joinSelect((String)session.getAttribute("logId")));
		}
		mav.addObject("vo",groupService.eatViewPageResult(num));
			
		mav.addObject("pageVO",pageVO); //num,gu, (추가사항=>pageNum,searchKey,searchWord)
		mav.setViewName("group/eatViewPage");
		return mav;
	}
	
	
	
	@RequestMapping("/withViewPage")
	public ModelAndView withPageView(GroupPageVO pageVO, int num, HttpSession session) {
		ModelAndView mav = new ModelAndView();	
		groupService.hitCount(num);
		
		mav.addObject("appNum",joinUsService.getJCount(num));
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			mav.addObject("joinList",joinUsService.joinSelect((String)session.getAttribute("logId")));
		}
		mav.addObject("vo",groupService.withViewPageResult(num));
		mav.addObject("pageVO", pageVO);//num,gu, (추가사항=>pageNum,searchKey,searchWord)
		mav.setViewName("group/withViewPage");
		return mav;
	}
	
	
	@RequestMapping("/eatViewPageDel")
	public ModelAndView eatViewPageDelete(HttpSession session, GroupVO vo, GroupPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		
		int result = groupService.groupRecordDelete(vo.getNum(), (String)session.getAttribute("logId"));
		
		if(result>0) {
			mav.addObject("loc_gu",pageVO.getLoc_gu());
			mav.addObject("category",pageVO.getCategory());
			if(pageVO.getCategory().equals("한끼미식회")) {				
				mav.setViewName("redirect:eatPage");
			}else {
				mav.setViewName("redirect:withPage");
			}
		
		}else {
			mav.setViewName("group/historyBack");
		}

		return mav;
		
	}
	
}
