package com.team4.localer;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.DealShareService;
import com.team4.localer.service.HomeService;
import com.team4.localer.service.JoinUsService;
import com.team4.localer.service.SellerService;
import com.team4.localer.vo.DealShareVO;
import com.team4.localer.vo.GroupVO;
import com.team4.localer.vo.SellitemVO;

@Controller
public class HomeController {
	
	@Autowired
	HomeService service;
	@Autowired
	JoinUsService joinService;
	@Autowired
	DealShareService dealService;
	@Inject
	SellerService sellerService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		System.out.println("서비스 문제 해결 ^^ 행벅");
		ModelAndView mav = new ModelAndView();
		
		//동네직구 리스트
		DealShareVO dVO = new DealShareVO();
		List<DealShareVO> memList = dealService.dealListSelect(dVO);
		mav.addObject("memVO", memList);
		
		//착한발견 리스트
		SellitemVO sVO = new SellitemVO();
		List<SellitemVO> selList = sellerService.selectAllitem();
		mav.addObject("selVO", selList);
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="/sendGroupList", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<GroupVO> sendGroupList(HttpServletRequest req){
		String g_gu = req.getParameter("g_gu");
		
		List<GroupVO> list = new ArrayList<GroupVO>();
		list = service.getGroupList(g_gu);
		
		for(int listIdx=0; listIdx<list.size(); listIdx++) {
			int num = list.get(listIdx).getNum();
			int joinMem = joinService.getJCount(num);
			list.get(listIdx).setG_joinCnt(joinMem);
		}
		
		return list;
	}
	
	//레시피 리스트 불러오기
}
