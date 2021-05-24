package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.BoardDAO;
import com.team4.localer.vo.BoardPageVO;
import com.team4.localer.vo.BoardVO;
import com.team4.localer.vo.PrevNextVO;

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

	@Override
	public BoardVO newSelect(int num) {
		// TODO Auto-generated method stub
		return boardDAO.newSelect(num);
	}

	@Override
	public PrevNextVO lagLeadSelect(BoardPageVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.lagLeadSelect(vo);
	}

	@Override
	public BoardVO likeCount(int num) {
		// TODO Auto-generated method stub
		return boardDAO.likeCount(num);
	}

	@Override
	public List<BoardVO> commuPageSelect(BoardPageVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.commuPageSelect(vo);
	}

	@Override
	public int boardTotalRecoedCount(BoardPageVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.boardTotalRecoedCount(vo);
	}

	@Override
	public int memwriteCount(String userid) {
		// TODO Auto-generated method stub
		return boardDAO.memwriteCount(userid);
	}

	@Override
	public int memdeleteCount(String userid) {
		// TODO Auto-generated method stub
		return boardDAO.memdeleteCount(userid);
	}

//Index page 2021.05.23
	@Override
	public List<BoardVO> selectIndexRecipe() {
		// 인덱스 페이지용
		return boardDAO.selectIndexRecipe();
	}


	

	

}
