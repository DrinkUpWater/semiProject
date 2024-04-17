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
	private String resRequest;
	private int userNo;
	private int spaceNo;
	
	
	public Reservation() {
		super();
	}

	
	
	public Reservation(int reservationNo, int headCount, String userName, int totalPrice, int time1, int time2,
			Date reservationDate, String spaceName, String resRequest) {
		super();
		this.reservationNo = reservationNo;
		this.headCount = headCount;
		this.userName = userName;
		this.totalPrice = totalPrice;
		this.time1 = time1;
		this.time2 = time2;
		this.reservationDate = reservationDate;
		this.spaceName = spaceName;
		this.resRequest = resRequest;
	}



	public Reservation(int reservationNo, int headCount, String userName, int totalPrice, int time1, int time2,
			Date reservationDate, String spaceName, String resRequest, int userNo, int spaceNo) {
		super();
		this.reservationNo = reservationNo;
		this.headCount = headCount;
		this.userName = userName;
		this.totalPrice = totalPrice;
		this.time1 = time1;
		this.time2 = time2;
		this.reservationDate = reservationDate;
		this.spaceName = spaceName;
		this.resRequest = resRequest;
		this.userNo = userNo;
		this.spaceNo = spaceNo;
	}


	

	
	

	
	

	
	
	
	
	
}
