package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.LikeItVO;

public interface LikeItDAO {
	public int likeInsert(int num, String userid);//좋아요 insert
	public int likeDelete(int num, String userid);//좋아요 delete
	
	
	public List<LikeItVO> LikeItSelectAll();//좋아요 테이블의 모든 데이터를 가져온다.// 매개변수에 게시판마다 다른 구분번호 주면 검색하는데 더 적은 시간이 걸리지않을까?
}
