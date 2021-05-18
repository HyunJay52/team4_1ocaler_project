package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.DealPageVO;
import com.team4.localer.vo.DealShareVO;

public interface DealShareDAO{

	//멤버 글등록
	public int dealInsert(DealShareVO vo);
	//뒤로가기 하기위한 하나 선택
	public DealShareVO dealOneselect(DealShareVO vo);
	//리스트 보기
	public List<DealShareVO> dealListSelect(DealShareVO vo);
	//리스트 보기 페이징한거
	public List<DealShareVO> dealPageSelect(DealPageVO vo);
	
	//게시글 하나보기
	public DealShareVO dealViewSelect(int num);
	public DealShareVO dealViewSelectNumX(int num);
	//게시글 삭제
	public int dealSellDelete(int num, String userid);
	//게시글 수정
	public int dealUpdate(DealShareVO vo);
	
	//토탈 레코드 수구하기
	public int dealTotalRecoedCount(DealPageVO vo);
	

	
	
	
}
