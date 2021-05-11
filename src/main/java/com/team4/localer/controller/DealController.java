package com.team4.localer.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.DealShareService;
import com.team4.localer.vo.DealShareVO;

@Controller
public class DealController {
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Inject
	DealShareService dealshareService;
	
	//동네직구(회원)
	@RequestMapping("/memberBoard")
	public ModelAndView memberBoard(DealShareVO vo,HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
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
	//			DealShareVO vo2 =dealshareService.dealOneselect(vo);
	//			mav.addObject("vo",vo2);
	//			mav.addObject("num", vo2.getNum());
	//			mav.setViewName("redirect:memberView");
				mav.setViewName("redirect:memberWrite");
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
	public ModelAndView memberView() {
		ModelAndView mav= new ModelAndView();
		
		mav.setViewName("deal/memberView");
		return mav;
	}
	

	@RequestMapping("/memberEdit")
	public String memeberEdit() {
		return	"deal/memberEdit";
	}
	

	

	
	
}
