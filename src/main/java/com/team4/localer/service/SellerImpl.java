package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.SellerDAO;
import com.team4.localer.vo.Item_optionVO;
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
	public List<SellitemVO> selectAllitem() {
		return sellerDAO.selectAllitem();
	}
	@Override
	public int itemOptionInsert(String userid, String option_title, String option_content, String o_price) {
		return sellerDAO.itemOptionInsert(userid, option_title, option_content, o_price);
	}

	@Override
	public List<Item_optionVO> notOverlapOptionTitleSel(int i_num) {		
		return sellerDAO.notOverlapOptionTitleSel(i_num);
	}
	@Override
	public List<Item_optionVO> changeOptions(String option_title, int i_num) {
		return sellerDAO.changeOptions(option_title, i_num);
	}
	
	
	@Override
	public SellitemVO selectOnePage(int i_num) {		
		return sellerDAO.selectOnePage(i_num);
	}
	
	
	
	
}
