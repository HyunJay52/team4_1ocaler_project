package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.PrevNextVO;
import com.team4.localer.vo.BoardPageVO;
import com.team4.localer.vo.BoardVO;

public interface BoardDAO {
	
	//커뮤 글쓰기
	public int commuInsert(BoardVO vo);
	//커뮤 글보기 
	//public List<BoardVO> commuSelect(BoardVO vo);
	
	//커뮤 글보기 (페이징?) - 리스트
	public List<BoardVO> commuPageSelect(BoardPageVO vo);
	//커뮤 토탈 레코드수 구하기
	public int boardTotalRecoedCount(BoardPageVO vo);
	

	
	
	//커뮤 글 하나보기
	public BoardVO commuViewSelect(int num);
	//커뮤 글삭제
	public int commuDelete(int num, String userid);
	//커뮤 글수정
	public int commuUpdate(BoardVO vo);
	//레시피 게시판 -- 안써도됨
	public List<BoardVO> commuRecipeSelect(BoardVO vo);
	//자유게시판 -- 안써도됨..
	public List<BoardVO> commuFreeSelect(BoardVO vo);
	//조회수 
	public int hitCount(int num);
	//메인 레시피 테이블?
	public List<BoardVO> recipeSelect(BoardVO vo);
	//메인 자유 테이블?
	public List<BoardVO> freeSelect(BoardVO vo);
	//메인 우리동네이야기 테이블
	public List<BoardVO> commuMainSelect (BoardVO vo);
	//뷰..?
	public BoardVO commuOneSelect(BoardVO vo);
	//구 개수
	public int commuGuSelect(String b_gu);
	//새글
	public BoardVO newSelect(int num);
	//이전글 다음글 
	public PrevNextVO lagLeadSelect(BoardPageVO vo);
	//추천수
	public BoardVO likeCount(int num);
	//그거... 게시글 +1?
	public int memwriteCount(String userid);
	//게시글 -1
	public int memdeleteCount(String userid);
	
//Index page 2021.05.23
	public List<BoardVO> selectIndexRecipe();
}
