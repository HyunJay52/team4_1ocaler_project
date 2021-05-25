package com.team4.localer.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
import com.team4.localer.service.SellerService;
import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.ItemReviewVO;
import com.team4.localer.vo.JoinUsVO;
import com.team4.localer.vo.MemberVO;

import com.team4.localer.vo.MyinfoBoardVO;
import com.team4.localer.vo.MyinfoDealVO;

import com.team4.localer.vo.MyinfoJoinUsVO;
import com.team4.localer.vo.MyinfoPageVO;

import com.team4.localer.vo.OrderVO;
import com.team4.localer.vo.QnAVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.SellitemVO;



@Controller
public class MyinfoController {
	@Inject
	MyInfoService service;
	@Inject
	ManageService manaService;
	@Inject
	CsService csService;
	
//2021.05.23 hj
	@Inject
	SellerService sellerService;
	
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
			mav.addObject("myPoint", service.joinPoint(userid)); //충전잔액
			
			mav.addObject("myVO", service.setMyinfo(userid)); //내 정보
			//참여현황
			mav.addObject("myJoin", service.selectWaitingJoinList(userid));
			//QnA
			mav.addObject("qnaVO", service.selectAllmyqna(userid));
			//활동내역
			mav.addObject("myAct", service.selectMyCount(userid));
			
