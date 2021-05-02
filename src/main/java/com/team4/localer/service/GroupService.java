package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.GroupPageVO;
import com.team4.localer.vo.GroupVO;

public interface GroupService {
	public int groupInsert(GroupVO vo);// 한끼미식회, 가치가장(동네마트) 인설트
	public int groupBigMartInsert(GroupVO vo);// 가치가장(창고형마트) 인설트
	
	public List<GroupVO> GroupListAll(GroupPageVO pageVO); // 해당지역구의 한끼미식회 총리스트 가져오기

	
	public GroupVO eatViewPageResult(int num);//게시글 1개 보는 뷰페이지 해야함
	public GroupVO withViewPageResult(int num);//withView의 1개 게시글선택
	
	public int groupRecordDelete(int num, String userid);//글삭제
	
	
	public int groupTotalRecoedCount(GroupPageVO pageVO);//토탈 레코드수 구하기
	
	
	
	public int hitCount(int num); //조회수 늘리기
	
	

}
