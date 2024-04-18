package com.kh.space.model.vo;

import java.sql.Date;

public class Reservation {
	private int reservationNo;
	private int headCount; //예약인원
	private int totalPrice;
	private int userNo;
	private int spaceNo;
	
	public Reservation() {
		super();
	}

	public Reservation(int reservationNo, int headCount, int totalPrice, int userNo, int spaceNo) {
		super();
		this.reservationNo = reservationNo;
		this.headCount = headCount;
		this.totalPrice = totalPrice;
		this.userNo = userNo;
		this.spaceNo = spaceNo;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getHeadCount() {
		return headCount;
	}

	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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
		return "Reservation [reservationNo=" + reservationNo + ", headCount=" + headCount + ", totalPrice=" + totalPrice
				+ ", userNo=" + userNo + ", spaceNo=" + spaceNo + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
