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
		System.out.println("cnt"+cnt);
		System.out.println("아이디"+ vo.getUserid());
		System.out.println("s내용..? -> " +vo.getRep_content());
		System.out.println("댓글번호번호- >" +vo.getRep_num());
		
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
