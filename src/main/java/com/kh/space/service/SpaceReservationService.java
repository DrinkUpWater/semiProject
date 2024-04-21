package com.kh.space.service;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.vo.PageInfo;
import com.kh.space.model.dao.SpaceReservationDao;
import com.kh.space.model.vo.Reservation;
import com.kh.space.model.vo.ReservationDate;
import com.kh.space.model.vo.Review;

public class SpaceReservationService {

	public ArrayList<ReservationDate> findDate(String date) {
		Connection conn =getConnection();
		ArrayList<ReservationDate> dates=new SpaceReservationDao().findDate(conn,date);
		close(conn);
		
		return dates;
		
	}


	public int selectReservationCount(String userId) {
		Connection conn =getConnection();
		int listCount=new SpaceReservationDao().selecReservationCount(conn,userId);
		close(conn);
		
		return listCount;
	}


	public ArrayList<Reservation> selectReservation(PageInfo pi, String userId) {
		Connection conn =getConnection();
		ArrayList<Reservation> list = new SpaceReservationDao().selectReservation(conn,pi,userId);

		return list;
	}


	public int insertReservation(Reservation reservation, ReservationDate reservationDate) {
		Connection conn =getConnection();
		int result1=new SpaceReservationDao().insertReservation(conn,reservation);
		int result2=new SpaceReservationDao().insertReservationDate(conn,reservationDate);
		
		int result=result1*result2;
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}




}
