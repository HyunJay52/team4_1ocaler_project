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

	@Override
	public int commuDelete(int num, String userid) {
		// TODO Auto-generated method stub
		return boardDAO.commuDelete(num, userid);
	}

	@Override
	public int commuUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.commuUpdate(vo);
	}

	@Override
	public List<BoardVO> commuRecipeSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.commuRecipeSelect(vo);
	}

	@Override
	public List<BoardVO> commuFreeSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.commuFreeSelect(vo);
	}

	@Override
	public int hitCount(int num) {
		// TODO Auto-generated method stub
		return boardDAO.hitCount(num);
	}

	@Override
	public List<BoardVO> recipeSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.recipeSelect(vo);
	}

	@Override
	public List<BoardVO> freeSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.freeSelect(vo);
	}

	@Override
	public List<BoardVO> commuMainSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.commuMainSelect(vo);
	}

	@Override
	public BoardVO commuOneSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.commuOneSelect(vo);
	}

	@Override
	public int commuGuSelect(String b_gu) {
		// TODO Auto-generated method stub
		return boardDAO.commuGuSelect(b_gu);
	}

	
	


	

	

}
