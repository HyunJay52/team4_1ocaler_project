package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.HomeDAO;
import com.team4.localer.vo.GroupVO;

@Service
public class HomeServiceImpl implements HomeService {
	@Inject
	HomeDAO dao;

	@Override
	public List<GroupVO> getGroupList(String g_gu) {
		// 같이가장 최신글 받아오기
//		List<GroupVO> result = dao.getGroupList(g_gu);
//		
//		String a = result.get(1).getG_subject();
//		System.out.println("select 결과 > "+a);
//		
//		return result;
		return dao.getGroupList(g_gu);
	}
}
