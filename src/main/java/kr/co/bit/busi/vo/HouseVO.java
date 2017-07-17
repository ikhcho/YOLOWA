package kr.co.bit.busi.vo;

import java.sql.Date;

public class HouseVO {
	private int no;
	private int userNo;
	private String houseName;
	private String addr;
	private String tel;
	private int roomCnt;
	private String bbq;
	private String pool;
	private String parking;
	private String singing;
	private String football;
	private String pickup;
	private String homepage;
	private String hotStart;
	private String hotEnd;
	private String photo;
	private String blindState;
	private String checkin;
	private String checkout;
	private String content;
	private Date regDate;
	public HouseVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	public int getRoomCnt() {
		return roomCnt;
	}
	public void setRoomCnt(int roomCnt) {
		this.roomCnt = roomCnt;
	}
	public String getBbq() {
		return bbq;
	}
	public void setBbq(String bbq) {
		this.bbq = bbq;
	}
	public String getPool() {
		return pool;
	}
	public void setPool(String pool) {
		this.pool = pool;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getSinging() {
		return singing;
	}
	public void setSinging(String singing) {
		this.singing = singing;
	}
	public String getFootball() {
		return football;
	}
	public void setFootball(String football) {
		this.football = football;
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getHotStart() {
		return hotStart;
	}
	public void setHotStart(String hotStart) {
		this.hotStart = hotStart;
	}
	public String getHotEnd() {
		return hotEnd;
	}
	public void setHotEnd(String hotEnd) {
		this.hotEnd = hotEnd;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getBlindState() {
		return blindState;
	}
	public void setBlindState(String blindState) {
		this.blindState = blindState;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
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
		return "HouseVO [no=" + no + ", userNo=" + userNo + ", houseName=" + houseName + ", addr=" + addr + ", tel="
				+ tel + ", roomCnt=" + roomCnt + ", bbq=" + bbq + ", pool=" + pool + ", parking=" + parking
				+ ", singing=" + singing + ", football=" + football + ", pickup=" + pickup + ", homepage=" + homepage
				+ ", hotStart=" + hotStart + ", hotEnd=" + hotEnd + ", photo=" + photo + ", blindState=" + blindState
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", content=" + content + ", regDate=" + regDate
				+ "]";
	}
}
