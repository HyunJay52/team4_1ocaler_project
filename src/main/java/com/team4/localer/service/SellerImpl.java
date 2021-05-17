package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.SellerDAO;
import com.team4.localer.vo.SellitemVO;

@Service
public class SellerImpl implements SellerService {
	@Inject
	SellerDAO sellerDAO;

	@Override
	public int sellerInsert(SellitemVO itemVO) {
		return sellerDAO.sellerInsert(itemVO);
	}

	@Override
	public int itemOptionInsert(String userid, String option_title, String option_content, int o_price) {
		return sellerDAO.itemOptionInsert(userid, option_title, option_content, o_price);
	}



	
	
	
}
