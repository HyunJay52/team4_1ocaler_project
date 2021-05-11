package com.team4.localer;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.localer.service.HomeService;
import com.team4.localer.service.JoinUsService;
import com.team4.localer.vo.GroupVO;

@Controller
public class HomeController {
	
	@Autowired
	HomeService service;
	@Autowired
	JoinUsService joinService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("서비스 문제 해결 ^^ 행벅");
		return "home";
	}
//	@RequestMapping("/backHome")
//	public String backHome() {
//		return "home";
//	}
	
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
	
}
