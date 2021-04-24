package com.team4.localer.service;

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
}
