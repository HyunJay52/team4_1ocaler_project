package com.team4.localer.service;

import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

public interface MemberService {
	//회로그인
	public MemberVO memLogin(String userid, String userpwd);
	//로그인 데이터 저장
	public void logCount(String userid, String loc_gu);
	//아이디 찾기
	public String searchId(MemberVO vo);
	//비밀번호 찾기
	public String searchPwd(MemberVO vo);
	//회원가입
	public int insertMember(MemberVO vo);
	//일반회원가입 보너스 적립액
	public int insertEventbonus(String userid);
	//일반회원정보 수정
	public int updateMember(MemberVO vo);
	//일반회원 탈퇴
	public int deleteMember(String userid);
	//회원 탈퇴 시
	public int insertDelMember(MemberVO vo);
	//셀러회원 상태 업뎃
	public int updateSellerStatus(String userid);
	//셀러 회원가입 비밀번호 재확인
	public String sellerPwdDoubleCheck(String userid, String userpwd);
	//셀러 회원가입
	public int insertSeller(SellerVO vo);
	//셀러 회원가입 성공 시 상태 업데이트 
	public int updateMemStatus(String userid);
	//셀러회원 정보수정
	public SellerVO selectSeller(String userid);
	//셀러 정보 수정 확인
	public int updateSeller(SellerVO vo);
	//셀러탈퇴
	public int updateDelseller(String userid);
	//탈퇴 셀러회원 일반회원으로 변경 
	public int updateDelsellerToMem(String userid);
	//아이디 중복확인
	public String idDoubleCheck(String userid);
	//별명 중복확인
	public String nickNameDoubleCheck(String mem_nick);
	//mem_post 카운트
	public int memPostCount(String userid);
	//member의 주소 연락처 이름 가져오기
	public MemberVO userDetailFind(String userid);

	//이메일 인증
	public int checkMemEmail(String whichpage, String mem_email);
}
