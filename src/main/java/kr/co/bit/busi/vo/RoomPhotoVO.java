package kr.co.bit.busi.vo;

import java.sql.Date;

public class RoomPhotoVO {
	private int no;
	private int roomNo;
	private String photo;
	public RoomPhotoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "RoomPhotoVO [no=" + no + ", roomNo=" + roomNo + ", photo=" + photo + "]";
	}

	
}
