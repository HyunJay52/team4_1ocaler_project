package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.MyInfoDAO;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.MemberVO;

@Service
public class MyInfoServiceImp implements MyInfoService{
	@Inject
	MyInfoDAO dao;
	
	@Override
	public MemberVO setMyinfo(String userid) {

		return dao.setMyinfo(userid);
	}
	
	@Override
	public MemberVO goMyinfopage(MemberVO vo) {
		
		return dao.goMyinfopage(vo);
	}

	@Override
	public String joinPoint(String userid) {

		return dao.joinPoint(userid);
	}

	@Override
	public int pointCharge(Cha_pVO vo) {
		
		return dao.pointCharge(vo);
	}

	@Override
	public List<Cha_pVO> allPointSelect(String userid, int rownum1, int rownum2){

		return dao.allPointSelect(userid, rownum1, rownum2);
	}

	@Override
	public String pointCount(String userid) {
		
		return dao.pointCount(userid);
	}


	

	
}
