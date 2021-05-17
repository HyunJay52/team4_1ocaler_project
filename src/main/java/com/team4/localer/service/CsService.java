package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.CsVO;
import com.team4.localer.vo.OftenqVO;
import com.team4.localer.vo.ReportVO;

public interface CsService {
	//총레코드 수 구하기 
	public int totalRecord(AdminPageVO pageVO);
	//총레코드 수 구하기 
	public int spendtotalRecord(AdminPageVO pageVO);
	//한페이지 레코드 select 하기
	public List<ReportVO> onePageRecordSelect_rep(AdminPageVO pageVO);
	//한페이지 레코드 select 하기
	public List<CsVO> onePageRecordSelect_cs(AdminPageVO pageVO);
	//한페이지 레코드 select 하기
	public List<OftenqVO> onePageRecordSelect_of(AdminPageVO pageVO);
	//고객문의 미답변 글목록
	public List<CsVO> csTblSelect();
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
	//========검색 select 부분 
	//신고 검색
	public List<CsVO> searchReport(String searchkey,String text);
	//자주하는 질문 검색
	public List<CsVO> searchOftenq(String searchkey,String text);
	//1:1 문의 검색
	public List<CsVO> searchCs(String searchkey, String text);

//뷰 페이지 부분 처리
	//신고글 insert
	public int reportInsert(ReportVO vo);
	//1:1 문의
	public int csQnaInsert(CsVO vo);
	//자주하는 질문 전체 선택
	public List<OftenqVO> selectAlloftenQ();
	//자주하는 질문 조회수 
	public int oftenqnaCnt(int of_num);
	//자주하는 질문 검색
	public List<OftenqVO> searchOftenqView(String setKey, String setWord);
		
}
