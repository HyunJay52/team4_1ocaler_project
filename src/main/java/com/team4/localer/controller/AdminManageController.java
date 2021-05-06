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
		System.out.println("컨트롤러에서 확인 searchWord"+pageVO.getSearchWord());
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
		pageVO.setSearchWord("%"+pageVO.getSearchWord()+"%");
		pageVO.setNum("sel_num");
		pageVO.setCate("seller");
		System.out.println("컨트롤러에서 확인 searchWord"+pageVO.getSearchWord());
		pageVO.setTotalRecord(csService.totalRecord(pageVO));
		result.put("list",manaService.sellerAllSelect(pageVO));
		result.put("pageNum",pageVO.getPageNum());
		result.put("startPageNum",pageVO.getStartPageNum());
		result.put("totalPage", pageVO.getTotalPage());
		return result;
	}
//	@RequestMapping(value="/sel_detail", method=RequestMethod.POST)
//	@ResponseBody
//	public String[] sellerdetail(int sel_num) {
//		String result[] = new String[5];
//		//판매글 번호, 글제목, 판매 횟수/환불횟수, 작성자, 작성날짜, 디폴트판매가격
//		MemberVO mVO = manaService.memOneSelect(userid);
//		result[0] = mVO.getMem_post()+"";//게시물수
//		result[2] = mVO.getMem_rev()+"";//등급
//		result[3] = mVO.getMem_sub()+"";//가입날짜
//		//댓글수 누적신고 count
//		result[1] = manaService.memInfoCount(userid,"reply")+"";
//		result[4] = manaService.memInfoCount(userid,"report")+"";
//		
//		return result;
//	};
	
	
}
