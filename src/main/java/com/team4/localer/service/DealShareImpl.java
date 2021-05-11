package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.DealShareDAO;
import com.team4.localer.vo.DealShareVO;

@Service

public class DealShareImpl implements DealShareService{
	
	@Inject
	DealShareDAO dealshaerdDAO;

	@Override
	public int dealInsert(DealShareVO vo) {
		// TODO Auto-generated method stub
		return dealshaerdDAO.dealInsert(vo);
	}

	@Override
	public DealShareVO dealOneselect(DealShareVO vo) {
		// TODO Auto-generated method stub
		return dealshaerdDAO.dealOneselect(vo);
	}

	@Override
	public List<DealShareVO> dealListSelect(DealShareVO vo) {
		// TODO Auto-generated method stub
		return dealshaerdDAO.dealListSelect(vo);
	}

	@Override
	public DealShareVO dealViewSelect(int num) {
		// TODO Auto-generated method stub
		return dealshaerdDAO.dealViewSelect(num);
	}

	@Override
	public int dealSellDelete(int num, String userid) {
		// TODO Auto-generated method stub
		return dealshaerdDAO.dealSellDelete(num, userid);
	}
	
	
	
}
