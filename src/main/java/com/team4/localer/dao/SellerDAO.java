package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.SellitemVO;

public interface SellerDAO {
	//착한발견 리스트 불러오기
	public List<SellitemVO> selectAllitem();
	
}