			mav.setViewName("myInfo/myInfoMain");
		}
		return mav;
	}
	//내정보 메인페이지 참여리스트
	@ResponseBody
	@RequestMapping("/myInfoMainDeal")
	public Map<String, Object> myInfoMainDeal(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo.setUserid((String)ses.getAttribute("logId"));
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		vo.setTotalRecord(service.myCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());

		
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
	
	//회원간 거래 리스트 조회
	@ResponseBody
	@RequestMapping(value="/myDealList", method=RequestMethod.POST)
	public Map<String, Object> myDealList(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> result = new HashMap<String, Object>();	
		String searchId = (String)ses.getAttribute("logId");
		vo.setUserid(searchId);
		vo.setOnePageRecord(10);
		vo.setOnePageSize(5);
		vo.setNowNum(Integer.parseInt(req.getParameter("nowNum")));
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		System.out.println("kategorie="+vo.getKategorie());
		vo.setSearchDate(vo.getSearchDate()+" 00:00:00");
		vo.setSearchDate2(vo.getSearchDate2()+" 23:59:59");
		
		if(vo.getKategorie() == null) {
			vo.setKategorie("mem_share");
		}
		if(vo.getKategorie().equals("mem_share")) {//회원간 거래
			vo.setDateContent("s_writedate");		
			//내가 만든 모집글이나 참여글일시
		}else if(vo.getKategorie().equals("grouplocal") || vo.getKategorie().equals("groupJoinus")){
			vo.setDateContent("g_writedate");
			if(vo.getSearchKey().equals("s_subject")) {
				vo.setSearchKey("g_subject");
			}else if(vo.getSearchKey().equals("s_content")) {
				vo.setSearchKey("g_content");
			}else if(vo.getSearchKey().equals("s_gu")) {
				vo.setSearchKey("g_gu");
			}else if(vo.getSearchKey().equals("s_tag")) {
				vo.setSearchKey("g_tag");
			}
		
		}else{
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
		System.out.println("totalRecord="+vo.getTotalRecord());
		System.out.println("dateContent="+vo.getDateContent());
		System.out.println("searchDate1="+vo.getSearchDate());
		System.out.println("searchDate2="+vo.getSearchDate2());
		
		result.put("pVO", vo);
		result.put("list", service.selectMyShare(vo));
		return result;
	}
	@ResponseBody
	@RequestMapping("/selectReviewCount")
	public MyinfoJoinUsVO selectReviewCount(HttpServletRequest req, MyinfoPageVO pVO) {
		MyinfoJoinUsVO vo = new MyinfoJoinUsVO();
		int num = Integer.parseInt(req.getParameter("num"));
		pVO.setNowNum(num);
		pVO.setKategorie((String)req.getParameter("kategorie"));
		vo = service.selectReviewCount(pVO);
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
		vo.setOnePageRecord(10);
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
	
	//리뷰관리 페이지
	@RequestMapping("/myInfoReview")
	public String myInfoReview() {
		return "myInfo/myInfoReview";
	}
	//리뷰관리 페이지 회원간 리뷰 조회
	@ResponseBody
	@RequestMapping("/myInfoReviewList")
	public Map<String, Object> myInfoReviewList(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo.setUserid((String)ses.getAttribute("logId"));

		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		vo.setTotalRecord(service.myCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		System.out.println("kategorie="+vo.getKategorie());
		System.out.println("nowNum="+vo.getNowNum());
		System.out.println("onePageRecord="+vo.getOnePageRecord());
		System.out.println("totalRecord="+vo.getTotalRecord());
		System.out.println("dataContentttt="+vo.getDateContent());
		System.out.println("totalPage="+vo.getTotalPage());
		System.out.println("key="+vo.getSearchKey());
		System.out.println("word="+vo.getSearchWord());
		System.out.println("date="+vo.getSearchDate());
		System.out.println("date2="+vo.getSearchDate2());
		
		map.put("list", service.selectMyJoinList(vo));
		map.put("sharePVO", vo);
		return map;
	}
	//리뷰관리 페이지 상품 리뷰 조회
	@ResponseBody
	@RequestMapping("/myInfoItemReviewList")
	public Map<String, Object> myInfoItemReviewList(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		if(vo.getKategorie().equals("grouplocal")) {
			vo.setDateContent("g_writedate");
		}
		System.out.println("datecontent="+vo.getDateContent());
		System.out.println("itemkategorie="+vo.getKategorie());
		vo.setUserid((String)ses.getAttribute("logId"));
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		vo.setTotalRecord(service.selectItemReviewListCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		System.out.println("totalRecord="+vo.getTotalRecord()+"//////////total="+vo.getTotalPage());
		System.out.println("rowNum1="+vo.getRowNum1()+"rowNum2="+vo.getRowNum2());
		map.put("itemPVO", vo);
		map.put("IList", service.selectItemReviewList(vo));
		return map;
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
	
	//내가 쓴 리뷰 리스트 조회
	@ResponseBody
	@RequestMapping("/selectMyReviewList")
	public Map<String, Object> selectMyAllReview(HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo.setUserid((String)ses.getAttribute("logId"));
		vo.setOnePageRecord(5);
		vo.setOnePageSize(5);
		System.out.println("reviewsearchkey="+vo.getSearchKey());
		if(vo.getSearchKey().equals("userid")){
			vo.setSearchWord("");
			vo.setSearchKey("item_review.userid");
		}
		
		
		if(vo.getSearchKey().equals("subject")) {
			if(vo.getKategorie().equals("mem_share")) {
				vo.setSearchKey("s_subject");
			}else if(vo.getKategorie().equals("grouplocal")) {
				vo.setSearchKey("g_subject");
			}else if(vo.getKategorie().equals("sell_item")) {
				vo.setSearchKey("i_subject");
			}
		}
		vo.setSearchDate(vo.getSearchDate()+" 00:00:00");
		vo.setSearchDate2(vo.getSearchDate2()+" 23:59:59");
		
		vo.setSearchWord("%"+vo.getSearchWord()+"%");
		System.out.println("searchKey="+vo.getSearchKey());
		System.out.println("nowNum="+vo.getNowNum());
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		vo.setTotalRecord(service.selectMyReviewListCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		System.out.println("reviewtotalrecord="+vo.getTotalRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		
		
		map.put("list", service.selectMyReviewList(vo));
		map.put("pVO", vo);

		return map;
	}
	
	
	//joinus 참여상태 업데이트
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
		System.out.println("num="+vo.getNum());
		System.out.println("re_num="+vo.getRe_num());
		
		rVO = service.selectMyReview(vo);
		return rVO;
	}
	
	//리뷰 수정
	@ResponseBody
	@RequestMapping("/reviewUpdate")
	public int reviewUpdate(HttpSession ses, ItemReviewVO vo) {
		int result = 0;
		
		vo.setUserid((String)ses.getAttribute("logId"));
		result = service.reviewUpdate(vo);
		
		return result;
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
	
	//나의 활동 페이지 게시글 리스트 불러오기
	@ResponseBody
	@RequestMapping("/selectMyBoard")
	public Map<String, Object> selectMyBoard(HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setUserid((String)ses.getAttribute("logId"));
		vo.setOnePageRecord(8);
		vo.setOnePageSize(5);
		
		vo.setSearchDate(vo.getSearchDate()+" 00:00:00");
		vo.setSearchDate2(vo.getSearchDate2()+" 23:59:59");
		System.out.println("qnaKey2="+vo.getSearchKey2());

		if(vo.getKategorie().equals("board")) {
			vo.setDateContent("b_writedate");
		}else if(vo.getKategorie().equals("reply")) {
			vo.setDateContent("rep_date");
		}else if(vo.getKategorie().equals("qna") || vo.getKategorie().equals("seller")){
			vo.setDateContent("q_writedate");			
		}
		
		vo.setSearchWord("%"+vo.getSearchWord()+"%");
		System.out.println("searchKey="+vo.getSearchKey());
		System.out.println("searchWord="+vo.getSearchWord());
		
		System.out.println("nowNum="+vo.getNowNum());
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		vo.setTotalRecord(service.selectMyBoardCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		System.out.println("reviewtotalrecord="+vo.getTotalRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		
		map.put("list", service.selectMyBoard(vo));
		map.put("pVO", vo);
		map.put("count", service.selectMyCount(vo.getUserid()));
		
		return map;
	}
	//게시글, 댓글 지우기
	@ResponseBody
	@RequestMapping("/deleteBoard")
	public int deleteBoard(HttpSession ses, HttpServletRequest req) {
		int result = 0;
		String userid = (String)ses.getAttribute("logId");
		String kategorie = (String)req.getParameter("kategorie");
		String numList[] = req.getParameterValues("num");
		System.out.println("kategorie="+kategorie);
		System.out.println("list="+Arrays.toString(numList));
	
		String[] num = numList[0].split(",");
		int[] numArr = new int[num.length];
		for(int i = 0; i < num.length; i++) {
			numArr[i] = Integer.parseInt(num[i]);
		}
		System.out.println("num=="+Arrays.toString(numArr));
		result = service.deleteBoard(kategorie, numArr, userid);
		System.out.println("result="+result);
		return result;
	}
	
	
	//qna 데이터 하나 불러오기
	@ResponseBody
	@RequestMapping("/setQnA")	
	public QnAVO setQnA(HttpSession ses, HttpServletRequest req) {
		QnAVO vo =  new QnAVO();
		String userid = (String)ses.getAttribute("logId");
		int q_num = Integer.parseInt(req.getParameter("q_num"));
		String searchKey = (String)req.getParameter("searchKey");
		vo = service.setQnA(q_num, userid, searchKey);
		System.out.println("q_num="+q_num+"id="+userid);
		System.out.println("vo="+vo);
		return vo;
	}
	
	//qna 답변쓰기
	@ResponseBody
	@RequestMapping("/QnAAnswerWrite")
	public int QnAAnswerWrite(HttpSession ses, QnAVO vo) {
		int result = 0;
		
		result = service.QnAAnswerWrite(vo);
		
		return result;
	}

	//상품리스트 불러오기
	@ResponseBody
	@RequestMapping("/selectProductList")
	public Map<String, Object> selectProductList(HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setUserid((String)ses.getAttribute("logId"));
		vo.setOnePageRecord(10);
		vo.setOnePageSize(5);
		
		System.out.println("key2="+vo.getSearchKey2());
		vo.setSearchDate(vo.getSearchDate()+" 00:00:00");
		vo.setSearchDate2(vo.getSearchDate2()+" 23:59:59");
		vo.setDateContent("i_period");
		vo.setSearchWord("%"+vo.getSearchWord()+"%");
		
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		vo.setTotalRecord(service.selectProductListCount(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		
		map.put("count", service.sellerCount(vo.getUserid()));
		map.put("list", service.selectProductList(vo));
		map.put("pVO", vo);
		
		return map;
	}
	
	//상품 판매상태 변경
	@ResponseBody
	@RequestMapping("/updateProductStatus")
	public int updateProductStatus(HttpServletRequest req) {
		int result = 0;
		int i_num = Integer.parseInt(req.getParameter("i_num"));
		result = service.updateProductStatus(i_num);
		
		return result;
	}
	
	//판매 기간 변경
	@ResponseBody
	@RequestMapping("/updateProductPeriod")
	//상품 종료일 변경
	public int updateProductPeriod(HttpServletRequest req) {
		int result = 0;
		int i_num = Integer.parseInt(req.getParameter("i_num"));
		String date = (String)req.getParameter("date");
		result = service.updateProductPeriod(i_num, date);
		
		return result;
	}
//판매관리 메인 2021.05.23 hj

	@RequestMapping("/myInfoSaleHistory")
	public ModelAndView myInfoSaleHistory(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)ses.getAttribute("logId");
		
		List<SellerVO> sel_info = service.selectSelinfo(userid);//셀러정보, 정산금액
		mav.addObject("selInfo", sel_info);
		
		List<Integer> saleCount = sellerService.myInfoCountSale(userid); //상품현황
		mav.addObject("saleCount", saleCount);
		
		List<Integer> orderCnt = service.selectOrderInfo(userid);//주문정보
		System.out.println("- - - - - - - - - - - - - > "+orderCnt.size());
		mav.addObject("orderCnt", orderCnt);
		
		mav.setViewName("myInfo/myInfoSaleHistory");
		return mav;
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
	public ModelAndView myInfoSalesManagement(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		AdminPageVO pageVO = new AdminPageVO();
		//현재 날짜 
		Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM");
		String month = sdf.format(oCalendar.getTime());
		month+="-01";
		pageVO.setMonth(month);//현재 21/05월 /01일을 세팅
		pageVO.setSearchKey("");
		pageVO.setSearchWord("");
		pageVO.setUserid((String)(ses.getAttribute("logId")));
		pageVO.setTotalRecord(service.managementCount(pageVO));
		mav.addObject("list",service.manageList(pageVO));
		mav.setViewName("myInfo/myInfoSalesManagement");
		return mav;
	}
	@RequestMapping("/myInfoStatistics")
	public ModelAndView myInfoStatistics(HttpSession ses,int month) {
		ModelAndView mav = new ModelAndView();
		String userid = ((String)ses.getAttribute("logId"));
		String monthStr = monthStr(month+1);
		mav.addObject("notOkVO",service.statisTotal(userid,1,monthStr));
		mav.addObject("OkVO",service.statisTotal(userid,2,monthStr));
		mav.addObject("list",service.statisList(userid,monthStr));
		//한달전 매출
		mav.addObject("month1VO", service.statisTotal(userid, 2, monthStr(month)));
		//두달전 매출
		mav.addObject("month2VO", service.statisTotal(userid, 2, monthStr(month-1)));
		String monthArr[] = {monthStr(month-1),monthStr(month),monthStr(month+1)};
		mav.addObject("monthArr",monthArr);
		mav.setViewName("myInfo/myInfoStatistics");
		return mav;
	}
	public String monthStr(int month) {
		String monthStr;
		if(month==1) {
			monthStr="12";
		}else if(month-1<10) {
			monthStr = "0"+(month-1);
		}else {
			monthStr = ""+(month-1);
		}
		return monthStr;
	}
	
	@ResponseBody
	@RequestMapping("/selectSalesManagement")
	public Map<String, Object> selectSalesManagement(HttpServletRequest req, HttpSession ses, MyinfoPageVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setUserid((String)ses.getAttribute("logId"));
		vo.setOnePageRecord(10);
		vo.setOnePageSize(5);
		
		System.out.println("key2="+vo.getSearchKey2());
		vo.setSearchDate(vo.getSearchDate()+" 00:00:00");
		vo.setSearchDate2(vo.getSearchDate2()+" 23:59:59");
		vo.setSearchWord("%"+vo.getSearchWord()+"%");
		
		vo.setStartPage(vo.getNowNum(), vo.getOnePageSize());
		vo.setTotalRecord(service.selectSaleManagementCounut(vo));
		vo.setTotalPage(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setLastPageRecord(vo.getTotalRecord(), vo.getOnePageRecord());
		vo.setRowNum1(vo.getNowNum(), vo.getOnePageRecord());
		vo.setRowNum2(vo.getNowNum(), vo.getTotalPage(), vo.getLastPageRecord(), vo.getOnePageRecord());
		
		map.put("list", service.selectSalesManagement(vo));
		map.put("pVO", vo);
		map.put("count", service.orderCount(vo.getUserid()));
		return map;
		
	}
	@RequestMapping("/myInfoReviewManagement")
	public String myInfoReviewManagement() {
		return "myInfo/myInfoReviewManagement";
	}
	
	@RequestMapping("/myInfoQnAManagement")
	public String myInfoQnAManagement() {
		
		return "myInfo/myInfoQnAManagement";
	}
}
