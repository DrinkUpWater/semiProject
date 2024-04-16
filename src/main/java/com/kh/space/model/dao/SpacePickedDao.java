package com.kh.space.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.space.model.vo.Picked;
import static com.kh.common.JDBCTemplate.*;

public class SpacePickedDao {
	private Properties pro =new Properties();
	
	public SpacePickedDao() {
		
		String filePath =SpacePickedDao.class.getResource("/db/sql/picked-mapper.xml").getPath();
		
		try {
			pro.loadFromXML(new FileInputStream(filePath));
			
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
	

	public Picked selectOnePicked(Connection conn, int spaceNum, int userNo) {
		
		PreparedStatement pstmt=null;
		ResultSet rest=null;
		Picked picked=null;
		String sql=pro.getProperty("selectOnePicked");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,userNo);
			pstmt.setInt(2, spaceNum);
			
			rest=pstmt.executeQuery();
			
			if(rest.next()) {
				picked=new Picked(
						rest.getInt("PICKED_NUM"),
						rest.getDate("PICKED_DATE"),
						rest.getInt("USER_NO"),
						rest.getInt("SPACE_NO")
						);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rest);
			close(pstmt);
			
		}
		
		
		return picked;
	}


	public int insertPicked(Connection conn, int spaceNum, int userNo) {
		
		PreparedStatement pstmt=null;
	    int result=0;
	    
	    String sql=pro.getProperty("insertPicked");
	    try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2,spaceNum);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
	
		return result;
	}

	public int deletePicked(Connection conn, int spaceNum, int userNo) {
		
		PreparedStatement pstmt=null;
	    int result=0;
	    
	    String sql=pro.getProperty("deletePicked");
	    try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, spaceNum);
			pstmt.setInt(2,userNo);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
	
		return result;
		
		
		
	}

}
