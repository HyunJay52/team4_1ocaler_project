package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.MyinfoPageVO;

public interface MyInfoDAO {
	//내 정보 조회
	public MemberVO setMyinfo(String userid);
	
	//내 정보 비밀번호 확인
	public MemberVO goMyinfopage(MemberVO vo);
	
	//포인트 조회
	public String joinPoint(String userid);
	
	//포인트 충전
	public int pointCharge(Cha_pVO vo);
	
	//포인트 전체 사용내역 조회
	public List<Cha_pVO> allPointSelect(MyinfoPageVO pVO);
	
	//유저의 총 포인트 사용횟수 조회
	public String pointCount(MyinfoPageVO pVO);
}
