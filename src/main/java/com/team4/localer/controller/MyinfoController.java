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
import com.team4.localer.vo.ItemReviewVO;
import com.team4.localer.vo.JoinUsVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.MyinfoDealVO;
import com.team4.localer.vo.MyinfoJoinUsVO;
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
	//내정보 메인페이지 참여리스트
	@ResponseBody
	@RequestMapping("/myInfoMainDeal")
	public Map<String, Object> myInfoMainDeal(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setRowNum1(1, 5); 
		vo.setRowNum2(1, 1, 1, 5);
		vo.setUserid((String)ses.getAttribute("logId"));
		map.put("joinList", service.selectMyJoinList(vo));
		map.put("shareList", service.selectMyShareJoinList(vo.getUserid()));
		return map;
	}
	//내정보 충전 페이지
	@RequestMapping("/myInfoLoad")
	public ModelAndView myInfoLoad(HttpSession ses) {
		String myPoint = "0";
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		if(userid != null && userid != "") {
			myPoint = service.joinPoint(userid);
		}
		if(myPoint == null) {
			myPoint = "0";
		}
		System.out.println("mypoint="+myPoint);
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
			pVO.setSearchDate(searchDate+" 00:00:00");
			pVO.setSearchDate2(searchDate+" 23:59:59");
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
	public ModelAndView myInfoDeal(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		String userid = ((String)ses.getAttribute("logId"));
		
		mav.addObject("vo", service.selectMyCount(userid));
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
		vo.setNowNum(Integer.parseInt(req.getParameter("nowNum")));
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		System.out.println("kategorie="+vo.getKategorie());
		vo.setSearchDate(vo.getSearchDate()+" 00:00:00");
		vo.setSearchDate2(vo.getSearchDate2()+" 23:59:59");
		
		if(vo.getKategorie() == null) {
			vo.setKategorie("mem_share");
		}
		if(vo.getKategorie().equals("mem_share")) {
			vo.setDateContent("s_writedate");			
		}else {
			vo.setDateContent("j_writedate");
		}

		if(vo.getSearchWord().equals("") || vo.getSearchWord() == null) {
			vo.setSearchWord("%%");
		}else {
			vo.setSearchWord("%"+vo.getSearchWord()+"%");
		}
		System.out.println("nowNum="+vo.getNowNum());
		System.out.println("kategorie="+vo.getKategorie());
		System.out.println("key="+vo.getSearchKey());
		System.out.println("word="+vo.getSearchWord());
		
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
	@ResponseBody
	@RequestMapping("/selectReviewCount")
	public MyinfoJoinUsVO selectReviewCount(HttpServletRequest req) {
		MyinfoJoinUsVO vo = new MyinfoJoinUsVO();
		int num = Integer.parseInt(req.getParameter("num"));
		
		vo = service.selectReviewCount(num);
		System.out.println("joincount="+vo.getJoinCount());
		System.out.println("reviewcount="+vo.getReviewCount());
		
		return vo;
	}
	@ResponseBody
	@RequestMapping("/selectJoinUs")
	public List<JoinUsVO> selectJoinUs(HttpServletRequest req){
		List<JoinUsVO> list = new ArrayList<JoinUsVO>();
		int numJoin = Integer.parseInt(req.getParameter("numJoin"));
		System.out.println(numJoin);
		list = service.selectJoinUs(numJoin);

		return list;
	}
	
	@RequestMapping("/myInfoFarmerDeal")
	public ModelAndView myInfoFarmerDeal(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		String userid = ((String)ses.getAttribute("logId"));
		
		mav.addObject("vo", service.selectMyCount(userid));
		mav.setViewName("myInfo/myInfoFarmerDeal");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/myFarmerDealSelect")
	public Map<String, Object> myFarmerDealSelect(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> result = new HashMap<String, Object>();	
		
		vo.setUserid((String)ses.getAttribute("logId"));
		vo.setOnePageRecord(5);
		vo.setOnePageSize(5);
		vo.setNowNum(Integer.parseInt(req.getParameter("nowNum")));
		if(vo.getSearchWord() == null || vo.getSearchWord().equals("")) {
			vo.setSearchWord("%%");
		}else {
			vo.setSearchWord("%"+vo.getSearchWord()+"%");
		}
		vo.setSearchDate(vo.getSearchDate()+" 00:00:00");
		vo.setSearchDate2(vo.getSearchDate2()+" 23:59:59");
		
		vo.setTotalRecord(service.myCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		
		System.out.println("key="+vo.getSearchKey());
		System.out.println("word="+vo.getSearchWord());
		System.out.println("dayCon="+vo.getDateContent());		
		System.out.println("dey="+vo.getSearchDate());
		System.out.println("dey2="+vo.getSearchDate2());
		
		result.put("list", service.selectOrder(vo));
		result.put("pVO", vo);
		return result;
	}
	//리뷰가 있는지 조회
	@ResponseBody
	@RequestMapping("/selectMyReviewCount")
	public int selectMyReviewCount(HttpSession ses, HttpServletRequest req) {
		int result = 0;
		String userid = (String)ses.getAttribute("logId");
		int num = Integer.parseInt(req.getParameter("num"));
		result = service.selectMyReviewCount(userid, num);
		return result;
	}
	
	//리뷰관리 페이지
	@RequestMapping("/myInfoReview")
	public String myInfoReview() {
		return "myInfo/myInfoReview";
	}
	
	//리뷰쓰기
	@ResponseBody
	@RequestMapping("/writeReview")
	public int writeReview(HttpSession ses, HttpServletRequest req, ItemReviewVO vo) {
		int result = 0;
		vo.setUserid((String)ses.getAttribute("logId"));
		String j_num = req.getParameter("j_num");
		result = service.writeReview(vo);
		System.out.println("jnum="+j_num);
		if(result > 0) {
			if(j_num != null && j_num != "") {
				result = service.updateReviewStatus(Integer.parseInt(j_num));				
			}
		}
		return result;
	}
	
	//
	@ResponseBody
	@RequestMapping("/joinUpdate")
	public int joinUpdate(HttpServletRequest req) {
		int result = 0;
		int j_num = Integer.parseInt(req.getParameter("j_num"));
		System.out.println(j_num);
		result = service.updateJoinStatus(j_num);
		
		
		return result;
	}
	
	//참여신청 취소
	@ResponseBody
	@RequestMapping("/joinCancel")
	public int joinCancel(HttpServletRequest req) {
		int result = 0;
		int j_num = Integer.parseInt(req.getParameter("j_num"));
		System.out.println(j_num);
		result = service.updateJoinCancel(j_num);
		
		return result;
	}
	
	//한 게시글의 내 리뷰 가져오기
	@ResponseBody
	@RequestMapping("/selectMyReview")
	public ItemReviewVO selectMyReview(HttpSession ses, ItemReviewVO vo) {
		ItemReviewVO rVO = new ItemReviewVO();
		vo.setUserid((String)ses.getAttribute("logId"));
		
		rVO = service.selectMyReview(vo);
		return rVO;
	}
	
	//나의 활동 페이지
	@RequestMapping("/myInfoActivity")
	public ModelAndView myInfoActivity(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		String userid = ((String)ses.getAttribute("logId"));
		
		mav.addObject("vo", service.selectMyCount(userid));
		mav.setViewName("myInfo/myInfoActivity");
		return mav;
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
