package kr.co.bit.user.vo;

public class HomeListVO {
	private int no;
	private String houseName;
	private String addr;
	private String bbq;
	private String pool;
	private String parking;
	private String singing;
	private String football;
	private String pickup;
	private String photo;
	private String blindState;
	private int price;
	
	public HomeListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public HomeListVO(int no, String houseName, String addr, String bbq, String pool, String parking, String singing,
			String football, String pickup, String photo, String blindState, int price) {
		super();
		this.no = no;
		this.houseName = houseName;
		this.addr = addr;
		this.bbq = bbq;
		this.pool = pool;
		this.parking = parking;
		this.singing = singing;
		this.football = football;
		this.pickup = pickup;
		this.photo = photo;
		this.blindState = blindState;
		this.price = price;
	}

	
	
}
