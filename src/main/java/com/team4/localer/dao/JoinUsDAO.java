package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.JoinUsVO;

public interface JoinUsDAO {
	
	public int joinInsert(int num, String userid); //참여신청
	public int joinDelete(int num, String userid); //신청취소
	
	public List<JoinUsVO> joinSelect(String userid); // 사용자의 신청리스트 가져옴
	public int getJCount(int num);//해당 게시글의 참여승인된 갯수를 선택하는 함수
	
}
