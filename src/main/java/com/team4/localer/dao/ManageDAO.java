package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.MemberVO;

public interface ManageDAO {
	//회원 리스트 AllSelect
	public List<MemberVO> memAllSelect(String searchkey,String searchword);
	//회원의 신고, 댓글수 count
	public int memInfoCount(String userid,String table);
	//회원 1명 정보 select 
	public MemberVO memOneSelect(String userid);
	
}
