package com.team4.localer.dao;

import java.util.List;


import com.team4.localer.vo.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> replyList(int num);
	public int replyInsert(ReplyVO vo);
	public int replyDel(ReplyVO vo);
	public int replyUpdate(ReplyVO vo);
	
}




