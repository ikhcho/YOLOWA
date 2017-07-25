package kr.co.bit.data.vo;

import java.sql.Date;

public class CkReservationVO {
	private int no;
	private String houseName;
	private String roomName;
	private String userName;
	private String userTel;
	private Date resStart;
	private Date resEnd;
	private int personCnt;
	private int totalPrice;
	private String content;
	private Date regDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getHouseName() {
		return houseName;
	}
	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "CkReservationVO [no=" + no + ", houseName=" + houseName + ", roomName=" + roomName + ", userName="
				+ userName + ", userTel=" + userTel + ", resStart=" + resStart + ", resEnd=" + resEnd + ", personCnt="
				+ personCnt + ", totalPrice=" + totalPrice + ", content=" + content + ", regDate=" + regDate + "]";
	}
	
}
