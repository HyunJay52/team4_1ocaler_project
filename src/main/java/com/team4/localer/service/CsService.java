package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.CsVO;
import com.team4.localer.vo.OftenqVO;
import com.team4.localer.vo.ReportVO;

public interface CsService {
	//고객문의 글 중 미처리만 모아놓은 전체목록
	public List<CsVO> boardAllSelect();
	//고객문의 글 1개 출력
	public CsVO boardSelect(int num);
	//답변 달아주는 업데이트문 
	public int boardUpdate(CsVO vo);
	//자주하는 질문 select
	public List<CsVO> oftenqSelect();
	//신고글, 1:1신고 중 1개 select
	public List<CsVO> reportSelect();
	//자주하는 질문 1개 select 
	public OftenqVO oftenqOneSelect(int num);
	//자주하는 질문 수정
	public int oftenqUpdate(OftenqVO vo);
	//자주하는 질문 삭제
	public int oftenqDelete(int num);
	//자주하는 질문 작성
	public int oftenqInsert(OftenqVO vo);
	//신고글 1개 select 
	public ReportVO reportOneSelect(int num);
	//신고글 Update
	public int reportUpdate(ReportVO vo);
}
