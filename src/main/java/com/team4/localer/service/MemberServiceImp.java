package com.team4.localer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.MemberDAO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

@Service
public class MemberServiceImp implements MemberService {
	@Inject
	MemberDAO dao;
	
	@Override
	public MemberVO memLogin(String userid, String userpwd) {
		//로그인
		return dao.memLogin(userid, userpwd);
	}

	@Override
	public void logCount(String userid, String loc_gu) {
		// 로그인 카운트
		System.out.println("dao >> > > > " +userid+"//////"+loc_gu);
		dao.logCount(userid, loc_gu);
	}
	
	@Override
	public String searchId(MemberVO vo) {
		// 아이디 찾기
		return dao.searchId(vo);
	}
	
	@Override
	public String searchPwd(MemberVO vo) {
		// 비밀번호 찾기
		return dao.searchPwd(vo);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		//회원가입
		return dao.insertMember(vo);
	}

	@Override
	public int insertEventbonus(String userid) {
		//신규회원 이벤트
		return dao.insertEventbonus(userid);
	}

	@Override
	public int updateMember(MemberVO vo) {
		// 일반회원정보 수정
		return dao.updateMember(vo);
	}
	
	@Override
	public String sellerPwdDoubleCheck(String userid, String userpwd) {
		//셀러회원가입 비밀번호 재확인
		return dao.sellerPwdDoubleCheck(userid, userpwd);
	}

	@Override
	public int insertSeller(SellerVO vo) {
		//셀러 회원가입
		return dao.insertSeller(vo);
	}
	
	@Override
	public int updateMemStatus(String userid) {
		// 셀러 회원가입 후 > 회원상태 업데이트
		return dao.updateMemStatus(userid);
	}
	
	@Override
	public SellerVO selectSeller(String userid) {
		// 셀러회원 정보 수정
		return dao.selectSeller(userid);
	}

	@Override
	public int updateSeller(SellerVO vo) {
		// 셀러회원 정보 수정 확인
		return dao.updateSeller(vo);
	}

	@Override
	public int updateSellerStatus(String userid) {
		// 셀러회원 상태 업데이트
		return dao.updateSellerStatus(userid);
	}
	
	@Override
	public int updateDelseller(String userid) {
		// 셀러회원 탈퇴
		return dao.updateDelseller(userid);
	}
	
	@Override
	public int updateDelsellerToMem(String userid) {
		// 탈퇴한 셀러회원 일반회원으로 변경
		return dao.updateDelsellerToMem(userid);
	}

	@Override
	public String idDoubleCheck(String userid) {
		//아이디 중복확인
		return dao.idDoubleCheck(userid);
	}

	@Override
	public String nickNameDoubleCheck(String mem_nick) {
		//닉네입 중복확인
		return dao.nickNameDoubleCheck(mem_nick);
	}

	@Override
	public int memPostCount(String userid) {
		//회원 포스트 카운트
		return dao.memPostCount(userid);
	}

	@Override
	public int deleteMember(String userid) {
		// 회원 탈퇴
		return dao.deleteMember(userid);
	}

	@Override
	public int insertDelMember(MemberVO vo) {
		// 회원 탈퇴 시, 상태 업데이트
		return dao.insertDelMember(vo);
	}

	@Override
	public int checkMemEmail(String whichpage, String mem_email) {
		//이메일 중복확인 
		return dao.checkMemEmail(whichpage, mem_email);
	}

	@Override
	public MemberVO userDetailFind(String userid) {
		//유저의 정보를 뺴옴
		return dao.userDetailFind(userid);
	}

}
