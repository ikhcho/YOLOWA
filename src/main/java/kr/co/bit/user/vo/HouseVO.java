package kr.co.bit.user.vo;

public class HouseVO {
	private int no;
	private int userNo;
	private String houseName;
	private String addr;
	private String tel;
	private int roomCnt;
	private char bbq;
	private char pool;
	private char parking;
	private char singing;
	private char football;
	private char pickup;
	private String homepage;
	private String hotStart;
	private String hotEnd;
	private String photo;
	private char blindState;
	private String checkin;
	private String checkout;
	private String content;	
	private String regDate;

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

	public char getBbq() {
		return bbq;
	}

	public void setBbq(char bbq) {
		this.bbq = bbq;
	}

	public char getPool() {
		return pool;
	}

	public void setPool(char pool) {
		this.pool = pool;
	}

	public char getParking() {
		return parking;
	}

	public void setParking(char parking) {
		this.parking = parking;
	}

	public char getSinging() {
		return singing;
	}

	public void setSinging(char singing) {
		this.singing = singing;
	}

	public char getFootball() {
		return football;
	}

	public void setFootball(char football) {
		this.football = football;
	}

	public char getPickup() {
		return pickup;
	}

	public void setPickup(char pickup) {
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

	public char getBlindState() {
		return blindState;
	}

	public void setBlindState(char blindState) {
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
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
