package com.team4.localer.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.team4.localer.service.JoinUsService;

import com.team4.localer.dao.SellerDAO;

import com.team4.localer.service.LikeItService;
import com.team4.localer.service.MemberService;
import com.team4.localer.service.MyInfoService;
import com.team4.localer.service.SellerService;
import com.team4.localer.service.ShipService;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.DealPageVO;
import com.team4.localer.vo.ItemReviewPageVO;
import com.team4.localer.vo.ItemReviewVO;
import com.team4.localer.vo.Item_optionVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.OrderVO;
import com.team4.localer.vo.QnAVO;
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
	@Inject
	JoinUsService joinUsService;
	@Inject
	LikeItService likeItService;
	
	//착한발견 (셀러) -- 희연 수정

	@Inject
	MyInfoService myinfoService;
	//착한발견 (셀러)

	
	@RequestMapping("/selBard")
	public ModelAndView selBard(DealPageVO pageVO, HttpSession session ) {
		ModelAndView mav = new ModelAndView();
		
		pageVO.setPageNum(pageVO.getPageNum());
		pageVO.setSearchKey(pageVO.getSearchKey());
		pageVO.setSearchWord(pageVO.getSearchWord());
		
		
		pageVO.setTotalRecord(sellerService.sellTotalRecoedCount(pageVO)); // pageVO 안에 totalPageRecordNum 대입함
		mav.addObject("appNum", joinUsService.getJCount(pageVO.getNum())); // 좋아요.
		mav.addObject("itemList",sellerService.sellPageSelect(pageVO)); // 딜리스트..
		
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			mav.addObject("likeList",likeItService.LikeItSelectAll((String)session.getAttribute("logId")));
		}
		mav.addObject("pageVO",pageVO);
		
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
		 
		return mav;
	}

	@RequestMapping("/sellView")
	public ModelAndView selView(SellitemVO itemVO, Item_optionVO optionVO, ItemReviewPageVO reviewPageVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
	
		
		sellerService.sellViewCount(itemVO.getI_num()); // 조회수카운트
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			mav.addObject("likeList",likeItService.LikeItSelectAll((String)session.getAttribute("logId")));
		}
	
		reviewPageVO.setTotalRecord(myinfoService.totalReviewCnt(itemVO.getI_num())); //리뷰총갯수		
	

		mav.addObject("reviewList",myinfoService.selectSellItemReview(reviewPageVO));
		mav.addObject("reviewAll",myinfoService.selectAllReDate(itemVO.getI_num()));
		mav.addObject("pageVO",reviewPageVO);
		
		System.out.println(myinfoService.selectSellItemReview(reviewPageVO).size()+"<--사이즈는???????");
		System.out.println(myinfoService.selectAllReDate(itemVO.getI_num()).size()+"<--1개나오면맞을듯");
		mav.addObject("itemVO",sellerService.selectOnePage(itemVO.getI_num()));	
		mav.addObject("NOTitle",sellerService.notOverlapOptionTitleSel(itemVO.getI_num())); //옵션대가리
		
		
		
		mav.setViewName("deal/sellView");
		return mav;
	}
	
	@RequestMapping("/modifySellView")
	public ModelAndView modifySellView(int i_num) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(i_num+"<--ㅁ ㅝ나오긴하니");
		//1개 게시글 내용 불러오기 
		mav.addObject("modifyVO",sellerService.selectOnePage(i_num));
		
		//해당 게시글번호에 해당하는 옵션 다 불러오기
		mav.addObject("optionList",sellerService.optionSelectAll(i_num));
		
		
		mav.setViewName("deal/modifySellView");
		return mav;	
	}
	
	@RequestMapping(value="/sellModifyOk", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView sellModifyOk(SellitemVO itemVO, Item_optionVO optionVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		String path = req.getSession().getServletContext().getRealPath("/img/sellItemInsertPicture");
		
		SellitemVO fileItemVO =	sellerService.getFiles(itemVO.getI_num());
		List<String> selFile = new ArrayList<String>();
		
		selFile.add(fileItemVO.getI_img1());
		if(fileItemVO.getI_img2()!=null && !fileItemVO.getI_img2().equals("")) {
			selFile.add(fileItemVO.getI_img2());
		}
		if(fileItemVO.getI_img3()!=null && !fileItemVO.getI_img3().equals("")) {
			selFile.add(fileItemVO.getI_img3());
		}
		
		String delFile[] = req.getParameterValues("delFile");
		/* System.out.println(delFile.length+"<--길이"); */
			
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> list =  mr.getFiles("i_imgName");
		
		List<String> newUpload = new ArrayList<String>();
		if(newUpload!= null && list.size()>0) { //새로 업로드 된 파일이 있는경우
			for(MultipartFile mf : list) {
				if(mf!=null) {
					String orgname = mf.getOriginalFilename();
					if(orgname!=null && !orgname.equals("")) {
						File ff = new File(path, orgname);
						int i = 0;
						while(ff.exists()) {
							int pnt = orgname.indexOf(".");
							String firstName = orgname.substring(0,pnt);
							String extName = orgname.substring(pnt+1);
							
							ff = new File(path, firstName+"_"+i++ +"."+extName);
						} //while end///
						
						try {
							mf.transferTo(ff);
						}catch(Exception e) {
							System.out.println("업로드~~에러발생"+e.getMessage());
							e.printStackTrace();
						}
						newUpload.add(ff.getName());
					}
				}//if end (mf)
			}//for end
		}//if end newupload
		
		//DB선택 파일 목록에서 삭제한 파일명 지우기
		if(delFile!=null) {
			for(String delName : delFile) {
				selFile.remove(delName);
			}
		}
		
		//DB선택파일목록에 새로 업로드된 파일명 추가
		for(String newFile:newUpload) {
			selFile.add(newFile);
		}
		
		itemVO.setI_img1(selFile.get(0));
		if(selFile.size()==2) {
			itemVO.setI_img2(selFile.get(1));
		}else if(selFile.size()==3) {
			itemVO.setI_img2(selFile.get(1));
			itemVO.setI_img3(selFile.get(2));
		}
		
		itemVO.setUserid((String)req.getSession().getAttribute("logId"));
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜잭션호출
		TransactionStatus status  = transactionManager.getTransaction(def);
		
		
		try {
			int result = sellerService.sellViewUpdate(itemVO);
			System.out.println(result+"<--결과가 어떻게나옴?result값");
			mav.addObject("i_num",itemVO.getI_num());
			if(result>0){//수정 성공			
				//삭제파일 지우기
				if(delFile!=null) {
					for(String dFile : delFile) {
						try {
							File dFileObj = new File(path, dFile);
							dFileObj.delete();
						}catch(Exception e) {
							System.out.println(e.getMessage()+"......");
							e.printStackTrace();
						}
					}
				}
				sellerService.optionDelete(itemVO.getI_num());	
				for(int i=0; i<optionVO.getOption_titles().length; i++) {
					sellerService.repeatOptionIsert(itemVO.getI_num(), optionVO.getOption_titles()[i], optionVO.getOption_contents()[i], optionVO.getO_prices()[i]);	
					System.out.println("옵션 다시 인설트 성공");
				} 
				mav.setViewName("redirect:sellView");
			}else {
				System.out.println("수정 실패");	
				if(newUpload.size()>0) {
					for(String newFile : newUpload) {
						try {
							File dFileObj = new File(path, newFile);
							dFileObj.delete();
						}catch(Exception e) {
							System.out.println(e.getMessage()+"에러발생..");
							e.printStackTrace();
						}
					}
				}
				mav.setViewName("redirect:modifySellView");
			}
			transactionManager.commit(status);
		}catch(Exception e) {
			System.out.println(e.getMessage()+"에러가 요기있습니다.");
			e.printStackTrace();
			mav.setViewName("group/historyBack");
		}
		return mav;
	}
	
	@RequestMapping("/deleteSellView")
	public ModelAndView deleteSellView(int i_num, String userid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(userid+"<--뭔데");
		System.out.println((String)session.getAttribute("logId")+"<--이건또");
		if(userid.equals((String)session.getAttribute("logId"))) {
			int result = sellerService.deleteSellView(i_num);
			if(result>0) {
				System.out.println("삭제 성공");
				mav.setViewName("redirect:selBard");
			}else {
				System.out.println("삭제 실패");
				mav.addObject("itemVO",i_num);
				mav.setViewName("redirect:sellView");
			}		
		}else {
			System.out.println("해당 게시글의 작성자가 아닙니다");
		}
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
		
		
		mav.addObject("memberVO",memberService.userDetailFind(orderVO.getUserid()));
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
				mav.addObject("o_num",sellerService.recentlyOrderNum(orderVO.getUserid())); //num이아니라 o_num을 보내줘야하네 o_num을 선탣ㄱ해야해
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
	
	
	@RequestMapping("/sendShowCompl")
	@ResponseBody
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public int sendShowCompl(OrderVO orderVO, Cha_pVO chaVO, Sp_pVO spVO, ShipVO shipVO) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜잭션호출
		TransactionStatus status  = transactionManager.getTransaction(def);
		
		int o_num = 0;
		try {
			int result = sellerService.sellerOrderInsert(orderVO);
			//배송테이블 값셋팅
			shipVO.setBuyer(orderVO.getUserid()); //상품을 구매한사람
			shipVO.setShip_cnt(orderVO.getO_cnt()); //cnt 셋팅
			
			System.out.println(result+"<----1이면성공 아니면 실패");	
			if(result>0){
				int resl = shipService.shipInsert(shipVO);
				o_num = sellerService.recentlyOrderNum(orderVO.getUserid()); 
				System.out.println(resl+"<---이것도 1이 나와야 성공임");
			}
			transactionManager.commit(status);
		}catch(Exception e) {			  
			System.out.println(e.getMessage()+"에러가 요기있습니다.");
			e.printStackTrace();
		}
		return o_num;
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
		mav.addObject("complVO",sellerService.orderCompl(o_num));
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
		
	@RequestMapping("/QNAInsert")
	@ResponseBody
	public String QnaQuestionInsert(QnAVO qnaVO, HttpSession session) {
		qnaVO.setUserid((String)session.getAttribute("logId"));	
		return myinfoService.QnaQuestionInsert(qnaVO)+"";
	}
	
	@RequestMapping("/selectAllQnA")
	@ResponseBody
	public List<QnAVO> selectAllQnA(int num){
		System.out.println(num+"<-- num 잘들어왔니");
		return myinfoService.selectAllQnA(num);
	}
	
	@RequestMapping("/reviewPaging")
	@ResponseBody
	public Map<String,Object> reviewPaging(ItemReviewPageVO reviewPageVO, int num){
		Map<String,Object> maps = new HashMap<String,Object>();
		
		reviewPageVO.setTotalRecord(myinfoService.totalReviewCnt(num));		
		reviewPageVO.setI_num(num);
		
		maps.put("reviewList", myinfoService.selectSellItemReview(reviewPageVO));
		maps.put("pageVO", reviewPageVO);
		
		
		
		return maps;
	}
	
}
