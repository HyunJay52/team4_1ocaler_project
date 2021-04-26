package com.team4.localer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.team4.localer.service.LikeItService;
import com.team4.localer.vo.LikeItVO;

@Controller
public class LikeItController {
	@Inject
	LikeItService likeItService;
	
	@RequestMapping("/likeInsert")
	@ResponseBody
	public String likeInsert(LikeItVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));	
		return likeItService.likeInsert(vo.getNumLike(),vo.getUserid())+"";
	}
	@RequestMapping("/likeDelete")
	@ResponseBody
	public String likeDelete(LikeItVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));	
		return likeItService.likeDelete(vo.getNumLike(), vo.getUserid())+"";
	}
	
	
	
	
	
}
