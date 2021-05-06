package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.ReplyVO;

public interface ReplyService {

	public int replyInsert(ReplyVO vo);
	public List<ReplyVO> replyList(int num);
	public int replyDel(ReplyVO vo);
	public int replyUpdate(ReplyVO vo);
}
