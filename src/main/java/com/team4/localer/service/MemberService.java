package com.team4.localer.service;

import com.team4.localer.vo.MemberVO;

public interface MemberService {
	//회로그인
	public MemberVO memLogin(String userid, String userpwd);
	//회원가입
	public int insertMember(MemberVO vo);
}
