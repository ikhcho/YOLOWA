package kr.co.bit.data.vo;

public class DataVO {
	private int rank;
	private String houseName;
	private String roomName;
	private int totalPersonCnt;
	private int totalPrice;
	private int totalProfit;
	private int totalCnt;
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
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
	public int getTotalPersonCnt() {
		return totalPersonCnt;
	}
	public void setTotalPersonCnt(int totalPersonCnt) {
		this.totalPersonCnt = totalPersonCnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getTotalProfit() {
		return totalProfit;
	}
	public void setTotalProfit(int totalProfit) {
		this.totalProfit = totalProfit;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	@Override
	public String toString() {
		return "DataVO [houseName=" + houseName + ", roomName=" + roomName + ", totalPersonCnt=" + totalPersonCnt
				+ ", totalPrice=" + totalPrice + ", totalProfit=" + totalProfit + ", totalCnt=" + totalCnt + "]";
	}
	
}
