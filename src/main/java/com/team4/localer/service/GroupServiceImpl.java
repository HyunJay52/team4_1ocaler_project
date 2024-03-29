package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.GroupDAO;
import com.team4.localer.vo.GroupPageVO;
import com.team4.localer.vo.GroupVO;

@Service
public class GroupServiceImpl implements GroupService{

		@Inject
		GroupDAO groupDAO;
		
		
		@Override
		public int groupInsert(GroupVO vo) {
			return groupDAO.groupInsert(vo);
		}

		@Override
		public int groupBigMartInsert(GroupVO vo) {
			return groupDAO.groupBigMartInsert(vo);
		}


		@Override
		public GroupVO eatViewPageResult(int num) {
			return groupDAO.eatViewPageResult(num);
		}

		@Override
		public GroupVO withViewPageResult(int num) {
			return groupDAO.withViewPageResult(num);
		}

		@Override
		public int hitCount(int num) {
			return groupDAO.hitCount(num);
		}

		@Override
		public int groupRecordDelete(int num, String userid) {
			return groupDAO.groupRecordDelete(num, userid);
		}

	

		@Override
		public List<GroupVO> GroupListAll(GroupPageVO pageVO) {
			return groupDAO.GroupListAll(pageVO);
		}

		@Override
		public int groupTotalRecoedCount(GroupPageVO pageVO) {
			return groupDAO.groupTotalRecoedCount(pageVO);
		}

		@Override
		public int groupRecordUpdate(GroupVO vo) {
			return groupDAO.groupRecordUpdate(vo);
		}

	

	
		
		
		
		
	

		
}
