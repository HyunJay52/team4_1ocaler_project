package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.ItemReviewVO;
import com.team4.localer.vo.JoinUsVO;
import com.team4.localer.vo.MemShareVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.MyinfoJoinUsVO;
import com.team4.localer.vo.MyinfoPageVO;
import com.team4.localer.vo.OrderVO;

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
	
	//유저의 특정 게시글 Count 조회
	public int myCount(MyinfoPageVO vo);
	
	//유저의 회원간 거래 게시글 리스트 조회
	public List<MemShareVO> selectMyShare(MyinfoPageVO vo);
	
	//참여신청 회원 리스트 조회
	public List<JoinUsVO> selectJoinUs(int num);
	
	//유저가 참여한 직거래 내역 조회
	public List<OrderVO> selectOrder(MyinfoPageVO vo);
	
	//리뷰등록
	public int writeReview(ItemReviewVO vo);
	
	//리뷰작성시 joinus 상태 업데이트
	public int updateReviewStatus(int j_num);
	
	//참여신청 수락시 상태 업데이트
	public int updateJoinStatus(int j_num);
	
	//참여신청 취소처리 업데이트
	public int updateJoinCancel(int j_num);
	
	//거래글의 참여인원 카운트, 리뷰작성이 완료된 카운트 조회후 vo로 리턴
	public MyinfoJoinUsVO selectReviewCount(int num);
	
	//특정 게시글의 나의 리뷰 조회
	public ItemReviewVO selectMyReview(ItemReviewVO vo);
}
