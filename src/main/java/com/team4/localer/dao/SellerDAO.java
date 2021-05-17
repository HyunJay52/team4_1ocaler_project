package com.team4.localer.dao;


import com.team4.localer.vo.SellitemVO;
import java.util.List;

public interface SellerDAO {
	public int sellerInsert(SellitemVO itemVO); //셀러 게시글 등록
	public int itemOptionInsert(String userid, String option_title, String option_content, int o_price); // 아이템 옵션 인설트
	public List<SellitemVO> selectAllitem();//착한발견 리스트 불러오기

}
