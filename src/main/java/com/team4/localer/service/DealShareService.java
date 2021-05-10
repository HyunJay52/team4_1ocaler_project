package com.team4.localer.service;

import com.team4.localer.vo.DealShareVO;

public interface DealShareService {
	public int dealInsert(DealShareVO vo);
	
	public DealShareVO dealOneselect(DealShareVO vo);

}
