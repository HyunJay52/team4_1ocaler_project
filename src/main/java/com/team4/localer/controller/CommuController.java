package com.team4.localer.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.team4.localer.service.BoardService;
import com.team4.localer.vo.BoardVO;

@Controller
public class CommuController {
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("/commuMain")
	public ModelAndView commuMain(BoardVO vo , HttpServletRequest req) { //커뮤 메인으로 이동
		ModelAndView mav = new ModelAndView();
		  
		String[] all_Gu = { "강서구","양천구","영등포구","동작구","관악구","금천구","구로구","마포구","서대문구","은평구", 
 				 "종로구","용산구","중구","성동구","동대문구","성북구","강북구","도봉구","노원구","중랑구","광진구",
 				 "강동구","서초구","강남구","송파구"
				   };
		
		
		int cnt_result[] =new int[25];
		
		for (int i = 0 ; i <all_Gu.length;i++) {
			
			cnt_result[i]=boardService.commuGuSelect(all_Gu[i]);
			
			
			 
		}
		
		mav.addObject("result",cnt_result);
		System.out.println(cnt_result.length);
		mav.addObject("recipe",boardService.recipeSelect(vo));
		mav.addObject("free",boardService.freeSelect(vo));
		mav.addObject("commuBor",boardService.commuMainSelect(vo));
		
		mav.setViewName("community/commuMain");
		
		
		//return "community/commuMain";
		return mav;
	}
	
	//커뮤 게시판보기
	@RequestMapping("/commuBoard")
	public ModelAndView commuBoard(BoardVO vo , HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("commuList",boardService.commuSelect(vo));
		
	
		mav.addObject("vo",vo);
		
		mav.setViewName("community/commuBoard");
	//	return "community/commuBoard";
		return mav;
	}
	
	
	
	
	@RequestMapping("/commuWrite")
	public ModelAndView commuWrite(BoardVO vo) {
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("vo",vo);
		mav.setViewName("community/commuWrite");
				
		//return "community/commuWrite";
		return mav;
	}
	
	//레시피 게시판 보기
	@RequestMapping("/commuRecipeBoard")
	public ModelAndView commuRecipeBoard(BoardVO vo, HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
	
		
		mav.addObject("commuList",boardService.commuRecipeSelect(vo));
		
		mav.addObject("vo",vo);
		mav.setViewName("community/commuRecipeBoard");
		return mav;
		
	}
	
	//자유게시판 보기
	
	@RequestMapping("/commuFreeBoard")
	public ModelAndView commuFreeBoard(BoardVO vo, HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
		
		mav.addObject("commuList",boardService.commuFreeSelect(vo));
		
		mav.addObject("vo",vo);
		mav.setViewName("community/commuFreeBoard");
		return mav;
	}
	
	//커뮤 글쓰기...
	@RequestMapping(value="/commuWriteOk", method=RequestMethod.POST)
	public ModelAndView commuWriteOk(BoardVO vo , HttpServletRequest req) {
		ModelAndView mav= new ModelAndView();
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setB_gu((String)req.getSession().getAttribute("logLoc_gu"));
		
		
		System.out.println(vo.getUserid());
		System.out.println(vo.getB_gu());
		
		mav.addObject("vo",vo);
		if(boardService.commuInsert(vo)>0) {
			BoardVO vo2 = boardService.commuOneSelect(vo);
			mav.addObject("vo",vo2);
			mav.addObject("num", vo2.getNum());
			mav.setViewName("redirect:commuView");
		}else {
			mav.setViewName("redirect:boardWrite");
		}
		return mav;
	}
	
	//커뮤 글 보기
	@RequestMapping("/commuView")
	public ModelAndView commuView(BoardVO vo) {
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("vo",boardService.hitCount(vo.getNum()));
		
		mav.addObject("vo",boardService.commuViewSelect(vo.getNum()));
		
		mav.setViewName("community/commuView");
		return mav;
	}
	
	@RequestMapping("/commuEdit")
	public String commuEdit(int num,Model model) {
		
		model.addAttribute("vo",  boardService.commuViewSelect(num));
		return "community/commuEdit";
	}
	
	@RequestMapping(value="/commuEditOk", method=RequestMethod.POST )
	public ModelAndView commuEditOk(BoardVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		mav.addObject("num",vo.getNum());
		if(boardService.commuUpdate(vo)>0) {
			
			mav.setViewName("redirect:commuView");
		}else {
			mav.setViewName("redirect:commuEdit");
		}
		
		
		
		
		return mav;
		
	}

	
	//글삭제
	@RequestMapping("/commuDel")
	public ModelAndView commuDel(HttpServletRequest req,BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		

		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setNum(vo.getNum());
		vo.setB_gu((String)req.getSession().getAttribute("logLoc_gu"));
		
		System.out.println(vo.getUserid());
		System.out.println(vo.getNum());
		
		
		if(boardService.commuDelete(vo.getNum(),vo.getUserid())>0) {
			mav.addObject("logLoc_gu",vo.getLocgu());
			
			mav.setViewName("redirect:commuBoard");
		}else {
			mav.addObject("num", vo.getNum());
			mav.setViewName("redirect:commuView");
		}
		
		return mav;
	}
	
}
