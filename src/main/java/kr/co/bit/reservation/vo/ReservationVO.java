package kr.co.bit.reservation.vo;

import java.sql.Date;

public class ReservationVO {
	private int no;
	private int houseNo;
	private int roomNo;
	private int userNo;
	private Date resStart;
	private Date resEnd;
	private int personCnt;
	private int totalPrice;
	private String content;
	private String regDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHouseNo() {
		return houseNo;
	}
	public void setHouseNo(int houseNo) {
		this.houseNo = houseNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getResStart() {
		return resStart;
	}
	public void setResStart(Date resStart) {
		this.resStart = resStart;
	}
	public Date getResEnd() {
		return resEnd;
	}
	public void setResEnd(Date resEnd) {
		this.resEnd = resEnd;
	}
	public int getPersonCnt() {
		return personCnt;
	}
	public void setPersonCnt(int personCnt) {
		this.personCnt = personCnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ReservationVO [no=" + no + ", houseNo=" + houseNo + ", roomNo=" + roomNo + ", userNo=" + userNo
				+ ", resStart=" + resStart + ", resEnd=" + resEnd + ", personCnt=" + personCnt + ", totalPrice="
				+ totalPrice + ", content=" + content + ", regDate=" + regDate + "]";
	}
	
	
}
