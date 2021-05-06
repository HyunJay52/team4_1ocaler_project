package com.team4.localer.service;

import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

public interface MemberService {
	//회로그인
	public MemberVO memLogin(String userid, String userpwd);
	//회원가입
	public int insertMember(MemberVO vo);
	//셀러 회원가입 비밀번호 재확인
	public String sellerPwdDoubleCheck(String userid, String userpwd);
	//셀러 회원기입
	public int insertSeller(SellerVO vo);
	//아이디 중복확인
	public String idDoubleCheck(String userid);
	//별명 중복확인
	public String nickNameDoubleCheck(String mem_nick);
	//mem_post 카운트
	public int memPostCount(String userid);
}
