package com.kh.space.model.vo;

import java.sql.Date;

public class ReservationDate {
	private int DateNo;
	private Date ReservationDate;
	private int time1;
	private int time2;
	private int ReservationNo;
	
	public ReservationDate() {
		
	}

	public ReservationDate(int dateNo, Date reservationDate, int time1, int time2, int reservationNo) {
		super();
		this.DateNo = dateNo;
		this.ReservationDate = reservationDate;
		this.time1 = time1;
		this.time2 = time2;
		this.ReservationNo = reservationNo;
	}

	public ReservationDate(int time1, int time2) {
		this.time1 = time1;
		this.time2 = time2;
	}

	public int getDateNo() {
		return DateNo;
	}

	public void setDateNo(int dateNo) {
		DateNo = dateNo;
	}

	public Date getReservationDate() {
		return ReservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		ReservationDate = reservationDate;
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

	public int getReservationNo() {
		return ReservationNo;
	}

	public void setReservationNo(int reservationNo) {
		ReservationNo = reservationNo;
	}

	@Override
	public String toString() {
		return "ReservationDate [DateNo=" + DateNo + ", ReservationDate=" + ReservationDate + ", Time1=" + time1
				+ ", Time2=" + time2 + ", ReservationNo=" + ReservationNo + "]";
	}
	
	
	
	

}
