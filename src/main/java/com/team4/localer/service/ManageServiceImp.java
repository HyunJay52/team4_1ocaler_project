package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.team4.localer.dao.ManageDAO;
import com.team4.localer.vo.MemberVO;

@Service
public class ManageServiceImp implements ManageService {
	@Inject
	ManageDAO manadao;

	@Override
	public List<MemberVO> memAllSelect(String searchkey,String searchword) {
		return manadao.memAllSelect(searchkey, searchword);
	}

	@Override
	public MemberVO memOneSelect(String userid) {
		return manadao.memOneSelect(userid);
	}

	@Override
	public int memInfoCount(String userid, String table) {
		return manadao.memInfoCount(userid, table);
	}



	
}
