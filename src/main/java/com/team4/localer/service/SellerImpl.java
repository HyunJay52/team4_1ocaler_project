package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.SellerDAO;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.DealPageVO;
import com.team4.localer.vo.Item_optionVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.OrderVO;
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
	@Override
	public SellerVO sellerInfo(String userid) {
		return sellerDAO.sellerInfo(userid);
	}
	@Override
	public List<SellitemVO> sellerItems(String userid) {
		return sellerDAO.sellerItems(userid);
	}
	@Override
	public Cha_pVO findChaSpPoint(String userid) {		
		return sellerDAO.findChaSpPoint(userid);
	}
	@Override
	public int sellerOrderInsert(OrderVO orderVO) {
		return sellerDAO.sellerOrderInsert(orderVO);
	}
	@Override
	public int cha_pointInsert(String userid, int cha_point, int cha_mtd) {
		return sellerDAO.cha_pointInsert(userid, cha_point, cha_mtd);
	}
	@Override
	public int sp_pointInsert(String userid, int sp_point, int sp_item) {
		return sellerDAO.sp_pointInsert(userid, sp_point, sp_item);
	}
	@Override
	public List<SellitemVO> sellPageSelect(DealPageVO vo) {
		// TODO Auto-generated method stub
		return sellerDAO.sellPageSelect(vo);
	}
	@Override
	public int sellTotalRecoedCount (DealPageVO vo) {
		// TODO Auto-generated method stub
		return sellerDAO.sellTotalRecoedCount(vo);
	}
	
	
	
	
}
