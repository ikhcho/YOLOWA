package kr.co.bit.busi.vo;

import java.sql.Date;

public class RoomVO {
	private int no;
	private int houseNo;
	private String roomName;
	private String style;
	private String roomSize;
	private int personMin;
	private int personMax;
	private int hWeekPrice;
	private int hWeekendPrice;
	private int nWeekPrice;
	private int nWeekendPrice;
	private int overPrice;
	private String content;
	private Date regDate;
	public RoomVO() {
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}
	public int getPersonMin() {
		return personMin;
	}
	public void setPersonMin(int personMin) {
		this.personMin = personMin;
	}
	public int getPersonMax() {
		return personMax;
	}
	public void setPersonMax(int personMax) {
		this.personMax = personMax;
	}
	public int gethWeekPrice() {
		return hWeekPrice;
	}
	public void sethWeekPrice(int hWeekPrice) {
		this.hWeekPrice = hWeekPrice;
	}
	public int gethWeekendPrice() {
		return hWeekendPrice;
	}
	public void sethWeekendPrice(int hWeekendPrice) {
		this.hWeekendPrice = hWeekendPrice;
	}
	public int getnWeekPrice() {
		return nWeekPrice;
	}
	public void setnWeekPrice(int nWeekPrice) {
		this.nWeekPrice = nWeekPrice;
	}
	public int getnWeekendPrice() {
		return nWeekendPrice;
	}
	public void setnWeekendPrice(int nWeekendPrice) {
		this.nWeekendPrice = nWeekendPrice;
	}
	public int getOverPrice() {
		return overPrice;
	}
	public void setOverPrice(int overPrice) {
		this.overPrice = overPrice;
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
		return "RoomVO [no=" + no + ", houseNo=" + houseNo + ", roomName=" + roomName + ", style=" + style + ", roomSize="
				+ roomSize + ", personMin=" + personMin + ", personMax=" + personMax + ", hWeekPrice=" + hWeekPrice
				+ ", hWeekendPrice=" + hWeekendPrice + ", nWeekPrice=" + nWeekPrice + ", nWeekendPrice=" + nWeekendPrice
				+ ", overPrice=" + overPrice + ", content=" + content + ", regDate=" + regDate + "]";
	}


}
