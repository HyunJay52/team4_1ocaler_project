package com.team4.localer.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.MemberService;
import com.team4.localer.service.SellerService;
import com.team4.localer.service.ShipService;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.Item_optionVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.OrderVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.SellitemVO;
import com.team4.localer.vo.ShipVO;
import com.team4.localer.vo.Sp_pVO;


@Controller
public class SellerController {
	
	@Inject
	SellerService sellerService;
	@Inject
	private DataSourceTransactionManager transactionManager;
	@Inject
	MemberService memberService;
	@Inject
	ShipService shipService;
	
	//착한발견 (셀러)
	@RequestMapping("/selBard")
	public ModelAndView selBard() {
		ModelAndView mav = new ModelAndView();
		System.out.println(sellerService.selectAllitem().size()+"<---- size 몇개니");
		mav.addObject("itemList",sellerService.selectAllitem());
		mav.setViewName("deal/sellBoard");
		return mav;
	}
	
	
	@RequestMapping("/selWrite")
	public String selWrite() {
		return "deal/sellWrite";
	}
	
	@RequestMapping(value="/sellWriteOk", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView selWriteOk(SellitemVO itemVO, Item_optionVO optionVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		//글내용 insert 할때 매개변수로 userid 를 넣어줘야 서브쿼리로 selnum을 가져와서 sell_item의 sel_num값에 들어간다. 
		
		//파일 저장할 경로 설정
		String path = req.getSession().getServletContext().getRealPath("/img/sellItemInsertPicture");
		
		//MultipartHttpServletRequest객체 생성
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req; //req에서 업로드를 못해서 타입캐스팅
	
		List<MultipartFile> files = mr.getFiles("i_imgName");
		List<String> uploadFilename = new ArrayList<String>();
		System.out.println(files.size());
		if(files.size()>0) { //첨부파일이있을때
			for(MultipartFile mf : files) { //첨부파일수만큼 반복
				String orgFilename = mf.getOriginalFilename();//원파일명
				if(!orgFilename.equals("")) {
					File f = new File(path, orgFilename);
					int i = 1;
					while(f.exists()) {
						int point = orgFilename.lastIndexOf(".");//.위치
						String name= orgFilename.substring(0,point);//파일명
						String extName = orgFilename.substring(point+1);//확장자
						
						f = new File(path, name+"_"+i++ +"."+extName);
					}///while종료
					
					//업로드
					try {
						mf.transferTo(f);
					}catch(Exception e) {
						System.out.println("업로드실패"+e.getMessage());
						e.printStackTrace();
					}
					//변경된 파일명
					uploadFilename.add(f.getName());
				}//if end
			}//for end
			
		}//if end filesize
		
		System.out.println((String)req.getSession().getAttribute("logLoc_gu")+"gogogogo");
		//DB작업
		itemVO.setUserid((String)req.getSession().getAttribute("logId"));
		//파일 나누기까지끝
		itemVO.setI_img1(uploadFilename.get(0));
		if(uploadFilename.size()==2) {
			itemVO.setI_img2(uploadFilename.get(1));
		}else if(uploadFilename.size()==3) {
			itemVO.setI_img2(uploadFilename.get(1));
			itemVO.setI_img3(uploadFilename.get(2));
		}
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜잭션호출
		TransactionStatus status  = transactionManager.getTransaction(def);
	
		try {		  
			//셀러 게시글 인썰트 
			int result = sellerService.sellerInsert(itemVO); 
			if(result>0) {
				System.out.println(result+"쿼리문의 실행결과를나타내라!"); 
				for(int i=0; i<optionVO.getOption_titles().length; i++) {
					int resul = sellerService.itemOptionInsert((String)req.getSession().getAttribute("logId"), optionVO.getOption_titles()[i], optionVO.getOption_contents()[i], optionVO.getO_prices()[i]);
					if(resul>0) {
						System.out.println("옵션 등록에 성공했습니다.");
						mav.setViewName("redirect:selBard");
					}else { 
						System.out.println("실패했네"+resul); 
					}
				} 
			}else {
				mav.setViewName("redirect:selWrite"); 
			}
			transactionManager.commit(status);
		}catch(Exception e) {			  
			System.out.println(e.getMessage()+"에러가 요기있습니다.");
			e.printStackTrace();
			mav.setViewName("group/historyBack");
		}
		 

		System.out.println(uploadFilename.size()+"파일올린것만큼의 갯수를 잘구하나요?");		
		System.out.println("============================");
		System.out.println(itemVO.getI_subject()+"제목");
		System.out.println(itemVO.getI_cnt()+"판매갯수");
		System.out.println(itemVO.getI_content()+"내용");
		System.out.println(itemVO.getI_img1()+"이미지1");
		System.out.println(itemVO.getI_img2()+"이미지2");
		System.out.println(itemVO.getI_img3()+"이미지3");
		System.out.println(itemVO.getI_price()+"가격");
		System.out.println(itemVO.getI_period()+"기간");
		System.out.println(itemVO.getI_status()+"상태");
		System.out.println(itemVO.getI_tag()+"태그");
		System.out.println(itemVO.getI_ship()+"배송비");
		System.out.println("============================");
		System.out.println(optionVO.getOption_title()+"옵션의 타이틀");
		System.out.println(optionVO.getOption_titles().length);
		System.out.println(optionVO.getOption_content()+"옵션의 내용");	
		System.out.println(optionVO.getOption_contents().length);
		System.out.println(optionVO.getO_price());
		return mav;
	}

	@RequestMapping("/sellView")
	public ModelAndView selView(SellitemVO itemVO, Item_optionVO optionVO) {
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("itemVO",sellerService.selectOnePage(itemVO.getI_num()));	
		mav.addObject("NOTitle",sellerService.notOverlapOptionTitleSel(itemVO.getI_num())); //옵션대가리
		mav.setViewName("deal/sellView");
		return mav;
	}
	
	@RequestMapping("/changeOptions")
	@ResponseBody
	public List<Item_optionVO> changeOption(Item_optionVO optionVO){
		System.out.println(optionVO.getI_num()+"넘버");
		System.out.println(optionVO.getOption_title()+"타이틀값");
		return sellerService.changeOptions(optionVO.getOption_title(), optionVO.getI_num());
	}
	
	@RequestMapping("/sellBuy")
	public ModelAndView sellBuy(OrderVO orderVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		orderVO.setUserid((String)session.getAttribute("logId"));
		
		System.out.println(orderVO.getUserid()+"<--구매자의 userid");
		System.out.println(orderVO.getO_price()+"<--총가격");
		System.out.println(orderVO.getO_ship()+"<--배송비");
		System.out.println(orderVO.getO_cnt()+"<--수량");
		System.out.println(orderVO.getNum()+"<--현재 게시글번호");
		System.out.println(orderVO.getOpt_str()+"<--옵션내용들");
		System.out.println(orderVO.getI_subject()+"<--게시글제목");
		System.out.println(orderVO.getI_userid()+"<--판매자의 userid");
		System.out.println(orderVO.getI_price()+"<--원래상품 1개 판매가격");
		System.out.println(orderVO.getI_img1()+"<--상품 이미지1");
		mav.addObject("orderVO",orderVO);
		mav.setViewName("deal/sellBuy");
		return mav;
	}
	
	
	@RequestMapping(value="/orderShipCashInsert", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView orderShipInsert(OrderVO orderVO, Cha_pVO chaVO, Sp_pVO spVO, ShipVO shipVO) {
		ModelAndView mav = new ModelAndView();
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜잭션호출
		TransactionStatus status  = transactionManager.getTransaction(def);
		
		try {
			int result = sellerService.sellerOrderInsert(orderVO);
			//배송테이블 값셋팅
			shipVO.setBuyer(orderVO.getUserid()); //상품을 구매한사람
			shipVO.setShip_cnt(orderVO.getO_cnt()); //cnt 셋팅
			
			System.out.println(result+"<----1이면성공 아니면 실패");	
			if(result>0) {
				int resl = shipService.shipInsert(shipVO);
				mav.addObject("o_num",orderVO.getNum());
				mav.setViewName("redirect:ShowCompl");
				System.out.println(resl+"<---이것도 1이 나와야 성공임");
			}
			if(orderVO.getO_mtd()==2) {
				//-> 포인트 이동이 있어야 한다.
				//판매자의 cha_p 에다가 o_price 만큼 insert
				int cha_result = sellerService.cha_pointInsert(shipVO.getSender(), orderVO.getO_price(), 3);
				System.out.println(cha_result +"<--1나오면 cha_point 인설트 성공");
				//구매자의 sp_p 에다가 o_price 만큼 insert
				int sp_result = sellerService.sp_pointInsert(orderVO.getUserid(), orderVO.getO_price(), orderVO.getNum());
				System.out.println(sp_result+"<-- 1나오면 sp_point 인설트 성공");
			}
			transactionManager.commit(status);
		}catch(Exception e) {			  
			System.out.println(e.getMessage()+"에러가 요기있습니다.");
			e.printStackTrace();
			mav.setViewName("group/historyBack");
		}
		return mav;
	}
	
	
	
	
	@RequestMapping("/sellerInfo")
	public ModelAndView sellerInfo(String userid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("sellerVO",sellerService.sellerInfo(userid));
		mav.addObject("list",sellerService.sellerItems(userid));
		mav.setViewName("deal/sellerInfo");
		return mav;
	}
	
	
	@RequestMapping("/ShowCompl")
	public ModelAndView ShowCompl(int o_num) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("deal/showCompl");
		return mav;
	}
	
	
	
	
	
	
	
	@RequestMapping("/userDetailFind")
	@ResponseBody
	public MemberVO userDetailFind(String userid) {
		System.out.println(userid+"<--아작스에서 보낸 아이디값");
		return memberService.userDetailFind(userid);
	}
	
	@RequestMapping("/findChaSpPoint")
	@ResponseBody
	public Cha_pVO findChaSpPoint(String userid) {
		return sellerService.findChaSpPoint(userid);
	}
	
	
	
	
	
	
}
