package com.team4.localer.vo;

public class ItemReviewPageVO {
	private int pageNum=1;// 현재 페이지
	private int onePageNum=5;// 한페이지당 페이지 번호 수 
	private int onePageRecord=4;// 한페이지당 레코드수	

	private int totalRecord;// 총레코드수
	private int totalPage;// 마지막 페이지, 총페이지수
	private int startPageNum=1;// 시작페이지
	
	private int lastPageRecord=4;// 마지막 페이지의 남은 레코드수

	private int i_num;
	
	
	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		//시작페이지 번호를 계산
		startPageNum = ((pageNum-1)/onePageNum*onePageNum)+1;
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
		
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
		//마지막 페이지 레코드수
		if(totalRecord%onePageRecord==0) {
			lastPageRecord = onePageRecord; // 4개의 게시물
		}else {
			lastPageRecord = totalRecord%onePageRecord; // 남은 레코드수
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
	
	
	
	
}
