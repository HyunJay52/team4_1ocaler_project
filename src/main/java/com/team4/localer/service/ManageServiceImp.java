package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.team4.localer.dao.ManageDAO;
import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

@Service
public class ManageServiceImp implements ManageService {
	@Inject
	ManageDAO manadao;


	@Override
	public MemberVO memOneSelect(String userid) {
		return manadao.memOneSelect(userid);
	}

	@Override
	public int memInfoCount(String userid, String table) {
		return manadao.memInfoCount(userid, table);
	}

	@Override
	public int memberManageUpdate(String userid, String cate, int status) {
		return manadao.memberManageUpdate(userid, cate, status);
	}

	@Override
	public List<SellerVO> sellerAllSelect(AdminPageVO pageVO) {
		return manadao.sellerAllSelect(pageVO);
	}

	@Override
	public List<MemberVO> memberAllSelect(AdminPageVO pageVO) {
		return manadao.memberAllSelect(pageVO);
	}



	
}
