package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.AdminstatisVO;
import com.team4.localer.vo.BoardVO;
import com.team4.localer.vo.GroupVO;
import com.team4.localer.vo.MemShareVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.SellitemVO;

public interface ManageDAO {
	//회원목록 allSelect
	public List<MemberVO> memberAllSelect(AdminPageVO pageVO);
	//회원의 신고, 댓글수 count
	public int memInfoCount(String userid,String table);
	//회원 1명 정보 select 
	public MemberVO memOneSelect(String userid);
	//회원 관리 페이지 회원 정보 수정 
	public int memberManageUpdate(String userid,String cate,int status);
	
	
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
