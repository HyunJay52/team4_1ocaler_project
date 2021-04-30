package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.BoardVO;

public interface BoardService {

	public int commuInsert(BoardVO vo);
	
	public List<BoardVO> commuSelect(BoardVO vo);
	
	public BoardVO commuViewSelect(int num);
	
	
}
