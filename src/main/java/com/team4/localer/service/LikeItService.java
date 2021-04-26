package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.LikeItVO;

public interface LikeItService {
	public int likeInsert(int num, String userid);//좋아요 insert
	public int likeDelete(int num, String userid);//좋아요 delete
	
	public List<LikeItVO> LikeItSelectAll();//좋아요 테이블의 모든 데이터를 가져온다.
}
