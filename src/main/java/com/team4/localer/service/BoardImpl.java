package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.BoardDAO;
import com.team4.localer.vo.BoardVO;

@Service
public class BoardImpl implements BoardService{

	@Inject 
	BoardDAO boardDAO;
	
	public BoardImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int commuInsert(BoardVO vo) {
		
		return boardDAO.commuInsert(vo);
	}
	
	

}
