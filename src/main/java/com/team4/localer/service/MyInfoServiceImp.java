package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.MyInfoDAO;
import com.team4.localer.vo.MemberVO;

@Service
public class MyInfoServiceImp implements MyInfoService{
	@Inject
	MyInfoDAO dao;
	
	@Override
	public MemberVO goMyinfopage(MemberVO vo) {
		
		return dao.goMyinfopage(vo);
	}
	
}
