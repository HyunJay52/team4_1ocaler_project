package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.BoardDAO;
import com.team4.localer.vo.BoardVO;

@Service
public class BoardImpl implements BoardService{

	@Inject 
	BoardDAO boardDAO;
	
	public BoardImpl() {
		
	}

	@Override
	public int commuInsert(BoardVO vo) {
		
		return boardDAO.commuInsert(vo);
	}

	@Override
	public List<BoardVO> commuSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.commuSelect(vo);
	}

	@Override
	public BoardVO commuViewSelect(int num) {
		// TODO Auto-generated method stub
		return boardDAO.commuViewSelect(num);
	}
	
	

}
