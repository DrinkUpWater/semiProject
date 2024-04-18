package com.kh.space.model.vo;

import java.sql.Date;

public class Reservation {
	private int reservationNo;
	private int headCount; //예약인원
	private String userName;
	private int totalPrice;
	private int time1;
	private int time2;
	private Date reservationDate;
	private String spaceName;
	private int userNo;
	private int spaceNo;
	
	
	public Reservation() {
		super();
	}


	public Reservation(int reservationNo, int headCount, String userName, int totalPrice, int time1, int time2,
			Date reservationDate, String spaceName, int userNo, int spaceNo) {
		super();
		this.reservationNo = reservationNo;
		this.headCount = headCount;
		this.userName = userName;
		this.totalPrice = totalPrice;
		this.time1 = time1;
		this.time2 = time2;
		this.reservationDate = reservationDate;
		this.spaceName = spaceName;
		this.userNo = userNo;
		this.spaceNo = spaceNo;
	}


	public Reservation(int reservationNo, int headCount, String userName, int totalPrice, int time1, int time2,
			Date reservationDate, String spaceName) {
		super();
		this.reservationNo = reservationNo;
		this.headCount = headCount;
		this.userName = userName;
		this.totalPrice = totalPrice;
		this.time1 = time1;
		this.time2 = time2;
		this.reservationDate = reservationDate;
		this.spaceName = spaceName;
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


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getTime1() {
		return time1;
	}


	public void setTime1(int time1) {
		this.time1 = time1;
	}


	public int getTime2() {
		return time2;
	}


	public void setTime2(int time2) {
		this.time2 = time2;
	}


	public Date getReservationDate() {
		return reservationDate;
	}


	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}


	public String getSpaceName() {
		return spaceName;
	}


	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
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
		return "Reservation [reservationNo=" + reservationNo + ", headCount=" + headCount + ", userName=" + userName
				+ ", totalPrice=" + totalPrice + ", time1=" + time1 + ", time2=" + time2 + ", reservationDate="
				+ reservationDate + ", spaceName=" + spaceName + ", userNo=" + userNo + ", spaceNo=" + spaceNo + "]";
	}
	
	
	
	
	
	
	
	
	
}
