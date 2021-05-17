package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.SellerDAO;
import com.team4.localer.vo.SellitemVO;

@Service
public class SellerImpl implements SellerService {
	@Inject
	SellerDAO sellerDAO;

	@Override
	public List<SellitemVO> selectAllitem() {
		// 착한발견 리스트 불러오기
		return sellerDAO.selectAllitem();
	}
	
	
}
