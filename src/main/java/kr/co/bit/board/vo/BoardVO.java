package kr.co.bit.board.vo;

import java.sql.Date;

public class BoardVO {
	private int no;
	private int house_no;
	private int user_no;
	private String content;
	private int score;
	private String blind_state;
	private Date reg_date;
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardVO(int no, int house_no, int user_no, String content, int score, String blind_state, Date reg_date) {
		super();
		this.no = no;
		this.house_no = house_no;
		this.user_no = user_no;
		this.content = content;
		this.score = score;
		this.blind_state = blind_state;
		this.reg_date = reg_date;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getBlind_state() {
		return blind_state;
	}
	public void setBlind_state(String blind_state) {
		this.blind_state = blind_state;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", house_no=" + house_no + ", user_no=" + user_no + ", content=" + content
				+ ", score=" + score + ", blind_state=" + blind_state + ", reg_date=" + reg_date + "]";
	}
	
	
}

