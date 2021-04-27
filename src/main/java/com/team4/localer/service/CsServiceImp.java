package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.CsDAO;
import com.team4.localer.vo.CsVO;
import com.team4.localer.vo.OftenqVO;

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


	@Override
	public List<CsVO> oftenqSelect() {
		return csdao.oftenqSelect();
	}

	@Override
	public List<CsVO> reportSelect() {
		return csdao.reportSelect();
	}

	@Override
	public OftenqVO oftenqOneSelect(int num) {
		return csdao.oftenqOneSelect(num);
	}

	@Override
	public int oftenqUpdate(OftenqVO vo) {
		return csdao.oftenqUpdate(vo);
	}

	@Override
	public int oftenqDelete(int num) {
		return csdao.oftenqDelete(num);
	}

}
