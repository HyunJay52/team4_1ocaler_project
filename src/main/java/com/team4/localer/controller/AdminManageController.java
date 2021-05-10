package com.team4.localer.controller;

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
import com.team4.localer.vo.AdminstatisVO;
import com.team4.localer.vo.GroupVO;
import com.team4.localer.vo.MemShareVO;
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
		mav.setViewName("admin/m_mem");
		return mav;
	}
	@RequestMapping(value="/memListSearch",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memListSearch(AdminPageVO pageVO){
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
	@RequestMapping("/m_sel")//회원관리-일반회원 
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
}
