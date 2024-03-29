package com.team4.localer.vo;

public class AdminPageVO {
	private int pageNum=1;//현재페이지
	private int onePageNum=5;//한페이지당 번호수
	private int onePageRecord=15;//한페이지당 레코드 수
	
	private int totalRecord;//총 레코드 수
	private int totalPage;//총 페이지 수 (마지막 페이지
	private int startPageNum=1;//시작페이지
	
	private int lastPageRecord=15;//마지막 페이지에 남은 레코드 수
	
	private String searchKey="";//검색키
	private String searchWord="";//검색어
	
	private String cate;//검색 카테고리 
	private String num;//카테고리 num;
	private String month;//
	private String userid;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		//시작페이지 번호를 계산
		startPageNum = ((pageNum-1)/onePageNum)*onePageNum+1;
	}
	public int getOnePageNum() {
		return onePageNum;
	}
	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//총 레코드 수를 이용하여 총 페이지 수를 구하기
		//총 레코드수 나누기 한페이지에 보여질 레코드 수 (실수)->올림->정수화->총페이지수
		totalPage =(int)Math.ceil(totalRecord/(double)onePageRecord);
		//마지막 페이지에 남은 레코드 수
		if(totalRecord%onePageRecord==0) {//나머지가 0 이면 없음
			lastPageRecord = onePageRecord;
		}else {//남은 레코드 수가 있으면
			//마지막 페이지에 레코드수는 남아있는 레코드의 수 만큼
			lastPageRecord = totalRecord%onePageRecord;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
}
