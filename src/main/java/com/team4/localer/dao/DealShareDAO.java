package com.team4.localer.dao;

import com.team4.localer.vo.DealShareVO;

public interface DealShareDAO{

	//멤버 글등록
	public int dealInsert(DealShareVO vo);
	//뒤로가기 하기위한 하나 선택
	public DealShareVO dealOneselect(DealShareVO vo);
	
}
