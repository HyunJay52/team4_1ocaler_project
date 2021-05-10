package com.team4.localer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.CsService;
import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.CsVO;
import com.team4.localer.vo.OftenqVO;
import com.team4.localer.vo.ReportVO;

@Controller
public class AdminController {
	
	@Inject
	CsService csService;
	
	
	@RequestMapping("/main")//관리자 메인페이지 
	public ModelAndView main(HttpSession session) {
		session.setAttribute("logId", "admin");
		ModelAndView mav = new ModelAndView();
		//cstable 미답변 list 불러오기 
		mav.addObject("list",csService.csTblSelect());
		mav.setViewName("admin/main");
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
	
	@RequestMapping("/spend_sel")//판매관리
	public ModelAndView spend_sel() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/spend_sel");
		return mav;
	}
	@RequestMapping("/oftenAndCs")
	@ResponseBody
	public List<CsVO> oftenAndCs(String cate){
		ModelAndView mav = new ModelAndView();
		
		//cate : oftenq(자주하는질문), report(신고),cs(1:1문의)
		if(cate=="oftenq"||cate.equals("oftenq")) {
			//자주하는 질문
			return csService.oftenqSelect();
		}else if(cate=="report"||cate.equals("report")) {
			//신고글
			return csService.reportSelect();
		}else{//1:1문의
			return csService.boardAllSelect();
		}
	}
	
