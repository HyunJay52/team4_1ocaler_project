package com.team4.localer.service;

import java.util.List;

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
import com.team4.localer.vo.SellitemVO;

public interface MyInfoService {
   //내 정보 조회
   public MemberVO setMyinfo(String userid);
   
   //내 정보 비밀번호 확인
   public MemberVO goMyinfopage(MemberVO vo);
   
   //포인트 조회
   public String joinPoint(String userid);
   
   //포인트 충전
   public int pointCharge(Cha_pVO vo);
   
   //포인트 전체 사용내역 조회
   public List<Cha_pVO> allPointSelect(MyinfoPageVO pVO);
   
   //유저의 총 포인트 사용횟수 조회
   public String pointCount(MyinfoPageVO pVO);

   //유저의 특정 게시글 Count 조회
   public int myCount(MyinfoPageVO vo);
   
   //유저의 회원간 거래 게시글 리스트 조회
   public List<MemShareVO> selectMyShare(MyinfoPageVO vo);
   
   //참여신청 회원 리스트 조회
   public List<JoinUsVO> selectJoinUs(int num);
   
   //유저가 참여한 직거래 내역 조회
   public List<OrderVO> selectOrder(MyinfoPageVO vo);
   
   //리뷰등록
   public int writeReview(ItemReviewVO vo);
   
   //리뷰작성시 joinus 상태 업데이트
   public int updateReviewStatus(int j_num);
   
   //참여신청 수락시 상태 업데이트
   public int updateJoinStatus(int j_num);
   
   //참여신청 취소처리 업데이트
   public int updateJoinCancel(int j_num);
   
   //거래글의 리뷰작성이 완료된 카운트 조회
   public MyinfoJoinUsVO selectReviewCount(MyinfoPageVO vo);
   
   //특정 게시글의 나의 리뷰 조회
   public ItemReviewVO selectMyReview(ItemReviewVO vo);
   
   //유저의 종류별 게시글(좋아요 포함) 카운트 횟수 조회
   public MyinfoCountVO selectMyCount(String userid);
   
   //직거래 글에 대한 회원의 리뷰가 있는지 조회
   public int selectMyReviewCount(String userid, int num);
   
   //내가 참여한 글 n개 조회
   public List<MyinfoDealVO> selectMyJoinList(MyinfoPageVO vo);
   
   //내 모집글에 참여한 리스트 5개 조회
   public List<MyinfoDealVO> selectMyShareJoinList(String userid);

	//==통계부분====
	public OrderVO statisTotal(String userid,int cate,String month);//미확정 개수, 금액
	//통계list
	public List<OrderVO> statisList(String userid,String month);

	//==판매관리 부분===
	//레코드 개수 
	public int managementCount(AdminPageVO pageVO);
	//판매관리 리스트 
	public List<OrderVO> manageList(AdminPageVO pageVO);
	
	

	//리뷰가능한 상품리스트 조회
	public List<OrderVO> selectItemReviewList(MyinfoPageVO vo);
	
	//카테고리별 내 모집글 리뷰 조회
	public List<ItemReviewVO> selectMyReviewList(MyinfoPageVO vo);
	
	//리뷰가능한 상품리스트 카운트
	public int selectItemReviewListCount(MyinfoPageVO vo);	
	
	//카테고리별 내 모집글 리뷰 카운트
	public int selectMyReviewListCount(MyinfoPageVO vo);
	
	//리뷰수정
	public int reviewUpdate(ItemReviewVO vo);
	
	//내가 작성한 작성글, 댓글, QnA 불러오기
	public List<MyinfoBoardVO> selectMyBoard(MyinfoPageVO vo);
		
	//내가 작성한 작성글, 댓글, QnA Count
	public int selectMyBoardCount(MyinfoPageVO vo);

	//특정 QnA 불러오기
	public QnAVO setQnA(int q_num, String userid, String searchKey);
	
	//QnA 답변 쓰기
	public int QnAAnswerWrite(QnAVO vo);
	
	
	//상품관리 리스트 조회
	public List<SellitemVO> selectProductList(MyinfoPageVO vo);
	
	//상품관리 리스트 카운트
	public int selectProductListCount(MyinfoPageVO vo);
		
	//상품관리 상품 상태 변경
	public int updateProductStatus(int i_num);
	
	//결제관리 리스트 불러오기
	public List<OrderVO> selectSalesManagement(MyinfoPageVO vo);
	
	//결제관리 리스트 카운트
	public int selectSaleManagementCounut(MyinfoPageVO vo);
		
	// QnA 글쓰기 (21-05-24 WOW)
	public int QnaQuestionInsert(QnAVO vo);
	
	//상품관리 종료일 변경
	public int updateProductPeriod(int i_num, String date);
	
	//상품관리 카운트 조회(총 게시물, 판매 중, 판매 종료 등)
	public SellitemVO sellerCount(String userid);
	
	//결제관리 카운트 조회
	public OrderVO orderCount(String userid);
	
	//게시글 또는 댓글지우기
	public int deleteBoard(String kategorie, int[] num, String userid);
	
// 내정보 메인용 서비스 (hj, 2021-05-21)
	//참여정보 
	public List<JoinUsVO> selectWaitingJoinList(String userid);
	//qna 리스트 
	public List<QnAVO> selectAllmyqna(String userid);
	
}

