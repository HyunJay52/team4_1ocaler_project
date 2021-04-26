package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.GroupDAO;
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
		public List<GroupVO> GroupEatList(String loc_gu) {			
			return groupDAO.GroupEatList(loc_gu);
		}

		@Override
		public List<GroupVO> GroupWithList(String loc_gu) {			
			return groupDAO.GroupWithList(loc_gu);
		}

		@Override
		public GroupVO groupEatOnePage(int num) {
			return groupDAO.groupEatOnePage(num);
		}

		
		
		
		
	

		
}
