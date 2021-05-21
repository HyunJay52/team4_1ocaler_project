package com.team4.localer.controller;


import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.team4.localer.service.BoardService;
import com.team4.localer.service.LikeItService;
import com.team4.localer.vo.BoardPageVO;
import com.team4.localer.vo.BoardVO;

@Controller
public class CommuController {
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Inject
	BoardService boardService;
	@Inject
	LikeItService likeItService;
	
	
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
		mav.addObject("like",boardService.likeCount(vo.getNum()));
		mav.setViewName("community/commuMain");
		
		
		//return "community/commuMain";
		return mav;
	}
	
	//커뮤 게시판보기
	@RequestMapping("/commuBoard")
	public ModelAndView commuBoard(BoardVO vo , HttpServletRequest req,BoardPageVO pageVO) {
		ModelAndView mav = new ModelAndView();
		
	//	mav.addObject("commuList",boardService.commuSelect(vo));
		mav.addObject("like",boardService.likeCount(vo.getNum()));
		
		pageVO.setUserid((String)req.getSession().getAttribute("logId"));
		
		pageVO.setPageNum(pageVO.getPageNum());
		pageVO.setSearchKey(pageVO.getSearchKey());
		pageVO.setSearchWord(pageVO.getSearchWord());
		pageVO.setB_gu(pageVO.getB_gu());
		
		pageVO.setTotalRecord(boardService.boardTotalRecoedCount(pageVO)); // pageVO 안에 totalPageRecordNum 대입함		
		System.out.println("오늘안에" + pageVO.getPageNum());
		
		mav.addObject("commuList",boardService.commuPageSelect(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("community/commuBoard");
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
	public ModelAndView commuRecipeBoard(BoardVO vo, HttpServletRequest req,BoardPageVO pageVO) {
		ModelAndView mav =new ModelAndView();
		mav.addObject("like",boardService.likeCount(vo.getNum()));

		pageVO.setPageNum(pageVO.getPageNum());
		pageVO.setSearchKey(pageVO.getSearchKey());
		pageVO.setSearchWord(pageVO.getSearchWord());
		pageVO.setUserid((String)req.getSession().getAttribute("logId"));
		
		pageVO.setTotalRecord(boardService.boardTotalRecoedCount(pageVO)); // pageVO 안에 totalPageRecordNum 대입함		
		
		mav.addObject("commuList",boardService.commuPageSelect(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("community/commuRecipeBoard");
		return mav;
		
	}
	
	//자유게시판 보기
	
	@RequestMapping("/commuFreeBoard")
	public ModelAndView commuFreeBoard(BoardVO vo, HttpServletRequest req,BoardPageVO pageVO) {
		ModelAndView mav =new ModelAndView();
		
		mav.addObject("like",boardService.likeCount(vo.getNum()));

		pageVO.setPageNum(pageVO.getPageNum());
		pageVO.setSearchKey(pageVO.getSearchKey());
		pageVO.setUserid((String)req.getSession().getAttribute("logId"));
		pageVO.setSearchWord(pageVO.getSearchWord());
		
		pageVO.setTotalRecord(boardService.boardTotalRecoedCount(pageVO)); // pageVO 안에 totalPageRecordNum 대입함		
		
		mav.addObject("commuList",boardService.commuPageSelect(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("community/commuFreeBoard");
		return mav;
	}
	
	//커뮤 글쓰기...
	@RequestMapping(value="/commuWriteOk", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class}) 
	public ModelAndView commuWriteOk(BoardVO vo , HttpServletRequest req) {
		ModelAndView mav= new ModelAndView();   
		//일단 파일업로드

		String imgPath = req.getSession().getServletContext().getRealPath("/img/recipeImg");
		
		//첨부파일
		MultipartHttpServletRequest deal_img = (MultipartHttpServletRequest)req; // 형변환을 해주고
		MultipartFile deal_File= deal_img.getFile("b_img"); // 위에서 해줬기 떄문에 할 필요는없음..-> 업로드파일 넣음
		
		String uploadImgName = "";
		
		if(deal_File != null) {
			String originName = deal_File.getOriginalFilename();
			if(!originName.equals("")) {
				File uploadFile=new File(imgPath,originName);
				//중복파일
				int idx = 1;
				while(uploadFile.exists()) {
					int lastDot = originName.lastIndexOf(".");
					String prof_name = originName.substring(0, lastDot);
					String prof_exe = originName.substring(lastDot+1);
					//중복파일 이름 수정 
					uploadFile = new File(imgPath, prof_name+"_"+idx++ +"."+prof_exe);
				}
				//파일업로드실행
				try {
					deal_File.transferTo(uploadFile);
				}catch(Exception e ) {
					System.out.println("사진 업로드 에러에러에러!!!!!!");
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				//변경된파일명
				uploadImgName = uploadFile.getName();
			}
		}
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setB_gu((String)req.getSession().getAttribute("logLoc_gu"));
		vo.setB_img1(uploadImgName);
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		System.out.println(vo.getUserid());
		System.out.println(vo.getB_gu());
		System.out.println("이미지가있나없나"+vo.getB_img1());
		
		mav.addObject("vo",vo);
		
		try {
			if(boardService.commuInsert(vo)>0) {
				
				//성공하면 
				transactionManager.commit(status);
				
				BoardVO vo2 = boardService.commuOneSelect(vo);
				
				mav.addObject("vo",boardService.memwriteCount(vo.getUserid()));
				mav.addObject("vo",vo2);
				mav.addObject("num", vo2.getNum());
				mav.setViewName("redirect:commuView");
			}else {
				mav.setViewName("redirect:boardWrite");
			}
			
		}catch(Exception e){
			System.out.println("게시물쓰기 실패");
			System.out.println(e.getMessage());
			e.printStackTrace();
			mav.setViewName("redirect:boardWrite");
		}
		return mav;
	}
	
	//커뮤 글 보기
	@RequestMapping("/commuView")
	public ModelAndView commuView(BoardVO vo,HttpSession session,BoardPageVO pageVO) {
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("vo",boardService.hitCount(vo.getNum()));
		
		mav.addObject("vo",boardService.commuViewSelect(vo.getNum()));

			
//		뭐뭐넣어야해?
		pageVO.setNum(vo.getNum());
		pageVO.setUp_cate(vo.getUp_cate());
		vo.setUp_cate(vo.getUp_cate());
		System.out.println("vo. up_cate?? >"+vo.getUp_cate());
		
		mav.addObject("voSel", boardService.lagLeadSelect(pageVO));
		System.out.println("vo.getnum = >" + pageVO.getNum() );
		System.out.println("page.getcate = >" + pageVO.getUp_cate() );
		
		
		mav.addObject("like",boardService.likeCount(vo.getNum()));
		
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			mav.addObject("likeList",likeItService.LikeItSelectAll((String)session.getAttribute("logId")));
		}	
		mav.setViewName("community/commuView");
		return mav;
	}
	
	@RequestMapping("/commuEdit")
	public ModelAndView commuEdit(int num,Model model) {
		ModelAndView mav= new ModelAndView();
		
		model.addAttribute("vo",  boardService.commuViewSelect(num));
		mav.setViewName("community/commuEdit");
		return mav;
	}
	
	@RequestMapping(value="/commuEditOk", method=RequestMethod.POST )
	public ModelAndView commuEditOk(BoardVO vo, HttpServletRequest req,HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		

		//// 사진 수정
		
		// 기존 사진 파일
		String path =ses.getServletContext().getRealPath("/img/recipeImg");
		String dealSellPic =req.getParameter("sellImg");
		
		//새로업로드할 파일
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile updateImg =mr.getFile("b_img");
		
		String editDealFile="";
		
		
		try {
		if(updateImg!=null) {
			String orgName = updateImg.getOriginalFilename(); //원파일저장
			if(orgName!=null &&!orgName.equals("")) {
				File upImg = new File(path,orgName);
				int idx = 0 ;
				while(upImg.exists()) {
					int dot = orgName.lastIndexOf(".");
					String fileName = orgName.substring(0,dot);
					String exeName = orgName.substring(dot+1);
					
					upImg =new File(path,fileName+"_"+idx++ + "."+exeName);
				//파일삭제
					if(dealSellPic!=null){
						File delF = new File(path,dealSellPic);
						delF.delete();
					}	
					
				}
				updateImg.transferTo(upImg); //파일업로드 
				editDealFile = upImg.getName(); // 업로드한 파일이름 담기
			}
		}
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setB_img1(editDealFile);
		
		mav.addObject("num",vo.getNum());
		
		
		if(boardService.commuUpdate(vo)>0) {
			System.out.println("성공");
			mav.setViewName("redirect:commuView");
		}else {
			System.out.println("실패");
			mav.setViewName("redirect:commuEdit");
		}
		
		}catch(Exception e ) {
			System.out.println("사진 수정 업로드 하지마 하지말라고!!!!!!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
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
		vo.setUp_cate(vo.getUp_cate());
		
		System.out.println("아아디 = >"+vo.getUserid());
		System.out.println("글번호 = > "+vo.getNum());
		System.out.println("카테고리 = >"+ vo.getUp_cate());
		System.out.println("지역? = > "+vo.getB_gu());
		System.out.println("넘버? = > " + vo.getNum());
		
		if(boardService.commuDelete(vo.getNum(),vo.getUserid())>0) {
			
			mav.addObject("vo",boardService.memdeleteCount(vo.getUserid()));
				if(vo.getUp_cate()==1) {
					mav.addObject("num",vo.getNum());
					mav.addObject("logLoc_gu",vo.getB_gu());
					mav.addObject("b_gu",vo.getB_gu());
					mav.addObject("up_cate",vo.getUp_cate());
					System.out.println("글삭제 성공하고난다음에 1일떄 구랑 카테  - > "+ vo.getB_gu()+"//"+vo.getUp_cate());
					mav.setViewName("redirect:commuBoard");
					System.out.println("보드로 넘어갈꺼야?");
					
				}
				if(vo.getUp_cate()==2) {
					mav.addObject("num",vo.getNum());
					mav.addObject("up_cate",vo.getUp_cate());
					System.out.println("글삭제 성공하고난다음에 2일떄 카테 - > "+ vo.getUp_cate());
					mav.setViewName("redirect:commuRecipeBoard");
					System.out.println("보드로 넘어갈꺼야?");
					
					
				}
				if(vo.getUp_cate()==3) {
					mav.addObject("num",vo.getNum());
					mav.addObject("up_cate",vo.getUp_cate());
					System.out.println("글삭제 성공하고난다음에 3일떄 카테  - > "+ vo.getUp_cate());
					mav.setViewName("redirect:commuFreeBoard");
					System.out.println("보드로 넘어갈꺼야?");
					
				}
			
			
		}else {
			mav.addObject("num", vo.getNum());
			mav.setViewName("redirect:commuView");
		}
		
		return mav;
	}
	
}
