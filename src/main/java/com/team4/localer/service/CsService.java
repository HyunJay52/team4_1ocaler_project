package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.CsVO;

public interface CsService {
	//고객문의 글 중 미처리만 모아놓은 전체목록
	public List<CsVO> boardAllSelect();
	//고객문의 글 1개 출력
	public CsVO boardSelect(int num);
	//답변 달아주는 업데이트문 
	public int boardUpdate(CsVO vo);
}
