package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

public interface ManageService {
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
}
