package com.team4.localer.dao;


import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.DealPageVO;
import com.team4.localer.vo.Item_optionVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.OrderVO;
import com.team4.localer.vo.SellitemVO;
import java.util.List;

public interface SellerDAO {
	public int sellerInsert(SellitemVO itemVO); //셀러 게시글 등록
	public int itemOptionInsert(String userid, String option_title, String option_content, String o_price); // 아이템 옵션 인설트
	public List<SellitemVO> selectAllitem();//착한발견 리스트 불러오기
	
	//착한발견 리스트 가져오기..
	public List<SellitemVO> sellPageSelect(DealPageVO vo);
	//리스트보기 페이징?
	public int sellTotalRecoedCount (DealPageVO vo);
	
	

	public SellitemVO selectOnePage(int i_num);//1개 게시글 가져오기
	
	
	public List<Item_optionVO> notOverlapOptionTitleSel(int i_num);// 옵션 타이틀 목록 중복제거값 가져오기
	
	public List<Item_optionVO> changeOptions(String option_title, int i_num);//옵션목록바꾸기 아작스
	

	//판매자 정보 불러오기
	public SellerVO sellerInfo(String userid);
	//판매자 제품 list
	public List<SellitemVO> sellerItems(String userid);
	public Cha_pVO findChaSpPoint(String userid); // 해당 유저의 cha 합계 sp 합계불러오기
	
	public int sellerOrderInsert(OrderVO orderVO);//ordertbl (주문 인설트)
	
	
	public int cha_pointInsert(String userid, int cha_point, int cha_mtd); //판매자에게 cha_point(+) 인설트
	public int sp_pointInsert(String userid, int sp_point, int sp_item);   //구매자에게 sp_point(-) 인설트
}
