package kr.co.bit.admin.vo;

public class ApproveVO {
	private int no;
	private int userNo;
	private String approveState;
	private String approveKey;	
	private String regDate;

	public ApproveVO() {
	}

	public ApproveVO(int userNo, String approveKey) {
		this.userNo = userNo;
		this.approveKey = approveKey;
	}

	public ApproveVO(int no, int userNo, String approveState, String approveKey, String regDate) {
		this.no = no;
		this.userNo = userNo;
		this.approveState = approveState;
		this.approveKey = approveKey;
		this.regDate = regDate;
	}

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

	public String getApproveState() {
		return approveState;
	}

	public void setApproveState(String approveState) {
		this.approveState = approveState;
	}

	public String getApproveKey() {
		return approveKey;
	}

	public void setApproveKey(String approveKey) {
		this.approveKey = approveKey;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ApproveVO [no=" + no + ", userNo=" + userNo + ", approveState=" + approveState + ", approveKey="
				+ approveKey + ", regDate=" + regDate + "]";
	}
}
