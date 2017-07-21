package kr.co.bit.admin.vo;

public class HouseBlindVO {
	private int no;
	private int houseNo;
	private int userNo;
	
	private String regDate;

	public HouseBlindVO() {
	}

	public HouseBlindVO(int houseNo, int userNo) {
		this.houseNo = houseNo;
		this.userNo = userNo;
	}

	public HouseBlindVO(int no, int houseNo, int userNo, String regDate) {
		this.no = no;
		this.houseNo = houseNo;
		this.userNo = userNo;
		this.regDate = regDate;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "HouseBlindVO [no=" + no + ", houseNo=" + houseNo + ", userNo=" + userNo + ", regDate=" + regDate + "]";
	}	
}
