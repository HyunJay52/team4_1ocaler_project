package com.team4.localer.dao;

import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

public interface MemberDAO {
	//회원로그인
	public MemberVO memLogin(String userid, String userpwd);
	//일반회원 가입
	public int insertMember(MemberVO vo);
	//일반회원가입 보너스 적립액
	public int insertEventbonus(String userid);
	//셀러회원가입 비밀번호 재확인
	public String sellerPwdDoubleCheck(String userid, String userpwd);
	//셀러회원 가입
	public int insertSeller(SellerVO vo);
	//셀러 회원가입 성공 시 상태 업데이트 
	public int updateMemStatus(String userid);
	//아이디 중복확인
	public String idDoubleCheck(String userid);
	//별명 중복확인
	public String nickNameDoubleCheck(String mem_nick);
	//mem_post 카운트
	public int memPostCount(String userid);
}
