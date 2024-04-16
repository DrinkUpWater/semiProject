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

import com.kh.space.model.vo.Space;
import static com.kh.common.JDBCTemplate.close;

public class SpaceDao {
	
	private Properties pro= new Properties();
	public SpaceDao() {
		String filePath =SpacePickedDao.class.getResource("/db/sql/space-mapper.xml").getPath();
		
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
	

	public Space selectOneSpace(Connection conn, int spaceNo) {
	    
		PreparedStatement pstmt=null;
		ResultSet reset=null;
		Space space=null;
		String sql=pro.getProperty("selectOneSpace");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, spaceNo);
			
			reset=pstmt.executeQuery();
			if(reset.next()) {
				space=new Space(
						reset.getInt("SPACE_NO"),
						reset.getString("SPACE_NAME"),
						reset.getString("SPACE_KIND"),
						reset.getString("SPACE_ONE_INTRODUCE"),
						reset.getString("SPACE_INTRODUCE"),
						reset.getString("SPACE_TAG"),
						reset.getString("SPACE_INFORMATION"),
						reset.getString("SPACE_CAUTION"),
						reset.getString("SPACE_MIMG"),
						reset.getString("SPACE_IMG"),
						reset.getString("SPACE_ADDRESS"),
						reset.getString("SPACE_DETAIL_ADDRESS"),
						reset.getInt("SPACE_PRICE"),
						reset.getString("SPACE_LOCATION"),
						reset.getString("SPACE_TEL"),
						reset.getInt("SPACE_CAPACITY"),
						reset.getString("SPACE_RESERVATION_STATUS"),
						reset.getDate("SPACE_ENROLL_DATE"),
						reset.getString("SPACE_ENROLL_STATUS")
						);
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(reset);
			close(pstmt);
			
		}
		
		return  space;
	}

}
