package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.SideBarDAO;
import com.team4.localer.vo.ChatVO;

@Service
public class SideBarSeriveImp implements SidebarService {
	@Inject
	SideBarDAO dao;

	@Override
	public List<ChatVO> selectChatList(String userid) {
		// 채팅방 리스트 불러오기
		return dao.selectChatList(userid);
	}

	@Override
	public int selectChatroomNum(String chatRoomName) {
		// 선택된 채팅방 번호 내용 가져오기
		return dao.selectChatroomNum(chatRoomName);
	}

	@Override
	public List<ChatVO> selectChatmsgList(int r_num) {
		// 선택된 채팅방 내용 가져오기
		return dao.selectChatmsgList(r_num);
	}
	
	
}
