package com.team4.localer.service;

import com.team4.localer.vo.SellitemVO;

public interface SellerService {
	public int sellerInsert(SellitemVO itemVO); //셀러 게시글 등록
	
	
	public int itemOptionInsert(String userid, String option_title, String option_content, int o_price); // 아이템 옵션 인설트

}
