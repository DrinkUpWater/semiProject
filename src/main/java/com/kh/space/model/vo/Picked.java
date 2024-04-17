package com.kh.space.model.vo;

import java.sql.Date;

public class Picked {
	private int pickedNo;
	private Date pickedDate;
	private int userNo;
	private int spaceNo;
	
	public Picked() {
		
	}

	public Picked(int pickedNo, Date pickedDate, int userNo, int spaceNo) {
		super();
		this.pickedNo = pickedNo;
		this.pickedDate = pickedDate;
		this.userNo = userNo;
		this.spaceNo = spaceNo;
	}

	public int getPickedNo() {
		return pickedNo;
	}

	public void setPickedNo(int pickedNo) {
		this.pickedNo = pickedNo;
	}

	public Date getPickedDate() {
		return pickedDate;
	}

	public void setPickedDate(Date pickedDate) {
		this.pickedDate = pickedDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	@Override
	public String toString() {
		return "Picked [pickedNo=" + pickedNo + ", pickedDate=" + pickedDate + ", userNo=" + userNo + ", spaceNo="
				+ spaceNo + "]";
	}

	
	
	
	
	
}
