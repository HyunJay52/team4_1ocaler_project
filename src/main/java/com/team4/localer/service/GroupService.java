package com.team4.localer.service;

import com.team4.localer.vo.GroupVO;

public interface GroupService {
	public int groupInsert(GroupVO vo);// 한끼미식회, 가치가장(동네마트) 인설트
	public int groupBigMartInsert(GroupVO vo);// 가치가장(창고형마트) 인설트
}
