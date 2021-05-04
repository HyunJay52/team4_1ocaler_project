package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.CsDAO;
import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.CsVO;
import com.team4.localer.vo.OftenqVO;
import com.team4.localer.vo.ReportVO;

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

	@Override
	public int oftenqInsert(OftenqVO vo) {
		return csdao.oftenqInsert(vo);
	}

	@Override
	public ReportVO reportOneSelect(int num) {
		return csdao.reportOneSelect(num);
	}

	@Override
	public int reportUpdate(ReportVO vo) {
		return csdao.reportUpdate(vo);
	}

	@Override
	public List<CsVO> searchReport(String searchkey, String text) {
		return csdao.searchReport(searchkey, text);
	}

	@Override
	public List<CsVO> searchOftenq(String searchkey, String text) {
		return csdao.searchOftenq(searchkey,text);
	}

	@Override
	public List<CsVO> searchCs(String searchkey, String text) {
		return csdao.searchCs(searchkey, text);
	}

	@Override
	public List<CsVO> csTblSelect() {
		return csdao.csTblSelect();
	}

	@Override
	public int totalRecord(AdminPageVO pageVO) {
		return csdao.totalRecord(pageVO);
	}

	@Override
	public List<CsVO> onePageRecordSelect_rep(AdminPageVO pageVO) {
		return csdao.onePageRecordSelect_rep(pageVO);
	}

}
