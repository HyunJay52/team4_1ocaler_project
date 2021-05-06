package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.AdminstatisVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

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
}
