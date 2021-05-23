package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.BoardPageVO;
import com.team4.localer.vo.BoardVO;
import com.team4.localer.vo.PrevNextVO;

public interface BoardService {

	public int commuInsert(BoardVO vo);
	
	
	public BoardVO commuViewSelect(int num);
	
	public int commuDelete(int num, String userid);
	
	public int commuUpdate(BoardVO vo);
	
	public List<BoardVO> commuRecipeSelect(BoardVO vo);
	
	public List<BoardVO> commuFreeSelect(BoardVO vo);
	
	public int hitCount(int num);
	
	public List<BoardVO> recipeSelect(BoardVO vo);
	
	public List<BoardVO> freeSelect(BoardVO vo);
	
	public List<BoardVO> commuMainSelect (BoardVO vo);
	
	public BoardVO commuOneSelect(BoardVO vo);
	
	public int commuGuSelect(String b_gu);
	
	public BoardVO newSelect(int num);
	
	public PrevNextVO lagLeadSelect(BoardPageVO vo);
	
	public BoardVO likeCount(int num);
	
	//커뮤 글보기 (페이징?) - 리스트
	public List<BoardVO> commuPageSelect(BoardPageVO vo);
	//커뮤 토탈 레코드수 구하기
	public int boardTotalRecoedCount(BoardPageVO vo);
	
	public int memwriteCount(String userid);
	
	public int memdeleteCount(String userid);
	
//Index page 2021.05.23
	public List<BoardVO> selectIndexRecipe();
	
	
}
