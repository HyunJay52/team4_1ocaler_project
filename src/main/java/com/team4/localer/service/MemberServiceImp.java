package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.MemberDAO;
import com.team4.localer.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	@Inject
	MemberDAO dao;
	
	@Override
	public MemberVO memLogin(MemberVO vo) {
		return dao.memLogin(vo);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

}
