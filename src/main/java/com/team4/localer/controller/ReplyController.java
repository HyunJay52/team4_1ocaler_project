package com.team4.localer.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.team4.localer.service.ReplyService;
import com.team4.localer.vo.BoardVO;
import com.team4.localer.vo.ReplyVO;

@Controller
public class ReplyController {
	

	@Inject
	ReplyService replyservice;
	


	@RequestMapping("/replyList")
	@ResponseBody
	public List<ReplyVO> replyList(int num) {
		
		System.out.println("안나오냐"+num);
		
		return replyservice.replyList(num);
		
	}
	
	
	  @RequestMapping("/replyWriteOk")
	  @ResponseBody 
	  public String replyInsert(ReplyVO vo, HttpServletRequest req) {
		 
		  String result="";
		  
		  vo.setUserid((String)req.getSession().getAttribute("logId"));
		 
		  
		  int cnt = replyservice.replyInsert(vo);
		  
		  result = cnt+""; 
		  
		  return result; 
	  
	  }
	  
	  
	  
	@RequestMapping("/replyEdit")
	@ResponseBody
	public String replyEdit (HttpServletRequest req, ReplyVO vo) {
			
		vo.setUserid((String)req.getSession().getAttribute("logId"));
			
		int cnt = replyservice.replyUpdate(vo);
			
		return cnt+"";
	}
		
	@RequestMapping("/replyDel")
	@ResponseBody
	public String replyDel(ReplyVO vo, HttpServletRequest req) {
			
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		
		int cnt= replyservice.replyDel(vo);
			
		
		return cnt+"";
	}
	
}
