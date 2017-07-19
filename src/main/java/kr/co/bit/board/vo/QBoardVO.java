package kr.co.bit.board.vo;

import java.sql.Date;

public class QBoardVO {

	private int no;
	private int house_no;
	private int user_no;
	private String question;
	private String answer;
	private String open_state;
	private Date reg_date;
	public QBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QBoardVO(int no, int house_no, int user_no, String question, String answer, String open_state,
			Date reg_date) {
		super();
		this.no = no;
		this.house_no = house_no;
		this.user_no = user_no;
		this.question = question;
		this.answer = answer;
		this.open_state = open_state;
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
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getOpen_state() {
		return open_state;
	}
	public void setOpen_state(String open_state) {
		this.open_state = open_state;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "QABoardVO [no=" + no + ", house_no=" + house_no + ", user_no=" + user_no + ", question=" + question
				+ ", answer=" + answer + ", open_state=" + open_state + ", reg_date=" + reg_date + "]";
	}
	
	
	
}
