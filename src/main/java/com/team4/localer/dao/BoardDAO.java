package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.BoardVO;

public interface BoardDAO {
	
	//커뮤 글쓰기
	public int commuInsert(BoardVO vo);
	//커뮤 글보기
	public List<BoardVO> commuSelect(BoardVO vo);
	//커뮤 글 하나보기
	public BoardVO commuViewSelect(int num);
	
	
}
