package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.JoinUsDAO;
import com.team4.localer.vo.JoinUsVO;

@Service
public class JoinUsServiceImpl implements JoinUsService{

	@Inject
	JoinUsDAO joinUsDAO;
	
	@Override
	public int joinInsert(int num, String userid) {		
		return joinUsDAO.joinInsert(num, userid);
	}

	@Override
	public int joinDelete(int num, String userid) {
			return joinUsDAO.joinDelete(num, userid);
	}

	@Override
	public List<JoinUsVO> joinSelect(String userid) {
		return joinUsDAO.joinSelect(userid);
	}

}
