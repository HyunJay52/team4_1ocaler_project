package com.team4.localer.vo;

public class MyinfoPageVO {
	private String userid;
	private int nowNum;
	private int onePageRecord;
	private int onePageSize;
	private int startPage = 1;
	private int totalRecord;
	private int totalPage;
	private int lastPageRecord;
	
	private int rowNum1;
	private int rowNum2;
	
	private String searchDate;
	private String searchDate2;	
	private String searchKey;
	private String searchWord;
	private String kategorie;
	private String dateContent;
	
	private String searchKey2;
	
	
	
	public String getSearchKey2() {
		return searchKey2;
	}
	public void setSearchKey2(String searchKey2) {
		this.searchKey2 = searchKey2;
	}
	public String getDateContent() {
		return dateContent;
	}
	public void setDateContent(String dateContent) {
		this.dateContent = dateContent;
	}
	public String getKategorie() {
		return kategorie;
	}
	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}
	public String getSearchDate2() {
		return searchDate2;
	}
	public void setSearchDate2(String searchDate2) {
		this.searchDate2 = searchDate2;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
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
	
	
	public int getNowNum() {
		return nowNum;
	}
	public void setNowNum(int nowNum) {
		this.nowNum = nowNum;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getOnePageSize() {
		return onePageSize;
	}
	public void setOnePageSize(int onePageSize) {
		this.onePageSize = onePageSize;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int nowNum, int onePageSize) {
		this.startPage = ((nowNum - 1) / onePageSize*onePageSize)+1;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalRecord, int onePageRecord) {
		this.totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
	}
	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int totalRecord, int onePageRecord) {
		if(totalRecord % onePageRecord == 0) {
			lastPageRecord = onePageRecord;
		}else {	// 토탈 11 % 5 = 2.2
			lastPageRecord = totalRecord % onePageRecord;
		}
		System.out.println("lastPage="+lastPageRecord);
	}
	
	
	
	public int getRowNum1() {
		return rowNum1;
	}
	public void setRowNum1(int nowNum, int onePageRecord) {
		this.rowNum1 = nowNum*onePageRecord;
	}
	public int getRowNum2() {
		return rowNum2;
	}
	public void setRowNum2(int nowNum, int totalPage, int lastPageRecord, int onePageRecord) {
		if(nowNum == totalPage && lastPageRecord != 0) {
			this.rowNum2 = lastPageRecord;
		}else {
			this.rowNum2 = onePageRecord;			
		}
	}
	
	
	
}
