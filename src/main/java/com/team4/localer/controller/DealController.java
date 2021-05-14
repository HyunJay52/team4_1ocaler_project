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

import com.team4.localer.service.DealShareService;
import com.team4.localer.service.JoinUsService;
import com.team4.localer.service.MemberService;
import com.team4.localer.vo.DealShareVO;
import com.team4.localer.vo.MemberVO;

@Controller
public class DealController {
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Inject
	DealShareService dealshareService;
	@Inject
	JoinUsService joinUsService;
	
	//동네직구(회원)
	@RequestMapping("/memberBoard")
	public ModelAndView memberBoard(DealShareVO vo,HttpServletRequest req,MemberVO memVo) {
		
		ModelAndView mav = new ModelAndView();
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		
		mav.addObject("dealSellList",dealshareService.dealListSelect(vo));
		
		mav.addObject("vo",vo);
		mav.setViewName("deal/memberBoard");
		return mav;
	}
	

	
	@RequestMapping("/memberWrite")
	public ModelAndView memberWrite(DealShareVO vo,HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
		
		mav.setViewName("deal/memberWrite");
		
		 return mav;
	}
	
	
	//글쓰기
	@RequestMapping(value = "/memWriteOk" , method = RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class}) 
	public ModelAndView memWriteOk (DealShareVO vo,HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
		
		//일단 파일업로드
		String imgPath = req.getSession().getServletContext().getRealPath("/img/dealFileImg");
		
		//첨부파일
		MultipartHttpServletRequest deal_img = (MultipartHttpServletRequest)req; // 형변환을 해주고
		MultipartFile deal_File= deal_img.getFile("s_img"); // 위에서 해줬기 떄문에 할 필요는없음..-> 업로드파일 넣음
		
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
		vo.setS_gu((String)req.getSession().getAttribute("logLoc_gu"));
		vo.setS_img1(uploadImgName);
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		mav.addObject("vo",vo);
		
		try {
			if(dealshareService.dealInsert(vo)>0) {
				
				//성공하면 
				transactionManager.commit(status);

				System.out.println("성공했다");
				//글쓰고 쓴글로가는거
				DealShareVO vo2 =dealshareService.dealOneselect(vo);
				mav.addObject("vo",vo2);
				mav.addObject("num", vo2.getNum());
				mav.setViewName("redirect:memberView");
			//	mav.setViewName("redirect:memberWrite");
			}else {// 실패했을때
				System.out.println("실패했다");
				mav.setViewName("redirect:memberWrite");
				
			}
		
		}catch(Exception e){
			System.out.println("게시물쓰기 실패");
			System.out.println(e.getMessage());
			e.printStackTrace();
			mav.setViewName("redirect:memberWrite");
		}
		
		mav.addObject("vo",vo);
		
		
		
		return mav;
	}
	
	@RequestMapping("/memberView")
	public ModelAndView memberView(DealShareVO vo,HttpSession session) {
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("vo",dealshareService.dealViewSelect(vo.getNum()));
		
		mav.addObject("appNum",joinUsService.getJCount(vo.getNum()));
		
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			mav.addObject("joinList",joinUsService.joinSelect((String)session.getAttribute("logId")));
		}
		
		System.out.println(vo.getNum());
		
		
		mav.setViewName("deal/memberView");
		return mav;
	}
	
	//글수정페이지이동
	@RequestMapping("/memberEdit")
	public ModelAndView memeberEdit(int num,Model model) {
		ModelAndView mav =new ModelAndView();
		
		model.addAttribute("vo",dealshareService.dealViewSelectNumX(num));
		
		mav.setViewName("deal/memberEdit");
		return	mav;
	}
	
	//글수정페이지
	@RequestMapping(value="dealEditOk" , method=RequestMethod.POST)
	public ModelAndView dealEditOk(DealShareVO vo,HttpServletRequest req,HttpSession ses) {
		ModelAndView mav= new ModelAndView();
		
		//// 사진 수정
		
		// 기존 사진 파일
		String path =ses.getServletContext().getRealPath("/img/dealFileImg");
		String dealSellPic =req.getParameter("sellImg");
		
		//새로업로드할 파일
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile updateImg =mr.getFile("s_img");
		
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
			vo.setS_img1(editDealFile);
			
			
			mav.addObject("num",vo.getNum());
			
			System.out.println(vo.getNum());
			System.out.println(vo.getUserid());
			System.out.println(vo.getS_img1());
			
			if(dealshareService.dealUpdate(vo)>0) {
				System.out.println("성공");
				
				mav.setViewName("redirect:memberBoard");
			}else {
				System.out.println("실패");
				mav.setViewName("redirect:memberEdit");
			}
			
		}catch(Exception e) {
			System.out.println("사진 수정 업로드 에러에러에러!!!!!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	
		
		
				
		
		return mav;
	}
	

	//글삭제
	@RequestMapping("/dealDel")
	public ModelAndView dealDel(HttpServletRequest req,DealShareVO vo) {
		ModelAndView mav = new ModelAndView();
		
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setNum(vo.getNum());
		
		if(dealshareService.dealSellDelete(vo.getNum(),vo.getUserid())>0) { //성공했을떄
			System.out.println("성공");
			mav.setViewName("redirect:memberBoard");
		}else { // 시래했을떄
			System.out.println("실패");
			mav.addObject("num", vo.getNum());
			mav.setViewName("redirect:memberView");
		}
		
		
		return mav;
	}
	

	
	
}
