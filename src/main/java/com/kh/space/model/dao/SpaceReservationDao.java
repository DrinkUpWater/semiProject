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
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.space.model.vo.ReservationDate;

public class SpaceReservationDao {
	private Properties pro =new Properties();
	
	public SpaceReservationDao() {
		
		String file=SpaceReservationDao.class.getResource("/db/sql/space-mapper.xml").getPath();
		
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

}
