package com.team4.localer.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.SidebarService;
import com.team4.localer.vo.ChatVO;

@Controller
public class sideBarController {
	
	@Inject
	SidebarService service;
	
	@RequestMapping("sidebar/searchResult")
	public ModelAndView sidebarSearchResul(String sideKey, String sideWord) {
		ModelAndView mav = new ModelAndView();
/*		카테고리 변수명 지정
		통합검색 : totalCate
		착한발견 : findCate
		동네직구 : townCate
		가치가장 : martCate
		한끼미식회 : eatCate
		우리동네 이야기 : localCate
		쓱싹레시피 : ssgCate
		자유자게 : freeCate	*/
		
		System.out.println("?????"+sideKey+sideWord); //카테고리별 화면 이동 
		
		if(sideKey.equals("totalCate")) {
			mav.addObject("sideWord", sideWord);
			
			mav.setViewName("sidebar/totalSearch");
		}
		return mav;
	}
	
	@RequestMapping("chatting/chatroomList")
	@ResponseBody
	public List<ChatVO> chatroomList(HttpSession ses){
		
		List<ChatVO> chatList = service.selectChatList((String)ses.getAttribute("logId"));
		
		return chatList;
	}
	
	@RequestMapping(value="chatting/chatprevMsg", method = RequestMethod.POST)
	@ResponseBody
	public List<ChatVO> chatprevMsg(HttpServletRequest req){
		String userid = req.getParameter("userid");
		String chatRoomName = req.getParameter("chatRoomName");
		//채팅방 검색 > 채팅방 번호 받아오기
		int r_num = service.selectChatroomNum(chatRoomName);
		System.out.println(r_num+" < < < < < < < < < < < < < < < < 채팅방 번호");
		//채팅방 번호로 대화 목록 가져오기
		List<ChatVO> msgList = service.selectChatmsgList(r_num);
		
		return msgList;
	}
}
