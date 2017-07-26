package kr.co.bit.reservation.vo;

import java.sql.Date;

public class MyResVO {
	private int no;
	private int houseNo;
	private String houseName;
	private String addr;
	private String tel;
	private String photo;
	private int roomNo;
	private String roomName;
	private int userNo;
	private Date resStart;
	private Date resEnd;
	private int personCnt;
	private int totalPrice;
	private String regDate;
	public MyResVO() {
		super();
		// TODO Auto-generated constructor stub
	}
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
	public String getHouseName() {
		return houseName;
	}
	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "MyResVO [no=" + no + ", houseNo=" + houseNo + ", houseName=" + houseName + ", addr=" + addr + ", tel="
				+ tel + ", photo=" + photo + ", roomNo=" + roomNo + ", roomName=" + roomName + ", userNo=" + userNo
				+ ", resStart=" + resStart + ", resEnd=" + resEnd + ", personCnt=" + personCnt + ", totalPrice="
				+ totalPrice + ", regDate=" + regDate + "]";
	}
}
