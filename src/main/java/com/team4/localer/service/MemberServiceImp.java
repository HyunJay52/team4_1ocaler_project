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
	public MemberVO memLogin(String userid, String userpwd) {
		//로그인
		return dao.memLogin(userid, userpwd);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		//회원가입
		return dao.insertMember(vo);
	}

	@Override
	public String idDoubleCheck(String userid) {
		//아이디 중복확인
		return dao.idDoubleCheck(userid);
	}

	@Override
	public String nickNameDoubleCheck(String mem_nick) {
		//닉네입 중복확인
		return dao.nickNameDoubleCheck(mem_nick);
	}

	@Override
	public int memPostCount(String userid) {
		//회원 포스트 카운트
		return dao.memPostCount(userid);
	}

}
