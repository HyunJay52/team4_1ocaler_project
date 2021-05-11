package com.team4.localer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.CsService;
import com.team4.localer.service.ManageService;
import com.team4.localer.service.MyInfoService;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.MyinfoPageVO;

@Controller
public class MyinfoController {
	@Inject
	MyInfoService service;
	@Inject
	ManageService manaService;
	@Inject
	CsService csService;
	
	//비밀번호 재확인 페이지
	@RequestMapping("/myInfoCheck")
	public String myInfoCheck() {
		return "/myInfo/myInfoCheck";
	}

	//내 정보 페이지 진입시 비밀번호 재확인
	@RequestMapping("/myInfo")
	public ModelAndView checkMyInfo(HttpSession ses, MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)ses.getAttribute("logId"));
		
		MemberVO myInfoVO = service.goMyinfopage(vo);
		if(myInfoVO != null) {
			try {
				mav.addObject("myVO", myInfoVO);
				mav.setViewName("myInfo/myInfo");
			}catch(NullPointerException nullep) {
				nullep.printStackTrace();
				mav.setViewName("redirect:myInfoCheck");
				return mav;
			}
			
		}else {
			mav.setViewName("redirect:myInfoCheck");
		}
		
		return mav;
	}
	
	//내정보 메인화면 페이지
	@RequestMapping("/myInfoMain")
	public ModelAndView myInfoMain(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		System.out.println(userid);
		if(userid == null) {
			mav.setViewName("member/login");		
		}else {
			mav.addObject("myPoint", service.joinPoint(userid));
			mav.addObject("myVO", service.setMyinfo(userid));
			mav.setViewName("myInfo/myInfoMain");
		}
		return mav;
	}
		
	//내정보 충전 페이지
	@RequestMapping("/myInfoLoad")
	public ModelAndView myInfoLoad(HttpSession ses) {
		String myPoint = "0";
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		if(userid != null || userid != "") {
			myPoint = service.joinPoint(userid);
		}
		System.out.println(myPoint);
		mav.addObject("myPoint", myPoint);
		mav.setViewName("myInfo/myInfoLoad");
		return mav;
	}
	
	//포인트 내역 불러오기
	@ResponseBody
	@RequestMapping("/myPointSelect")
	public Map<String, Object> myPointSelect(HttpServletRequest req, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Cha_pVO> list = new ArrayList<Cha_pVO>();
		MyinfoPageVO pVO = new MyinfoPageVO();
		String userid = (String)session.getAttribute("logId");
		String searchDate = req.getParameter("searchDate");
		String searchKey = req.getParameter("searchKey");
		String searchWord = req.getParameter("searchWord");
		
		pVO.setUserid(userid);
		pVO.setNowNum(Integer.parseInt(req.getParameter("nowNum")));
		pVO.setOnePageRecord(5);
		pVO.setOnePageSize(5);
		pVO.setStartPage(pVO.getNowNum(), pVO.getOnePageSize());
		pVO.setSearchWord(searchWord);
		
		if(searchDate != null && searchDate != "") {
			pVO.setSearchDate(searchDate+" 01:00:00");
			pVO.setSearchDate2(searchDate+" 12:59:59");
		}
		if(searchKey != null && searchKey != "") {
			if(searchKey.equals("all")) {
				pVO.setSearchKey("");
			}else {
				int searchValue = Integer.parseInt(searchKey);
				if(searchValue == 1 ) {
					pVO.setSearchKey("1");
				}else {
					pVO.setSearchKey("2");
				}				
			}
		}
		System.out.println("totalPage="+pVO.getTotalPage()+"onePageSize="+pVO.getOnePageSize());
		System.out.println("date="+pVO.getSearchDate()+"key="+pVO.getSearchKey()+"word="+pVO.getSearchWord());
		System.out.println("date2="+pVO.getSearchDate2());
		pVO.setTotalRecord(Integer.parseInt(service.pointCount(pVO)));
		System.out.println("totalRecord="+pVO.getTotalRecord());
		pVO.setTotalPage(pVO.getTotalRecord(), pVO.getOnePageRecord());
		pVO.setLastPageRecord(pVO.getTotalRecord(), pVO.getOnePageRecord());
		pVO.setRowNum1(pVO.getNowNum(), pVO.getOnePageRecord());
		pVO.setRowNum2(pVO.getNowNum(), pVO.getTotalPage(), pVO.getLastPageRecord(), pVO.getOnePageRecord());
		
		
		list = service.allPointSelect(pVO);
		System.out.println(list.size());
		result.put("pList", list);
		result.put("pVO", pVO);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/myInfoPointCharge", method=RequestMethod.POST)
	public int myInfoPointCharge(HttpServletRequest req, Cha_pVO vo) {

		System.out.println("충전액"+vo.getCha_point());

		//유저 ID 세팅
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		//충전 수단 세팅 : 카드결제밖에 없음으로 1 고정
		vo.setCha_mth(1);			
		int result = service.pointCharge(vo);
		
		return result;
	}
	@RequestMapping("/myInfoDelivery")
	public String myInfoDelivery() {
		return "myInfo/myInfoDelivery";
	}
	
	//회원간 거래 페이지
	@RequestMapping("/myInfoDeal")
	public ModelAndView myInfoDeal() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("myInfo/myInfoDeal");
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/myDealList", method=RequestMethod.POST)
	public Map<String, Object> myDealList(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> result = new HashMap<String, Object>();	
		String searchId = (String)ses.getAttribute("logId");
		vo.setUserid(searchId);
		vo.setOnePageRecord(5);
		vo.setOnePageSize(5);
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		System.out.println("kategorie="+vo.getKategorie());

		if(vo.getKategorie() == null) {
			vo.setKategorie("mem_share");
		}
		
		vo.setDateContent("s_writedate");			

		if(vo.getSearchWord().equals("") || vo.getSearchWord() == null) {
			vo.setSearchWord("%%");
		}
		System.out.println("kategorie="+vo.getKategorie());
		vo.setTotalRecord(service.myCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		
		System.out.println("dateContent="+vo.getDateContent());
		result.put("pVO", vo);
		result.put("list", service.selectMyShare(vo));
		return result;
	}
	
	@RequestMapping("/myInfoFarmerDeal")
	public String myInfoFarmerDeal() {
		return "myInfo/myInfoFarmerDeal";
	}
	
	@RequestMapping("/myInfoReview")
	public String myInfoReview() {
		return "myInfo/myInfoReview";
	}
	@RequestMapping("/myInfoActivity")
	public String myInfoActivity() {
		return "myInfo/myInfoActivity";
	}
	@RequestMapping("/myInfoSaleHistory")
	public String myInfoSaleHistory() {
		return "myInfo/myInfoSaleHistory";
	}
	@RequestMapping("/myInfoProductManagement")
	public String myInfoProductManagement(){
		return "myInfo/myInfoProductManagement";
		
	}
	@RequestMapping("/myInfoShippingManagement")
	public String myInfoShippingManagement() {
		return "myInfo/myInfoShippingManagement";
	}
	@RequestMapping("/myInfoSalesManagement")
	public String myInfoSalesManagement() {
		return "myInfo/myInfoSalesManagement";
	}
	@RequestMapping("/myInfoStatistics")
	public String myInfoStatistics() {
		return "myInfo/myInfoStatistics";
	}
	@RequestMapping("/myInfoReviewManagement")
	public String myInfoReviewManagement() {
		return "myInfo/myInfoReviewManagement";
	}
}
