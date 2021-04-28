package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.LikeItDAO;
import com.team4.localer.vo.LikeItVO;

@Service
public class LikeItServiceImpl implements LikeItService {

	@Inject
	LikeItDAO likeItDAO;
	
	@Override
	public int likeInsert(int num, String userid) {		
		return likeItDAO.likeInsert(num, userid);
	}

	@Override
	public int likeDelete(int num, String userid) {
		return likeItDAO.likeDelete(num, userid);
	}

	@Override
	public List<LikeItVO> LikeItSelectAll(String userid) {
		return likeItDAO.LikeItSelectAll(userid);
	}

	

}
