package com.kh.space.model.dao;
import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.vo.PageInfo;
import com.kh.space.model.vo.Reservation;
import com.kh.space.model.vo.ReservationDate;

import com.kh.space.model.vo.ReservationInfo;
import com.kh.space.model.vo.Review;


public class SpaceReservationDao {
	private Properties pro =new Properties();
	
	public SpaceReservationDao() {
		
		String file=SpaceReservationDao.class.getResource("/db/sql/reservation-mapper.xml").getPath();
		
		try {
			pro.loadFromXML(new FileInputStream(file));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public ArrayList<ReservationDate> findDate(Connection conn, String date) {
	   PreparedStatement pstmt=null;
	   ResultSet reset=null;
	   ArrayList<ReservationDate> dates=new ArrayList<>();
	   String sql=pro.getProperty("findDate");
	   
	   Date date_=Date.valueOf(date);
	
	   try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setDate(1,date_);
		
		reset=pstmt.executeQuery();
		
		while(reset.next()) {
			
			dates.add(new ReservationDate(
				reset.getInt("RESERVATION_TIME1"),
				reset.getInt("RESERVATION_TIME2")					
			));
			
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(reset);
		close(pstmt);
	}
	   
	   
	 return dates;
	}


	public int selecReservationCount(Connection conn, String userId) { //예약내역 수
		int reservationCount=0;
		ResultSet rset =null;
		PreparedStatement pstmt=null;
		String sql = pro.getProperty("selectReservationCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset =pstmt.executeQuery();
			if(rset.next()) {
				reservationCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);	
		}
		return reservationCount;
	}

	public ArrayList<ReservationInfo> selectReservation(Connection conn, PageInfo pi, String userId) {
		ArrayList<ReservationInfo> list = new ArrayList<ReservationInfo>();
		ResultSet rset = null;
		PreparedStatement pstmt =null;
		String sql = pro.getProperty("selectReservationInfo");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
		
		        list.add(new ReservationInfo(
						rset.getInt("RESERVATION_NO"),
						rset.getInt("HEADCOUNT"),
						rset.getString("USER_NAME"),
						rset.getInt("TOTAL_PRICE"),
						rset.getInt("RESERVATION_TIME1"), 
						rset.getInt("RESERVATION_TIME2"),
						rset.getString("RESERVATION_DATE"),
						rset.getDate("CREATE_DATE"),
						rset.getString("SPACE_NAME"),		
						rset.getString("SPACE_MIMG")			
						));
				
		
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int insertReservation(Connection conn, Reservation reservation) {
		PreparedStatement pstmt =null;
		String sql = pro.getProperty("insertReservation");
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reservation.getHeadCount());
			pstmt.setInt(2, reservation.getTotalPrice());
			pstmt.setInt(3, reservation.getUserNo());
			pstmt.setInt(4, reservation.getSpaceNo());
			
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int insertReservationDate(Connection conn, ReservationDate reservationDate) {
		PreparedStatement pstmt =null;
		String sql = pro.getProperty("insertReservationDate");
		int result=0;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setDate(1, reservationDate.getReservationDate());
			pstmt.setInt(2, reservationDate.getTime1());
			pstmt.setInt(3, reservationDate.getTime2());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
