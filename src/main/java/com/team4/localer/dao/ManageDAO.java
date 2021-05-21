package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.AdminspendVO;
import com.team4.localer.vo.AdminstatisVO;
import com.team4.localer.vo.BoardVO;
import com.team4.localer.vo.GroupVO;
import com.team4.localer.vo.MemShareVO;
import com.team4.localer.vo.Mem_statisVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.SellitemVO;

public interface ManageDAO {
	//======회원 통계=====
	//3,4,5월 로그인횟수 
	public Mem_statisVO loginNum(Mem_statisVO statisVO);
	//3,4,5월 신규 회원수
	public Mem_statisVO newmem(Mem_statisVO statisVO);
	//지역구별 로그인수
	public Mem_statisVO guLoginCount(Mem_statisVO statisVO);
	//일반/셀러회원수, 신규/휴면회원수 
	public Mem_statisVO subCount(Mem_statisVO statisVO);
	
	//==게시판 통계====
	public Mem_statisVO boardStatis(Mem_statisVO statisVO);
	//모집게시판 지역구별 count
	public Mem_statisVO guGroupCount(Mem_statisVO statisVO);
	//자유게시판 카테고리 count 
	public Mem_statisVO cateCount(Mem_statisVO statisVO);
	
	//===회원정산===
	public AdminspendVO memspend(Mem_statisVO statisVO);
	//충전횟수, 방식 count
	public AdminspendVO memspendCnt(Mem_statisVO statisVO);
	//회원포인트 list
	public List<AdminspendVO> mempsendList(AdminPageVO pageVO);
	//모달1 list
	public List<AdminspendVO> mempsendmodal1List(String userid);
	//모달2 list
	public List<AdminspendVO> mempsendmodal2List(String userid);
	//======셀러정산=====
	//누적 매출, 누적수익
	public AdminspendVO selspendtotal(Mem_statisVO statisVO);
	//이번달 매출, 수익
	public AdminspendVO selspendmonth(Mem_statisVO statisVO);
	//판매 게시글수 3개월 치 select 
	public AdminspendVO countboard(Mem_statisVO statisVO);
	//정산 예정, 정산 완료 count
	public AdminspendVO countspend(Mem_statisVO statisVO);
	//셀러 list 
	public List<AdminspendVO> selspendList(AdminPageVO pageVO);
	//셀러 정산 modal list
	public List<AdminspendVO> selpsendmodalList(int num);
	
	
	//회원목록 allSelect
	public List<MemberVO> memberAllSelect(AdminPageVO pageVO);
	//회원의 신고, 댓글수 count
	public int memInfoCount(String userid,String table);
	//회원 1명 정보 select 
	public MemberVO memOneSelect(String userid);
	//회원 관리 페이지 회원 정보 수정 
	public int memberManageUpdate(String userid,String cate,int status);
	//회원 통계 부분
	public AdminstatisVO statismem(String month);
	
	//셀러관리 페이지 
	//셀러 list Select 
	public List<SellerVO> sellerAllSelect(AdminPageVO pageVO);
	//셀러가 작성한 판매글 리스트
	public List<AdminstatisVO> sellerDetailInfo(int sel_num);
	
	//판매게시글관리 페이지
	//판매게시글관리 상단 통계
	public AdminstatisVO selManageStatis();
	//회원 판매게시판 목록
	public List<MemShareVO> memShareAllSelect(AdminPageVO pageVO);
	//셀러판매 게시판 목록
	public List<SellitemVO> sellerBoardSelect(AdminPageVO pageVO);
	//판매게시글관리 글 삭제
	public int selManageDel(int num,String cate,String numName);
	
	//게시글 관리 페이지 
	//게시글관리 상단 통계
	public AdminstatisVO boardManageStatis();
	//모집게시글 전체 목록
	public List<GroupVO> boardManageAllSelect(AdminPageVO pageVO);
	//자유게시판 전체 목록 & 검색
	public List<BoardVO> cumuManageListSearch(AdminPageVO pageVO);
}
