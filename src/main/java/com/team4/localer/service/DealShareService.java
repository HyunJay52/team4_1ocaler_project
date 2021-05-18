package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.DealPageVO;
import com.team4.localer.vo.DealShareVO;

public interface DealShareService {
	public int dealInsert(DealShareVO vo);
	
	public DealShareVO dealOneselect(DealShareVO vo);
	
	public List<DealShareVO> dealListSelect(DealShareVO vo);
	
	public List<DealShareVO> dealPageSelect(DealPageVO vo);

	public DealShareVO dealViewSelect(int num);
	
	public int dealSellDelete(int num, String userid);
	
	public int dealUpdate(DealShareVO vo);
	
	public DealShareVO dealViewSelectNumX(int num);
	
	public int dealTotalRecoedCount(DealPageVO vo);
}
