package com.team4.localer;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.localer.service.HomeService;
import com.team4.localer.vo.GroupVO;

@Controller
public class HomeController {
	
	@Autowired
	HomeService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("서비스 문제 해결 ^^ 행벅");
		return "home";
	}
	@RequestMapping("/backHome")
	public String backHome() {
		return "home";
	}
	
	@RequestMapping(value="/sendGroupList", method = RequestMethod.GET, produces = "application/text;charset=UTF-8")
	@ResponseBody
	public List<GroupVO> sendGroupList(String g_gu){
		System.out.println("지역 결과 값? "+g_gu);
		//service.getGroupList(logLoc_gu);
		
		List<GroupVO> list = service.getGroupList(g_gu);
		System.out.println("sizzzzz "+list.size());
		return list;
	}
	
}
