package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.ChatVO;

public interface SideBarDAO {
	
	//채팅방 리스트 불러오기
	public List<ChatVO> selectChatList(String userid);
	
}
