package com.team4.localer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team4.localer.dao.MyInfoDAO;
import com.team4.localer.vo.AdminPageVO;
import com.team4.localer.vo.Cha_pVO;
import com.team4.localer.vo.ItemReviewVO;
import com.team4.localer.vo.JoinUsVO;
import com.team4.localer.vo.MemShareVO;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.MyinfoBoardVO;
import com.team4.localer.vo.MyinfoCountVO;
import com.team4.localer.vo.MyinfoDealVO;
import com.team4.localer.vo.MyinfoJoinUsVO;
import com.team4.localer.vo.MyinfoPageVO;
import com.team4.localer.vo.OrderVO;
import com.team4.localer.vo.QnAVO;
import com.team4.localer.vo.SellerVO;

@Service
public class MyInfoServiceImp implements MyInfoService{
   @Inject
   MyInfoDAO dao;
   
   @Override
   public MemberVO setMyinfo(String userid) {

      return dao.setMyinfo(userid);
   }
   
   @Override
   public MemberVO goMyinfopage(MemberVO vo) {
      
      return dao.goMyinfopage(vo);
   }

	@Override
	public String joinPoint(String userid) {

		return dao.joinPoint(userid);
	}

	@Override
	public int pointCharge(Cha_pVO vo) {
		
		return dao.pointCharge(vo);
	}

	@Override
	public List<Cha_pVO> allPointSelect(MyinfoPageVO pVO) {

		return dao.allPointSelect(pVO);
	}

	@Override
	public String pointCount(MyinfoPageVO pVO) {
		
		return dao.pointCount(pVO);
	}

	@Override
	public int myCount(MyinfoPageVO vo) {

		return dao.myCount(vo);
	}

	@Override
	public List<MemShareVO> selectMyShare(MyinfoPageVO vo) {
		
		return dao.selectMyShare(vo);
	}

	@Override
	public List<JoinUsVO> selectJoinUs(int num) {
		
		return dao.selectJoinUs(num);
	}

	@Override
	public List<OrderVO> selectOrder(MyinfoPageVO vo) {
		
		return dao.selectOrder(vo);
	}

	@Override
	public int writeReview(ItemReviewVO vo) {
		
		return dao.writeReview(vo);
	}

	@Override
	public int updateReviewStatus(int j_num) {
		
		return dao.updateReviewStatus(j_num);
	}

	@Override
	public int updateJoinStatus(int j_num) {
		
		return dao.updateJoinStatus(j_num);
	}

	@Override
	public int updateJoinCancel(int j_num) {
		
		return dao.updateJoinCancel(j_num);
	}

	@Override
	public MyinfoJoinUsVO selectReviewCount(MyinfoPageVO vo) {
		
		return dao.selectReviewCount(vo);
	}

	@Override
	public ItemReviewVO selectMyReview(ItemReviewVO vo) {
		
		return dao.selectMyReview(vo);
	}

	@Override
	public MyinfoCountVO selectMyCount(String userid) {

		return dao.selectMyCount(userid);
	}

	@Override
	public int selectMyReviewCount(String userid, int num) {

		return dao.selectMyReviewCount(userid, num);
	}

	@Override
	public List<MyinfoDealVO> selectMyJoinList(MyinfoPageVO vo) {

		return dao.selectMyJoinList(vo);
	}

	@Override
	public List<MyinfoDealVO> selectMyShareJoinList(String userid) {
		
		return dao.selectMyShareJoinList(userid);
	}

	@Override
	public OrderVO statisTotal(String userid, int cate, String month) {
		return dao.statisTotal(userid, cate, month);
	}

	@Override
	public List<OrderVO> statisList(String userid, String month) {
		return dao.statisList(userid, month);
	}
	public List<OrderVO> selectItemReviewList(MyinfoPageVO vo) {

		return dao.selectItemReviewList(vo);
	}

	@Override
	public List<ItemReviewVO> selectMyReviewList(MyinfoPageVO vo) {

		return dao.selectMyReviewList(vo);
	}

	@Override
	public int selectMyReviewListCount(MyinfoPageVO vo) {
		
		return dao.selectMyReviewListCount(vo);
	}

	@Override
	public int reviewUpdate(ItemReviewVO vo) {
		
		return dao.reviewUpdate(vo);
	}

	@Override
	public int managementCount(AdminPageVO pageVO) {
		return dao.managementCount(pageVO);
	}

	@Override
	public List<OrderVO> manageList(AdminPageVO pageVO) {
		return dao.manageList(pageVO);
	}

	public List<MyinfoBoardVO> selectMyBoard(MyinfoPageVO vo) {
		return dao.selectMyBoard(vo);
	}

	@Override
	public int selectMyBoardCount(MyinfoPageVO vo) {
		
		return dao.selectMyBoardCount(vo);
	}

	@Override
	public QnAVO setQnA(int q_num, String userid) {

		return dao.setQnA(q_num, userid);
	}
	
	@Override
	public int QnAAnswerWrite(QnAVO vo) {
		
		return dao.QnAAnswerWrite(vo);
	}
	
//	QNA 글쓰기(WOW)
	@Override
	public int QnaQuestionInsert(QnAVO vo) {
		return dao.QnaQuestionInsert(vo);
	}

// 내정보 메인용 서비스 (hj, 2021-05-21)
	@Override
	public List<JoinUsVO> selectWaitingJoinList(String userid) {
		// 참여정보
		return dao.selectWaitingJoinList(userid);
	}

	@Override
	public List<QnAVO> selectAllmyqna(String userid) {
		// qna 가져오기
		return dao.selectAllmyqna(userid);
	}

	@Override
	public List<SellerVO> selectSelinfo(String userid) {
		// seller 메인 정보
		return dao.selectSelinfo(userid);
	}


}
