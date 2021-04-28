package com.team4.localer.dao;

import com.team4.localer.vo.MemberVO;

public interface MemberDAO {
	//회원로그인
	public MemberVO memLogin(String userid, String userpwd);
	
	//일반회원 가입
	public int insertMember(MemberVO vo);
	//아이디 중복확인
	public String idDoubleCheck(String userid);
	//별명 중복확인
	public String nickNameDoubleCheck(String mem_nick);
}
