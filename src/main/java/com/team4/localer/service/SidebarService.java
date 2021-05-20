package com.team4.localer.service;

import java.util.List;

import com.team4.localer.vo.ChatVO;

public interface SidebarService {

	//채팅방 리스트 불러오기
	public List<ChatVO> selectChatList(String userid);
}
