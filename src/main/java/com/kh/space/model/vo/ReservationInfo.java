package com.kh.space.model.vo;

import java.sql.Date;
//import java.util.Date;

public class ReservationInfo {
	private int reservationNo; //예약번호
	private int headCount;    //이용할 예약인원 ex) 4명이 공간을 이용 
	private String userName; //호스트명
	private int totalPrice;  //총금액
	private int time1;     
	private int time2;
	private String reservationDate; //이용할 예약날짜
	private Date createDate;   //예약날짜
	private String spaceName;  //공간이름
	private String spaceMimg; //썸네일이미지
	
	public ReservationInfo() {
		super();
	}
//
//	public ReservationInfo(int reservationNo, int headCount, String userName, int totalPrice, int time1, int time2,
//			Date reservationDate, Date createDate, String spaceName, String spaceMimg) {
//		super();
//		this.reservationNo = reservationNo;
//		this.headCount = headCount;
//		this.userName = userName;
//		this.totalPrice = totalPrice;
//		this.time1 = time1;
//		this.time2 = time2;
//		this.reservationDate = reservationDate;
//		this.createDate = createDate;
//		this.spaceName = spaceName;
//		this.spaceMimg = spaceMimg;
//	}
//
//	public int getReservationNo() {
//		return reservationNo;
//	}
//
//	public void setReservationNo(int reservationNo) {
//		this.reservationNo = reservationNo;
//	}
//
//	public int getHeadCount() {
//		return headCount;
//	}
//
//	public void setHeadCount(int headCount) {
//		this.headCount = headCount;
//	}
//
//	public String getUserName() {
//		return userName;
//	}
//
//	public void setUserName(String userName) {
//		this.userName = userName;
//	}
//
//	public int getTotalPrice() {
//		return totalPrice;
//	}
//
//	public void setTotalPrice(int totalPrice) {
//		this.totalPrice = totalPrice;
//	}
//
//	public int getTime1() {
//		return time1;
//	}
//
//	public void setTime1(int time1) {
//		this.time1 = time1;
//	}
//
//	public int getTime2() {
//		return time2;
//	}
//
//	public void setTime2(int time2) {
//		this.time2 = time2;
//	}
//
//	public Date getReservationDate() {
//		return reservationDate;
//	}
//
//	public void setReservationDate(Date reservationDate) {
//		this.reservationDate = reservationDate;
//	}
//
//	public Date getCreateDate() {
//		return createDate;
//	}
//
//	public void setCreateDate(Date createDate) {
//		this.createDate = createDate;
//	}
//
//	public String getSpaceName() {
//		return spaceName;
//	}
//
//	public void setSpaceName(String spaceName) {
//		this.spaceName = spaceName;
//	}
//
//	public String getSpaceMimg() {
//		return spaceMimg;
//	}
//
//	public void setSpaceMimg(String spaceMimg) {
//		this.spaceMimg = spaceMimg;
//	}
//
//	@Override
//	public String toString() {
//		return "ReservationInfo [reservationNo=" + reservationNo + ", headCount=" + headCount + ", userName=" + userName
//				+ ", totalPrice=" + totalPrice + ", time1=" + time1 + ", time2=" + time2 + ", reservationDate="
//				+ reservationDate + ", createDate=" + createDate + ", spaceName=" + spaceName + ", spaceMimg="
//				+ spaceMimg + "]";
//	}
//	
	
	public ReservationInfo(int reservationNo, int headCount, String userName, int totalPrice, int time1, int time2,
			String reservationDate, Date createDate, String spaceName, String spaceMimg) {
		super();
		this.reservationNo = reservationNo;
		this.headCount = headCount;
		this.userName = userName;
		this.totalPrice = totalPrice;
		this.time1 = time1;
		this.time2 = time2;
		this.reservationDate = reservationDate;
		this.createDate = createDate;
		this.spaceName = spaceName;
		this.spaceMimg = spaceMimg;
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

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public String getSpaceMimg() {
		return spaceMimg;
	}

	public void setSpaceMimg(String spaceMimg) {
		this.spaceMimg = spaceMimg;
	}

	@Override
	public String toString() {
		return "ReservationInfo [reservationNo=" + reservationNo + ", headCount=" + headCount + ", userName=" + userName
				+ ", totalPrice=" + totalPrice + ", time1=" + time1 + ", time2=" + time2 + ", reservationDate="
				+ reservationDate + ", createDate=" + createDate + ", spaceName=" + spaceName + ", spaceMimg="
				+ spaceMimg + "]";
	}

	
	
	

	
	
	
	


	
	
	
	
	
}
