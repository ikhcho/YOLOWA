package kr.co.bit.data.vo;

public class ScoreVO {
	private int rank;
	private String houseName;
	private double avgScore;
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
	public double getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}
	@Override
	public String toString() {
		return "ScoreVO [rank=" + rank + ", houseName=" + houseName + ", avgScore=" + avgScore + "]";
	}
	
}
