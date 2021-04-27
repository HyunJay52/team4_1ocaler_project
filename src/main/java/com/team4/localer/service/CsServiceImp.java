package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.CsDAO;
import com.team4.localer.vo.CsVO;

@Service
public class CsServiceImp implements CsService {
	@Inject
	CsDAO csdao;
	
	@Override
	public List<CsVO> boardAllSelect() {
		return csdao.boardAllSelect();
	}

	@Override
	public CsVO boardSelect(int num) {
		return csdao.boardSelect(num);
	}

	@Override
	public int boardUpdate(CsVO vo) {
		return csdao.boardUpdate(vo);
	}

}
