package com.team4.localer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.CsService;
import com.team4.localer.vo.CsVO;
import com.team4.localer.vo.OftenqVO;
import com.team4.localer.vo.ReportVO;

@Controller
public class csBoardController {
	
	@Inject
	CsService service;
	
	@RequestMapping("/oftenQna")
	public ModelAndView oftenQna() {
		ModelAndView mav = new ModelAndView();
		
		List<OftenqVO> list = service.selectAlloftenQ();
		
		mav.addObject("ofq", list);
		
		mav.setViewName("csBoard/oftenQna");
		
		return mav;
	}
	
	@RequestMapping(value="csBoard/oftenqnacnt", method=RequestMethod.GET)
	@ResponseBody
	public String oftenqnaCnt(int of_num) {
		String reStr;
		if(service.oftenqnaCnt(of_num)>0) {
			reStr = "1";
		}else{
			reStr = "0";
		}
		return reStr;
	}
	
	@RequestMapping(value="csBoard/searchofteqna", method=RequestMethod.GET)
	@ResponseBody
	public List<OftenqVO> searchofteqna(String key, String word){
		String setKey = "'["+key+"]'";
		String setWord = "%"+word+"%";
		
		List<CsVO> csList = service.searchOftenq(setKey, setWord);
		List<OftenqVO> list = new ArrayList<OftenqVO>();
		
		OftenqVO vo = new OftenqVO();
		
		if(csList.size()>0) {
			for(int i=0; i<csList.size(); i++) {
				vo.setOf_num(csList.get(i).getCs_num());
				vo.setOf_subject(csList.get(i).getCs_subject());
				vo.setOf_content(csList.get(i).getCs_content());
				vo.setOf_cate(csList.get(i).getCs_cate());
				list.add(vo);
			}
		}
		System.out.println("cslist > "+csList.size()+", list  > "+list.size());
		return list;
	}
	
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "csBoard/qnaWrite";
	}
	//cs_qnaOk
	@RequestMapping("/cs_qnaOk")
	public String cs_qnaOk(HttpSession ses, CsVO vo) {
		String returnView = "";

		String userid = (String)ses.getAttribute("logId");
		vo.setUserid(userid);
		
		if(service.csQnaInsert(vo)>0) {
			returnView = "csBoard/qnaWrite";
		}else {
			returnView = "member/historyBack";
		}
		
		return returnView;
	}
	
	@RequestMapping("/reportWrite")
	public String reportWrite(int num, Model model, HttpServletRequest req) {
		String returnView = "";
		
		if(num>0) {
			model.addAttribute("num", num);
			returnView = "csBoard/reportWrite";
		}else {
			returnView = "member/historyBack";
		}
		return returnView;
	}
	
	@RequestMapping("/cs_repOk")
	public String cs_repOk(ReportVO vo, HttpSession ses) {
		String returnView = "";
		
		vo.setUserid((String)ses.getAttribute("logId"));
		
		int result = service.reportInsert(vo);
		
		if(result>0) {
			returnView = "csBoard/reportWrite";
		}else {
			returnView = "member/historyBack";
		}
		return returnView;
	}
	
}