	@RequestMapping("/persnal")//판매관리
	public ModelAndView persnal(int cs_num) {
		//csTbl에서 문의글 1개 가져오기 
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", csService.boardSelect(cs_num));
		mav.setViewName("admin/persnal");
		return mav;
	}
	//1:1문의 답변달아주기
	@RequestMapping(value="/persnalOk", method=RequestMethod.POST)
	public ModelAndView persnalOk(CsVO vo) {
		ModelAndView mav = new ModelAndView();
		//csTbl 업데이트문 
		if(csService.boardUpdate(vo)>0) {//답변달기 성공
			mav.setViewName("redirect:cspage");
		}else {//실패
			mav.addObject("cs_num",vo.getCs_num());
			mav.setViewName("redirect:persnal");
		}
		return mav;
	}
	//자주하는 질문 수정페이지이동
	@RequestMapping("/oftenQWriteEdit")
	public ModelAndView oftenQWriteEdit(int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", csService.oftenqOneSelect(num));
		mav.setViewName("admin/oftenQEdit");
		return mav;
	}
	//자주하는 질문 수정
	@RequestMapping(value="oftenQWriteEditOk", method=RequestMethod.POST)
	public ModelAndView oftenQWriteEditOk(OftenqVO vo) {
		ModelAndView mav = new ModelAndView();
		if(csService.oftenqUpdate(vo)>0) {//수정성공
			mav.setViewName("redirect:cspage");
		}else {
			mav.addObject("num",vo.getOf_num());
			mav.setViewName("redirect:oftenQWriteEdit");
		}
		return mav;
	}
	@RequestMapping("/oftenQDelete")
	public ModelAndView oftenQDelete(int num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("logId")=="admin" ||session.getAttribute("logId").equals("admin")) {
			//현재 로그인된 아이디가 관리자이면 삭제를 수행한다. 
			if(csService.oftenqDelete(num)>0) {//삭제성공
				System.out.println("자주하는 질문 삭제");
			}
		}
		mav.setViewName("redirect:cspage");
		return mav;
	}
	//자주하는 질문 작성페이지이동
	@RequestMapping("/oftenQWrite")
	public ModelAndView oftenQWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/oftenQWrite");
		return mav;
	}
	//자주하는 질문 작성
	@RequestMapping(value="/oftenQWriteOk",method=RequestMethod.POST)
	public ModelAndView oftenQWriteOk(OftenqVO vo,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String sessionId =(String)session.getAttribute("logId");
		if(sessionId.equals("admin") || sessionId== "admin") {
			vo.setOf_cate("["+vo.getOf_cate()+"]");
			csService.oftenqInsert(vo);
		}
		mav.setViewName("redirect:cspage");
		return mav;
	}
	//신고처리 페이지 이동
	@RequestMapping("/reportEdit")
	public ModelAndView repoertEdit(int num) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo",csService.reportOneSelect(num));
		mav.setViewName("admin/reportEdit");
		return mav;
	}
	//신고처리 페이지 결과 update
	@RequestMapping(value="/reportEditOk",method=RequestMethod.POST)
	public ModelAndView reportEditOk(ReportVO vo) {
		ModelAndView mav = new ModelAndView();
		//신고글 상태 업데이트 해주는게 필요
		if(csService.reportUpdate(vo)>0) {//신고처리가 되면
			mav.setViewName("redirect:cspage");
		}else {//실패시
			mav.addObject("num",vo.getRep_num());
			mav.setViewName("redirect: reportEdit");
		}
		return mav;
	}
	//고객센터 페이지 검색
	@RequestMapping("/searchCS")
	@ResponseBody
	public List<CsVO> searchCS(String searchkey,String text,String cate){
		if(searchkey=="userid"||searchkey.equals("userid")) {//검색key가 userid일때
			if(cate.equals("oftenq")) {//자주하는 질문일때
				return csService.searchOftenq(searchkey,"%"+text+"%");
			}else if(cate.equals("cs")) {
				return csService.searchCs(searchkey,"%"+text+"%");
			}else {
				return csService.searchReport(searchkey,"%"+text+"%");
			}
		}
		if(cate.equals("oftenq")) {//자주하는 질문일때
			return csService.searchOftenq("of_"+searchkey,"%"+text+"%");
		}else if(cate.equals("cs")) {
			return csService.searchCs("cs_"+searchkey,"%"+text+"%");
		}else {
			return csService.searchReport("rep_"+searchkey,"%"+text+"%");
			
		}
	}
	//신고부분 검색, 아작스 paging
	@RequestMapping(value="/pagingCS",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> pagingCSpage(AdminPageVO pageVO, String cate){
		Map<String, Object> result = new HashMap<String, Object>();
		if(pageVO.getSearchWord()!=null && !pageVO.getSearchWord().equals("")) {
			//검색어가 존재하면
			pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
		}
		if(cate=="report"||cate.equals("report")) {//신고부분일때 
			pageVO.setNum("rep_num");
			pageVO.setCate("report");
			if(pageVO.getSearchKey()!="userid" && !pageVO.getSearchKey().equals("userid")) {
				pageVO.setSearchKey("rep_"+pageVO.getSearchKey());
			}
			System.out.println("컨트롤러에서 확인 searchWord"+pageVO.getSearchWord());
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
			result.put("list",csService.onePageRecordSelect_rep(pageVO));
		}else if(cate=="cs"||cate.equals("cs")) {
			pageVO.setNum("cs_num");
			pageVO.setCate("cs");
			if(pageVO.getSearchKey()!="userid" && !pageVO.getSearchKey().equals("userid")) {
				pageVO.setSearchKey("cs_"+pageVO.getSearchKey());
			}
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
			result.put("list",csService.onePageRecordSelect_cs(pageVO));
		}else if(cate=="often"||cate.equals("often")) {
			pageVO.setNum("of_num");
			pageVO.setCate("oftenq");
			if(pageVO.getSearchKey()!="userid" && !pageVO.getSearchKey().equals("userid")) {
				pageVO.setSearchKey("of_"+pageVO.getSearchKey());
			}
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
			result.put("list",csService.onePageRecordSelect_of(pageVO));
		}
		
		//총레코드 구하기
		
		
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	@RequestMapping("/cspage")//고객센터->신고 목록
	public ModelAndView cspage(AdminPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		pageVO.setNum("rep_num");
		pageVO.setCate("report");
		pageVO.setSearchKey("");
		pageVO.setSearchWord("");
		//총레코드 구하기
		pageVO.setTotalRecord(csService.totalRecord(pageVO));
		System.out.println("totalRecord"+pageVO.getTotalRecord());
		//신고글 리스트 select
		mav.addObject("list",csService.onePageRecordSelect_rep(pageVO));
		mav.addObject("pageVO",pageVO);
		mav.setViewName("admin/cspage");
		return mav;
	}
}

