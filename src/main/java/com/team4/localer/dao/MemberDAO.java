package com.team4.localer.dao;

import com.team4.localer.vo.MemberVO;

public interface MemberDAO {
	//회원로그인
	public MemberVO memLogin(MemberVO vo);
	
	//일반회원 가입
	public int insertMember(MemberVO vo);
}
