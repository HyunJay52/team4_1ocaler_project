package com.team4.localer.service;

import com.team4.localer.vo.MemberVO;

public interface MemberService {
	//회로그인
	public MemberVO memLogin(String userid, String userpwd);
	//회원가입
	public int insertMember(MemberVO vo);
	//아이디 중복확인
	public String idDoubleCheck(String userid);
	//별명 중복확인
	public String nickNameDoubleCheck(String mem_nick);
}
