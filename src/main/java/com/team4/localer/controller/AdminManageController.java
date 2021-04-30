package com.team4.localer.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.ManageService;
import com.team4.localer.vo.MemberVO;

@Controller
public class AdminManageController {
	@Inject
	ManageService manaService;
	//=====회원관리 페이지
	@RequestMapping("/m_mem")//회원관리-일반회원 
	public ModelAndView m_mem() {
		ModelAndView mav = new ModelAndView();
		//회원목록가져오기 
		mav.addObject("list",manaService.memAllSelect("",""));
		mav.setViewName("admin/m_mem");
		return mav;
	}
	@RequestMapping(value="/memListSearch",method=RequestMethod.POST)
	@ResponseBody
	public List<MemberVO> memListSearch(String searchkey,String searchword){
		System.out.println("searchkey"+searchkey+"searchword"+searchword);
		return manaService.memAllSelect(searchkey,"%"+searchword+"%");
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
		return manaService.memberManageUpdate(userid,cate,status);
	}
	//===========셀러관리페이지
	@RequestMapping("/m_sel")//회원관리-일반회원 
	public ModelAndView m_sel() {
		ModelAndView mav = new ModelAndView();
		manaService.sellerAllSelect("","");
		mav.setViewName("admin/m_sel");
		return mav;
	}
	
	
}
