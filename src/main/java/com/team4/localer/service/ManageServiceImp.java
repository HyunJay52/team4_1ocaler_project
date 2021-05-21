package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.team4.localer.dao.ManageDAO;
import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.AdminspendVO;
import com.team4.localer.vo.AdminstatisVO;
import com.team4.localer.vo.BoardVO;
import com.team4.localer.vo.GroupVO;
import com.team4.localer.vo.MemShareVO;
import com.team4.localer.vo.Mem_statisVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;
import com.team4.localer.vo.SellitemVO;

@Service
public class ManageServiceImp implements ManageService {
	@Inject
	ManageDAO manadao;


	@Override
	public MemberVO memOneSelect(String userid) {
		return manadao.memOneSelect(userid);
	}

	@Override
	public int memInfoCount(String userid, String table) {
		return manadao.memInfoCount(userid, table);
	}

	@Override
	public int memberManageUpdate(String userid, String cate, int status) {
		return manadao.memberManageUpdate(userid, cate, status);
	}

	@Override
	public List<SellerVO> sellerAllSelect(AdminPageVO pageVO) {
		return manadao.sellerAllSelect(pageVO);
	}

	@Override
	public List<MemberVO> memberAllSelect(AdminPageVO pageVO) {
		return manadao.memberAllSelect(pageVO);
	}

	@Override
	public List<AdminstatisVO> sellerDetailInfo(int sel_num) {
		return manadao.sellerDetailInfo(sel_num);
	}

	@Override
	public List<MemShareVO> memShareAllSelect(AdminPageVO pageVO) {
		return manadao.memShareAllSelect(pageVO);
	}

	@Override
	public List<SellitemVO> sellerBoardSelect(AdminPageVO pageVO) {
		return manadao.sellerBoardSelect(pageVO);
	}

	@Override
	public int selManageDel(int num, String cate, String numName) {
		return manadao.selManageDel(num, cate, numName);
	}

	@Override
	public List<GroupVO> boardManageAllSelect(AdminPageVO pageVO) {
		return manadao.boardManageAllSelect(pageVO);
	}

	@Override
	public List<BoardVO> cumuManageListSearch(AdminPageVO pageVO) {
		return manadao.cumuManageListSearch(pageVO);
	}

	@Override
	public AdminstatisVO selManageStatis() {
		return manadao.selManageStatis();
	}

	@Override
	public AdminstatisVO boardManageStatis() {
		return manadao.boardManageStatis();
	}

	@Override
	public Mem_statisVO loginNum(Mem_statisVO statisVO) {
		return manadao.loginNum(statisVO);
	}

	@Override
	public Mem_statisVO newmem(Mem_statisVO statisVO) {
		return manadao.newmem(statisVO);
	}

	@Override
	public Mem_statisVO guLoginCount(Mem_statisVO statisVO) {
		return manadao.guLoginCount(statisVO);
	}

	@Override
	public Mem_statisVO subCount(Mem_statisVO statisVO) {
		return manadao.subCount(statisVO);
	}

	@Override
	public Mem_statisVO boardStatis(Mem_statisVO statisVO) {
		return manadao.boardStatis(statisVO);
	}

	@Override
	public AdminspendVO memspend(Mem_statisVO statisVO) {
		return manadao.memspend(statisVO);
	}

	@Override
	public AdminspendVO memspendCnt(Mem_statisVO statisVO) {
		return manadao.memspendCnt(statisVO);
	}

	@Override
	public List<AdminspendVO> mempsendList(AdminPageVO pageVO) {
		return manadao.mempsendList(pageVO);
	}

	@Override
	public List<AdminspendVO> mempsendmodal1List(String userid) {
		return manadao.mempsendmodal1List(userid);
	}

	@Override
	public List<AdminspendVO> mempsendmodal2List(String userid) {
		return manadao.mempsendmodal2List(userid);
	}

	@Override
	public AdminspendVO selspendtotal(Mem_statisVO statisVO) {
		return manadao.selspendtotal(statisVO);
	}

	@Override
	public AdminspendVO selspendmonth(Mem_statisVO statisVO) {
		return manadao.selspendmonth(statisVO);
	}

	@Override
	public AdminspendVO countboard(Mem_statisVO statisVO) {
		return manadao.countboard(statisVO);
	}

	@Override
	public AdminspendVO countspend(Mem_statisVO statisVO) {
		return manadao.countspend(statisVO);
	}

	@Override
	public List<AdminspendVO> selspendList(AdminPageVO pageVO) {
		return manadao.selspendList(pageVO);
	}

	@Override
	public List<AdminspendVO> selpsendmodalList(int num) {
		return manadao.selpsendmodalList(num);
	}

	@Override
	public AdminstatisVO statismem(String month) {
		return manadao.statismem(month);
	}

	@Override
	public Mem_statisVO guGroupCount(Mem_statisVO statisVO) {
		return manadao.guGroupCount(statisVO);
	}

	@Override
	public Mem_statisVO cateCount(Mem_statisVO statisVO) {
		return manadao.cateCount(statisVO);
	}




	
}
