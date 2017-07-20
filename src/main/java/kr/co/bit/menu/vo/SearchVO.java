package kr.co.bit.menu.vo;

import java.sql.Date;

public class SearchVO {
	private Date resDate;
	private String country;
	private String state;
	public SearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Date getResDate() {
		return resDate;
	}
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "SearchVO [resDate=" + resDate + ", country=" + country + ", state=" + state + "]";
	}
	
	
}
