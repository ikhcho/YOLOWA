package kr.co.bit.data.vo;

import java.sql.Date;

public class CountOfMonthVO {
	private int no;
	private String resStart;
	private int count;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getResStart() {
		return resStart;
	}

	public void setResStart(String resStart) {
		this.resStart = resStart;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "{\"resStart\" : \"" + resStart + "\", \"count\" : " + count + "}";
	}
	
}
