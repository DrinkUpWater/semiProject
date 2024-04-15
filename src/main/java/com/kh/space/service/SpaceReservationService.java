package com.kh.space.service;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.space.model.dao.SpaceReservationDao;
import com.kh.space.model.vo.ReservationDate;

public class SpaceReservationService {

	public ArrayList<ReservationDate> findDate(String date) {
		Connection conn =getConnection();
		ArrayList<ReservationDate> dates=new SpaceReservationDao().findDate(conn,date);
		close(conn);
		
		return dates;
		
		
	}

}
