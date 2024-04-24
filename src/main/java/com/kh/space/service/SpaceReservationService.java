package com.kh.space.service;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.vo.PageInfo;
import com.kh.space.model.dao.SpaceReservationDao;
import com.kh.space.model.vo.Reservation;
import com.kh.space.model.vo.ReservationDate;
import com.kh.space.model.vo.ReservationInfo;
import com.kh.space.model.vo.Review;


public class SpaceReservationService {

	public ArrayList<ReservationDate> findDate(String date,int spaceNo) {
		Connection conn =getConnection();
		ArrayList<ReservationDate> dates=new SpaceReservationDao().findDate(conn,date,spaceNo);
		close(conn);
		
		return dates;
		
	}


	public int selectReservationCount(String userId) {
		Connection conn =getConnection();
		int listCount=new SpaceReservationDao().selecReservationCount(conn,userId);
		close(conn);
		
		return listCount;
	}


	public ArrayList<ReservationInfo> selectReservation(PageInfo pi, String userId) {
		Connection conn =getConnection();
		
		ArrayList<ReservationInfo> list = new SpaceReservationDao().selectReservation(conn,pi,userId);
		
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


	public int deleteReservation(int reservationNo) {
		Connection conn =getConnection();
		int result=new SpaceReservationDao().deleteReservation(conn,reservationNo);
		
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
