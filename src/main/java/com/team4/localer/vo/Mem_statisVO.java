package com.team4.localer.vo;

import java.util.Calendar;

public class Mem_statisVO {
	//해당월
	private int month;
	private String month1;//3
	private String month2;//4
	private String month3;//5
	private int last1;//3해당월의 마지막날
	private int last2;//4
	private int last3;//5
	
	private int loginmem1;//신규회원수
	private int loginmem2;
	private int loginmem3;
	
	private int totalmem1;//3월까지 누적회원수
	private int totalmem2;//4월
	private int totalmem3;//5월
	

	
	public int getTotalmem1() {
		return totalmem1;
	}
	public void setTotalmem1(int totalmem1) {
		this.totalmem1 = totalmem1;
	}
	public int getTotalmem2() {
		return totalmem2;
	}
	public void setTotalmem2(int totalmem2) {
		this.totalmem2 = totalmem2;
	}
	public int getTotalmem3() {
		return totalmem3;
	}
	public void setTotalmem3(int totalmem3) {
		this.totalmem3 = totalmem3;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public String getMonth1() {
		if(month-2>=10) {
			month1=month-2+"";
		}else {
			month1="0"+(month-2);
		}
		return month1;
	}
	public void setMonth1(String month1) {
		this.month1 = month1;
	}
	public String getMonth2() {
		if(month-1>=10) {
			month2=month-2+"";
		}else {
			month2="0"+(month-1);
		}
		return month2;
	}
	public void setMonth2(String month2) {
		this.month2 = month2;
	}
	public String getMonth3() {
		if(month>=10) {
			month3=month+"";
		}else {
			month3="0"+month;
		}
		return month3;
	}
	public void setMonth3(String month3) {
		this.month3 = month3;
	}
	Calendar cal = Calendar.getInstance();
	
	public int getLoginmem1() {
		return loginmem1;
	}
	public void setLoginmem1(int loginmem1) {
		this.loginmem1 = loginmem1;
	}
	public int getLoginmem2() {
		return loginmem2;
	}
	public void setLoginmem2(int loginmem2) {
		this.loginmem2 = loginmem2;
	}
	public int getLoginmem3() {
		return loginmem3;
	}
	public void setLoginmem3(int loginmem3) {
		this.loginmem3 = loginmem3;
	}
	public int getLast1() {
		cal.set(2021, month-3,1);//입력받은 월의 1일
		last1 = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		return last1;
	}
	public void setLast1(int last1) {
		this.last1 = last1;
	}
	public int getLast2() {
		cal.set(2021, month-2,1);//입력받은 월의 1일
		last2 = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		return last2;
	}
	public void setLast2(int last2) {
		this.last2 = last2;
	}
	public int getLast3() {
		cal.set(2021, month-1,1);//입력받은 월의 1일
		last3 = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		return last3;
	}
	public void setLast3(int last3) {
		this.last3 = last3;
	}
	private int gu1;
	private int gu2;
	private int gu3;
	private int gu4;
	private int gu5;
	private int gu6;
	private int gu7;
	private int gu8;
	private int gu9;
	private int gu10;
	private int gu11;
	private int gu12;
	private int gu13;
	private int gu14;
	private int gu15;
	private int gu16;
	private int gu17;
	private int gu18;
	private int gu19;
	private int gu20;
	private int gu21;
	private int gu22;
	private int gu23;
	private int gu24;
	private int gu25;



	public int getGu1() {
		return gu1;
	}
	public void setGu1(int gu1) {
		this.gu1 = gu1;
	}
	public int getGu2() {
		return gu2;
	}
	public void setGu2(int gu2) {
		this.gu2 = gu2;
	}
	public int getGu3() {
		return gu3;
	}
	public void setGu3(int gu3) {
		this.gu3 = gu3;
	}
	public int getGu4() {
		return gu4;
	}
	public void setGu4(int gu4) {
		this.gu4 = gu4;
	}
	public int getGu5() {
		return gu5;
	}
	public void setGu5(int gu5) {
		this.gu5 = gu5;
	}
	public int getGu6() {
		return gu6;
	}
	public void setGu6(int gu6) {
		this.gu6 = gu6;
	}
	public int getGu7() {
		return gu7;
	}
	public void setGu7(int gu7) {
		this.gu7 = gu7;
	}
	public int getGu8() {
		return gu8;
	}
	public void setGu8(int gu8) {
		this.gu8 = gu8;
	}
	public int getGu9() {
		return gu9;
	}
	public void setGu9(int gu9) {
		this.gu9 = gu9;
	}
	public int getGu10() {
		return gu10;
	}
	public void setGu10(int gu10) {
		this.gu10 = gu10;
	}
	public int getGu11() {
		return gu11;
	}
	public void setGu11(int gu11) {
		this.gu11 = gu11;
	}
	public int getGu12() {
		return gu12;
	}
	public void setGu12(int gu12) {
		this.gu12 = gu12;
	}
	public int getGu13() {
		return gu13;
	}
	public void setGu13(int gu13) {
		this.gu13 = gu13;
	}
	public int getGu14() {
		return gu14;
	}
	public void setGu14(int gu14) {
		this.gu14 = gu14;
	}
	public int getGu15() {
		return gu15;
	}
	public void setGu15(int gu15) {
		this.gu15 = gu15;
	}
	public int getGu16() {
		return gu16;
	}
	public void setGu16(int gu16) {
		this.gu16 = gu16;
	}
	public int getGu17() {
		return gu17;
	}
	public void setGu17(int gu17) {
		this.gu17 = gu17;
	}
	public int getGu18() {
		return gu18;
	}
	public void setGu18(int gu18) {
		this.gu18 = gu18;
	}
	public int getGu19() {
		return gu19;
	}
	public void setGu19(int gu19) {
		this.gu19 = gu19;
	}
	public int getGu20() {
		return gu20;
	}
	public void setGu20(int gu20) {
		this.gu20 = gu20;
	}
	public int getGu21() {
		return gu21;
	}
	public void setGu21(int gu21) {
		this.gu21 = gu21;
	}
	public int getGu22() {
		return gu22;
	}
	public void setGu22(int gu22) {
		this.gu22 = gu22;
	}
	public int getGu23() {
		return gu23;
	}
	public void setGu23(int gu23) {
		this.gu23 = gu23;
	}
	public int getGu24() {
		return gu24;
	}
	public void setGu24(int gu24) {
		this.gu24 = gu24;
	}
	public int getGu25() {
		return gu25;
	}
	public void setGu25(int gu25) {
		this.gu25 = gu25;
	}
	
}
