package com.team4.localer.dao;


import com.team4.localer.vo.Item_optionVO;
import com.team4.localer.vo.SellitemVO;
import java.util.List;

public interface SellerDAO {
	public int sellerInsert(SellitemVO itemVO); //셀러 게시글 등록
	public int itemOptionInsert(String userid, String option_title, String option_content, String o_price); // 아이템 옵션 인설트
	public List<SellitemVO> selectAllitem();//착한발견 리스트 불러오기

	public SellitemVO selectOnePage(int i_num);//1개 게시글 가져오기
	
	
	public List<Item_optionVO> notOverlapOptionTitleSel(int i_num);// 옵션 타이틀 목록 중복제거값 가져오기
	
	public List<Item_optionVO> changeOptions(String option_title, int i_num);//옵션목록바꾸기 아작스
	
	
}
