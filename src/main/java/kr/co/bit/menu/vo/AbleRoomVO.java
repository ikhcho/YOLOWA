package kr.co.bit.menu.vo;

import java.sql.Date;

public class AbleRoomVO {
	private int houseNo;
	private int RoomNo;
	private Date resDate;
	private int able;
	public AbleRoomVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getHouseNo() {
		return houseNo;
	}
	public void setHouseNo(int houseNo) {
		this.houseNo = houseNo;
	}
	public int getRoomNo() {
		return RoomNo;
	}
	public void setRoomNo(int roomNo) {
		RoomNo = roomNo;
	}
	public Date getResDate() {
		return resDate;
	}
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	public int getAble() {
		return able;
	}
	public void setAble(int able) {
		this.able = able;
	}
	@Override
	public String toString() {
		return "AbleRoomVO [houseNo=" + houseNo + ", RoomNo=" + RoomNo + ", resDate=" + resDate + ", able=" + able
				+ "]";
	}
	
}
