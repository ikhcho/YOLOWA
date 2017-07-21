package kr.co.bit.admin.vo;

public class CommentBlindVO {
	private int no;
	private int commentNo;
	private int userNo;
	
	private String regDate;

	public CommentBlindVO() {
	}

	public CommentBlindVO(int commentNo, int userNo) {
		this.commentNo = commentNo;
		this.userNo = userNo;
	}

	public CommentBlindVO(int no, int commentNo, int userNo, String regDate) {
		this.no = no;
		this.commentNo = commentNo;
		this.userNo = userNo;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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
		return "CommentBlindVO [no=" + no + ", commentNo=" + commentNo + ", userNo=" + userNo + ", regDate=" + regDate
				+ "]";
	}	
}
