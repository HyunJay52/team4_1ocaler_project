package com.team4.localer.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.CsService;
import com.team4.localer.service.ManageService;
import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.AdminspendVO;
import com.team4.localer.vo.AdminstatisVO;
import com.team4.localer.vo.GroupVO;
import com.team4.localer.vo.MemShareVO;
import com.team4.localer.vo.Mem_statisVO;
import com.team4.localer.vo.MemberVO;

@Controller
public class AdminManageController {
	@Inject
	ManageService manaService;
	@Inject
	CsService csService;
	//=====회원관리 페이지
	@RequestMapping("/m_mem")//회원관리-일반회원 
	public ModelAndView m_mem(AdminPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		pageVO.setNum("mem_no");
		pageVO.setCate("member");
		pageVO.setSearchKey("");
		pageVO.setSearchWord("");
		//총레코드 구하기
		pageVO.setTotalRecord(csService.totalRecord(pageVO));
		System.out.println("totalRecord"+pageVO.getTotalRecord());
		//회원목록가져오기 
		mav.addObject("list",manaService.memberAllSelect(pageVO));
		mav.addObject("pageVO",pageVO);
		//현재 날짜 
		Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM");
		String month = sdf.format(oCalendar.getTime());
		month+="-01";
		mav.addObject("statis",manaService.statismem(month));
		mav.setViewName("admin/m_mem");
		return mav;
	}
	@RequestMapping(value="/memListSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memListSearch(AdminPageVO pageVO,String cate){
		Map<String, Object> result = new HashMap<String, Object>();
		pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
		pageVO.setNum("mem_no");
		pageVO.setCate("member");
		pageVO.setTotalRecord(csService.totalRecord(pageVO));
		result.put("list",manaService.memberAllSelect(pageVO));
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	
	@RequestMapping(value="/mem_detail", method=RequestMethod.POST)
	@ResponseBody
	public String[] memberdetail(String userid) {
		String result[] = new String[5];
		//게시물수 , 등급, 가입날짜
		MemberVO mVO = manaService.memOneSelect(userid);
		result[0] = mVO.getMem_post()+"";//게시물수
		result[2] = mVO.getMem_rev()+"";//등급
		result[3] = mVO.getMem_sub()+"";//가입날짜
		//댓글수 누적신고 count
		result[1] = manaService.memInfoCount(userid,"reply")+"";
		result[4] = manaService.memInfoCount(userid,"report")+"";
		
		return result;
	};
	@RequestMapping(value="/memUpdate", method=RequestMethod.POST)
	@ResponseBody
	public int memUpdate(String userid, String cate, int status) {
		System.out.println("memUpdate들어옴");
		return manaService.memberManageUpdate(userid,cate,status);
	}
	//===========셀러관리페이지
	@RequestMapping("/m_sel")//회원관리-셀러회원 
	public ModelAndView m_sel(AdminPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		pageVO.setNum("sel_num");
		pageVO.setCate("seller");
		pageVO.setSearchKey("");
		pageVO.setSearchWord("");
		//총레코드 구하기
		pageVO.setTotalRecord(csService.totalRecord(pageVO));
		System.out.println("totalRecord"+pageVO.getTotalRecord());
		//회원목록가져오기 
		mav.addObject("list",manaService.sellerAllSelect(pageVO));
		mav.addObject("pageVO",pageVO);
		//현재 날짜 
		Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM");
		String month = sdf.format(oCalendar.getTime());
		month+="-01";
		mav.addObject("statis",manaService.statismem(month));
		mav.setViewName("admin/m_sel");
		return mav;
	}
	@RequestMapping(value="/sellerListSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sellerListSearch(AdminPageVO pageVO){
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println("Key="+pageVO.getSearchKey());
		System.out.println("word="+pageVO.getSearchWord());
		pageVO.setNum("sel_num");
		pageVO.setCate("seller");
		if(pageVO.getSearchWord()!=null && !pageVO.getSearchWord().equals("")) {
			//검색어가 존재하면
			pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
			System.out.println("검색어 존재하는데 여기 안들어오니?");
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
			pageVO.setSearchKey("s."+pageVO.getSearchKey());
		}else {
			pageVO.setSearchKey("");
			pageVO.setSearchWord("");
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
		}
		
		
		result.put("list",manaService.sellerAllSelect(pageVO));
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	//회원 아이디 클릭시 
	@RequestMapping(value="/sel_detail", method=RequestMethod.POST)
	@ResponseBody
	public List<AdminstatisVO> sellerdetail(int sel_num) {
		//판매글 번호, 글제목, 판매 횟수/환불횟수, 작성자, 작성날짜, 디폴트판매가격
		return manaService.sellerDetailInfo(sel_num);
	};
	
	//게시글관리========================
	//======판매게시글관리===================
	@RequestMapping("/selManage")//회원판매 게시글 조회
	public ModelAndView selManage(AdminPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		pageVO.setNum("num");
		pageVO.setCate("mem_share");
		pageVO.setSearchKey("");
		pageVO.setSearchWord("");
		//총레코드 구하기
		pageVO.setTotalRecord(csService.totalRecord(pageVO));
		System.out.println("totalRecord"+pageVO.getTotalRecord());
		//판매게시글목록가져오기 
		List<MemShareVO> list = manaService.memShareAllSelect(pageVO);
		mav.addObject("list",list);
		//페이지 통계부분 
		mav.addObject("statisVO",manaService.selManageStatis());
		mav.addObject("pageVO",pageVO);
		mav.setViewName("admin/selManage");
		return mav;
	}
	@RequestMapping(value="/sellerBoardSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sellerBoardSearch(AdminPageVO pageVO){//sell_item,mem_share list 아작스 호출
		Map<String, Object> result = new HashMap<String, Object>();
		if(pageVO.getSearchWord()!=null && !pageVO.getSearchWord().equals("")) {
			//검색어가 존재하면
			pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
		}else {
			pageVO.setSearchKey("");
			pageVO.setSearchWord("");
		}
		if(pageVO.getCate()=="sell_item"|| pageVO.getCate().equals("sell_item")) {
			pageVO.setNum("i_num");
			pageVO.setCate("sell_item");
			//i_num게시글번호,i_subject글제목, i_content, sel_num판매자 번호
			if(pageVO.getSearchKey()=="userid"||pageVO.getSearchKey().equals("userid")) {
				pageVO.setSearchKey("sel_num");
				pageVO.setTotalRecord(csService.totalRecord(pageVO));
				
				pageVO.setSearchKey("i.sel_num");
				result.put("list",manaService.sellerBoardSelect(pageVO));
			}else {
				pageVO.setSearchKey("i_"+pageVO.getSearchKey());
				pageVO.setTotalRecord(csService.totalRecord(pageVO));
				pageVO.setSearchKey("i."+pageVO.getSearchKey());
				result.put("list",manaService.sellerBoardSelect(pageVO));
			}
		}else {
			pageVO.setNum("num");
			pageVO.setCate("mem_share");
			if(pageVO.getSearchKey()=="userid"||pageVO.getSearchKey().equals("userid")
					||pageVO.getSearchKey()=="num"||pageVO.getSearchKey().equals("num")) {
				pageVO.setTotalRecord(csService.totalRecord(pageVO));
				pageVO.setSearchKey("m."+pageVO.getSearchKey());
			}else {
				pageVO.setSearchKey("s_"+pageVO.getSearchKey());
				pageVO.setTotalRecord(csService.totalRecord(pageVO));
				pageVO.setSearchKey("m."+pageVO.getSearchKey());
				
			}
			List<MemShareVO> list = manaService.memShareAllSelect(pageVO);
			result.put("list",list);
			
		}
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("onePageNum", pageVO.getOnePageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	@RequestMapping("/selManageDel")
	public ModelAndView selManageDel(int num, String cate) {
		String numName="num";
		if(cate!="mem_share"&&!cate.equals("mem_share")) {
			numName="i_num";
		}
		manaService.selManageDel(num,cate,numName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:selManage");
		return mav;
	}
	//============게시글 관리
	@RequestMapping("/boardManage")//회원판매 게시글 조회
	public ModelAndView boardManage(AdminPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		pageVO.setNum("num");
		pageVO.setCate("grouplocal");
		pageVO.setSearchKey("");
		pageVO.setSearchWord("");
		//총레코드 구하기
		pageVO.setTotalRecord(csService.totalRecord(pageVO));
		//모집게시글목록가져오기 
		mav.addObject("list",manaService.boardManageAllSelect(pageVO));
		//페이지 통계부분 
		mav.addObject("statisVO",manaService.boardManageStatis());
		mav.addObject("pageVO",pageVO);
		mav.setViewName("admin/boardManage");
		return mav;
	}
	//자유자게 리스트,검색, 페이징
	@RequestMapping(value="/cumuManageListSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cumuManageListSearch(AdminPageVO pageVO){
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println("Key="+pageVO.getSearchKey());
		System.out.println("word="+pageVO.getSearchWord());
		pageVO.setNum("num");
		pageVO.setCate("board");
		if(pageVO.getSearchWord()!=null && !pageVO.getSearchWord().equals("")) {
			//검색어가 존재하면
			pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
			if(pageVO.getSearchKey()=="subject" || pageVO.getSearchKey().equals("subject")) {
				pageVO.setSearchKey("b_"+pageVO.getSearchKey());
			}
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
			pageVO.setSearchKey("b."+pageVO.getSearchKey());
		}else {
			pageVO.setSearchKey("");
			pageVO.setSearchWord("");
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
		}
		
		
		result.put("list",manaService.cumuManageListSearch(pageVO));
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	//모집 게시판 검색, 리스트,페이징 
	@RequestMapping(value="/groupManageListSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> groupManageListSearch(AdminPageVO pageVO){
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println("Key="+pageVO.getSearchKey());
		System.out.println("word="+pageVO.getSearchWord());
		pageVO.setNum("num");
		pageVO.setCate("grouplocal");
		if(pageVO.getSearchWord()!=null && !pageVO.getSearchWord().equals("")) {
			//검색어가 존재하면
			pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
			if(pageVO.getSearchKey()=="subject" || pageVO.getSearchKey().equals("subject")) {
				pageVO.setSearchKey("g_"+pageVO.getSearchKey());
			}
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
			pageVO.setSearchKey("g."+pageVO.getSearchKey());
			
		}else {
			pageVO.setSearchKey("");
			pageVO.setSearchWord("");
			pageVO.setTotalRecord(csService.totalRecord(pageVO));
		}
		result.put("list",manaService.boardManageAllSelect(pageVO));
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	@RequestMapping("/boardManageDel")
	public ModelAndView boardManageDel(int num, String cate) {
		String numName="num";
		manaService.selManageDel(num,cate,numName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:boardManage");
		return mav;
	}
	//=========================통계부분==============================
	//회원통계부분
	@RequestMapping("/statis_mem")//회원 통계
	public ModelAndView statis_mem(int month) {
		ModelAndView mav = new ModelAndView();
		Mem_statisVO statisVO = new Mem_statisVO();
		statisVO.setMonth(month);
		mav.addObject("dataVO",statisVO);
		//3,4,5월 방문자수 구하기, //3,4,5월 누적 회원 순위 
		mav.addObject("memCountVO",manaService.loginNum(statisVO));
		//3,4,5월 신규 회원수,셀러수
		mav.addObject("newCountVO",manaService.newmem(statisVO));
		//지역구별 로그인수
		mav.addObject("guVO",manaService.guLoginCount(statisVO));
		//일반회원수/셀러회원수, 신규회원수/휴면회원수
		mav.addObject("subVO",manaService.subCount(statisVO));
		mav.setViewName("admin/statis_mem");
		return mav;
	}
	//게시판 통계부분
	@RequestMapping("/statis_board")//판매관리
	public ModelAndView statis_board(int month) {
		ModelAndView mav = new ModelAndView();
		Mem_statisVO statisVO = new Mem_statisVO();
		//5월 신규
		statisVO.setMonth(month);
		String resultMonth[] = {statisVO.getMonth1(),statisVO.getMonth2(),statisVO.getMonth3()};
		mav.addObject("monthArr",resultMonth);
		//지역구별 모집게시판 글 등록순
		mav.addObject("guVO",manaService.guGroupCount(statisVO));
		mav.addObject("cateVO",manaService.cateCount(statisVO));
		mav.addObject("month3",manaService.boardStatis(statisVO));
		//4월 신규
		statisVO = monthCal1(statisVO);//4월 넣어주는 과정
		mav.addObject("month2",manaService.boardStatis(statisVO));
		//3월 신규
		statisVO = monthCal1(statisVO);//3월 넣어주는 과정
		mav.addObject("month1",manaService.boardStatis(statisVO));
		//셀러판매 게시판 조회수 기준으로 select 하기
		mav.setViewName("admin/statis_board");
		return mav;
	}
	
	public Mem_statisVO monthCal1(Mem_statisVO vo) {
		if(vo.getMonth()-1<=0) {
			vo.setMonth(12);
		}else {
			vo.setMonth(vo.getMonth()-1);
		}
		return vo;
	}
	
	//===========정산====
	@RequestMapping("/spend_mem")//회원정산
	public ModelAndView spend_mem(int month) {
		ModelAndView mav = new ModelAndView();
		Mem_statisVO statisVO = new Mem_statisVO();
		//5월 신규
		statisVO.setMonth(month);
		String resultMonth[] = {statisVO.getMonth1(),statisVO.getMonth2(),statisVO.getMonth3()};
		///이번달 충번횟수, 무통장, 카드
		mav.addObject("cntVO",manaService.memspendCnt(statisVO));
		mav.addObject("monthArr",resultMonth);//3월,4월 5월 넣기
		mav.addObject("totalVO",manaService.memspend(statisVO));//5월 충전포,소비포
		statisVO = monthCal1(statisVO);//4월 넣어주는 과정
		mav.addObject("month2VO",manaService.memspend(statisVO));//4월
		statisVO = monthCal1(statisVO);//3월 넣어주는 과정
		mav.addObject("month1VO",manaService.memspend(statisVO));//3월
		//회원포인트 리스트 부분
		AdminPageVO pageVO = new AdminPageVO();
		pageVO.setSearchKey("");pageVO.setSearchWord("");
		//총레코드 구하기
		pageVO.setTotalRecord(csService.spendtotalRecord(pageVO));
//		//회원 테이블 리스트
		pageVO.setNum("userid");//num설정해줘야한다 pageVO에 
		mav.addObject("list",manaService.mempsendList(pageVO));
		mav.addObject("pageVO", pageVO);
		mav.setViewName("admin/spend_mem");
		return mav;
	}
	@RequestMapping(value="/memspendSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memspendSearch(AdminPageVO pageVO){
		Map<String, Object> result = new HashMap<String, Object>();
		//검색어가 있을때
		pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
		pageVO.setNum("userid");
		pageVO.setTotalRecord(csService.spendtotalRecord(pageVO));//총레코드구하기
		pageVO.setSearchKey("ch3.userid");
		result.put("list",manaService.mempsendList(pageVO));
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	@RequestMapping(value="/memspendModal",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memspendModal(String userid,String modal,AdminPageVO pageVO){
		Map<String, Object> result = new HashMap<String, Object>();
		//클릭한 userid, modal1 -> 사용자가 사용한 point 내역
		if(modal=="modal1" || modal.equals("modal1")) {//modal1 -> 사용자가 사용한 point 내역
			result.put("list",manaService.mempsendmodal1List(userid));
		}else {
			result.put("list",manaService.mempsendmodal2List(userid));
		}
		return result;
	}
	//셀러 정산============
	@RequestMapping("/spend_sel")//판매관리
	public ModelAndView spend_sel(int month) {
		ModelAndView mav = new ModelAndView();
		Mem_statisVO statisVO = new Mem_statisVO();
		//5월 신규
		statisVO.setMonth(month);
		String resultMonth[] = {statisVO.getMonth1(),statisVO.getMonth2(),statisVO.getMonth3()};
		mav.addObject("monthArr",resultMonth);//3월,4월 5월 넣기
		//누적 매출, 누적 수익
		mav.addObject("total",manaService.selspendtotal(statisVO));
		//3,4,5월 게시글수 넣어주기
		mav.addObject("boardCnt",manaService.countboard(statisVO));
		//정산전 정산 후 
		mav.addObject("spendCnt",manaService.countspend(statisVO));
		//selspendList
		AdminPageVO pageVO = new AdminPageVO();
		String monthStr="";
		if(month<10) {
			monthStr="0"+month;
		}else {
			monthStr=""+month;
		}
		pageVO.setMonth(monthStr);
		pageVO.setTotalRecord(csService.selspendtotalRecord(pageVO));
		mav.addObject("list",manaService.selspendList(pageVO));
		mav.addObject("pageVO",pageVO);
		//이번달 수익 매출 
		mav.addObject("month3",manaService.selspendmonth(statisVO));
		statisVO = monthCal1(statisVO);//4월 넣어주는 과정
		mav.addObject("month2",manaService.selspendmonth(statisVO));
		statisVO = monthCal1(statisVO);//3월 넣어주는 과정
		mav.addObject("month1",manaService.selspendmonth(statisVO));
		mav.setViewName("admin/spend_sel");
		return mav;
	}
	@RequestMapping(value="/selspendSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selspendSearch(AdminPageVO pageVO){
		Map<String, Object> result = new HashMap<String, Object>();
		//검색어가 있을때
		pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
		pageVO.setTotalRecord(csService.selspendtotalRecord(pageVO));//총레코드구하기
		
		pageVO.setSearchKey("sel1."+pageVO.getSearchKey());
		result.put("list",manaService.selspendList(pageVO));
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
	@RequestMapping(value="/selspendModal",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selspendModal(int num){
		Map<String, Object> result = new HashMap<String, Object>();
		//글번호에 해당하는 ordertbl 리스트	
		result.put("list",manaService.selpsendmodalList(num));
		return result;
	}
}
