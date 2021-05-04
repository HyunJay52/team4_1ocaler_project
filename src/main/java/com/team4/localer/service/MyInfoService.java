package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.MemberVO;

public interface MyInfoService {
	//내 정보 조회
	public MemberVO setMyinfo(String userid);
	
	//내 정보 비밀번호 확인
	public MemberVO goMyinfopage(MemberVO vo);
	
	//포인트 조회
	public String joinPoint(String userid);
	
	//포인트 충전
	public int pointCharge(Cha_pVO vo);
	
	//포인트 전체 사용내역 조회
	public List<Cha_pVO> allPointSelect(String userid, int rownum1, int rownum2);
	
	//유저의 총 포인트 사용횟수 조회
	public String pointCount(String userid);
}
