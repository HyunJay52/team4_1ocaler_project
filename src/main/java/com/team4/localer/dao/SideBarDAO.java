package com.team4.localer.dao;

import java.util.List;

import com.team4.localer.vo.ChatVO;

public interface SideBarDAO {
	
	//채팅방 리스트 불러오기
	public List<ChatVO> selectChatList(String userid);
	
	//선택된 채팅방 번호 내용 가져오기
	public int selectChatroomNum(String chatRoomName);
	
	//선택된 채팅방 내용 가져오기
	public List<ChatVO> selectChatmsgList(int r_num);
}
