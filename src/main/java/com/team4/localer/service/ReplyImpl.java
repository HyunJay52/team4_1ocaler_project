package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.ReplyDAO;
import com.team4.localer.vo.ReplyVO;


@Service
public class ReplyImpl implements ReplyService{

	@Inject
	ReplyDAO replyDAO;

	@Override
	public int replyInsert(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyDAO.replyInsert(vo);
	}

	@Override
	public List<ReplyVO> replyList(int num) {
		// TODO Auto-generated method stub
		return replyDAO.replyList(num);
	}



	@Override
	public int replyUpdate(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyDAO.replyUpdate(vo);
	}

	@Override
	public int replyDel(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyDAO.replyDel(vo);
	}
	
	
	
}
