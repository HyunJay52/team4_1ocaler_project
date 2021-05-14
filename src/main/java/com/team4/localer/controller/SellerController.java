package com.team4.localer.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.SellerService;
import com.team4.localer.vo.Item_optionVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.SellitemVO;


@Controller
public class SellerController {
	
	@Inject
	SellerService sellerService;
	
	//착한발견 (셀러)
	@RequestMapping("/selBard")
	public String selBard() {
		return "deal/sellBoard";
	}
	
	
	@RequestMapping("/selWrite")
	public String selWrite() {
		return "deal/sellWrite";
	}
	
	@RequestMapping("/sellWriteOk")
	public ModelAndView selWriteOk(SellitemVO itemVO, Item_optionVO optionVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		//글내용 insert 할때 매개변수로 userid 를 넣어줘야 서브쿼리로 selnum을 가져와서 sell_item의 sel_num값에 들어간다. 
		
		//파일 저장할 경로 설정
		String path = req.getSession().getServletContext().getRealPath("/img/sellItemInsertPicture");
		
		//MultipartHttpServletRequest객체 생성
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req; //req에서 업로드를 못해서 타입캐스팅
		
	
		System.out.println(itemVO.getI_subject()+"제목");
		System.out.println(itemVO.getI_cnt()+"판매갯수");
		System.out.println(itemVO.getI_content()+"내용");
		System.out.println(itemVO.getI_img1()+"이미지");
		System.out.println(itemVO.getI_price()+"가격");
		System.out.println(itemVO.getI_period()+"기간");
		System.out.println(itemVO.getI_status()+"상태");
		System.out.println(itemVO.getI_tag()+"태그");
		System.out.println("============================");
		System.out.println(optionVO.getOption_title()+"옵션의 타이틀");
		System.out.println(optionVO.getOption_content()+"옵션의 내용");
		System.out.println(optionVO.getO_price()+"옵션의 가격");	
		return mav;
	}
	
	
	
	@RequestMapping("/sellView")
	public String selView() {
		return "deal/sellView";
	}
	
	
	@RequestMapping("/sellBuy")
	public String sellBuy() {
		return "deal/sellBuy";
	}
	
	@RequestMapping("/sellerInfo")
	public String sellerInfo() {
		return "deal/sellerInfo";
	}
	
	
}
