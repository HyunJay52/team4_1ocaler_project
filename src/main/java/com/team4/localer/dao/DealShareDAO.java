package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.DealShareVO;

public interface DealShareDAO{

	//멤버 글등록
	public int dealInsert(DealShareVO vo);
	//뒤로가기 하기위한 하나 선택
	public DealShareVO dealOneselect(DealShareVO vo);
	//리스트 보기
	public List<DealShareVO> dealListSelect(DealShareVO vo);
	//게시글 하나보기
	public DealShareVO dealViewSelect(int num);
	//게시글 삭제
	public int dealSellDelete(int num, String userid);
	
}
