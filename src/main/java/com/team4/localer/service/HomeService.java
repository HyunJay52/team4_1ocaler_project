package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.GroupVO;

public interface HomeService {
	
	//가치가장 최신글 불러오기
	public List<GroupVO> getGroupList(String g_gu);
	
}
