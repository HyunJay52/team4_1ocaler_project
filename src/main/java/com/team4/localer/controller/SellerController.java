package com.team4.localer.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping(value="/sellWriteOk", method=RequestMethod.POST)
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
		
		//DB작업
		
		System.out.println(uploadFilename.size()+"파일올린것만큼의 갯수를 잘구하나요?");		
		System.out.println("============================");
	
		System.out.println(itemVO.getI_subject()+"제목");
		System.out.println(itemVO.getI_cnt()+"판매갯수");
		System.out.println(itemVO.getI_content()+"내용");
		System.out.println(itemVO.getI_img1()+"이미지");
		System.out.println(itemVO.getI_price()+"가격");
		System.out.println(itemVO.getI_period()+"기간");
		System.out.println(itemVO.getI_status()+"상태");
		System.out.println(itemVO.getI_tag()+"태그");
		System.out.println(itemVO.getI_ship()+"배송비");
		System.out.println("============================");
		System.out.println(optionVO.getOption_title()+"옵션의 타이틀");
		System.out.println(optionVO.getOption_content()+"옵션의 내용");
		System.out.println(optionVO.getO_price()+"옵션의 가격");	
		
		//여기까지 값다나옴 이제 디비작업해야되는데 파일 이름 1,2,3 에다가 넣어주고 뭐시기 해야함
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
