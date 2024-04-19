package com.kh.space.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.space.model.vo.Review;
import static com.kh.common.JDBCTemplate.*;

public class SpaceReviewDao {
	
	private Properties pro= new Properties();
	public SpaceReviewDao() {
		String filePath =SpacePickedDao.class.getResource("/db/sql/review-mapper.xml").getPath();
		
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

	public ArrayList<Review> selectReviews(Connection conn, int spaceNum) {
		 PreparedStatement pstmt= null;
		 ResultSet rset =null;
		 ArrayList<Review> reviews =new ArrayList<>();
		 String sql=pro.getProperty("selectReviews");
		 

		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,spaceNum);
			
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				reviews.add(new Review(
						rset.getInt("REVIEW_NO"),
						rset.getString("CONTENT"),
						rset.getDate("INSERT_DATE"),
						rset.getString("USER_NAME")
				));
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		   
		return reviews;
	}

	public int insertReviews(Connection conn, int userNo, int spaceNum,String content) {
		 PreparedStatement pstmt= null;
		 String sql=pro.getProperty("insertReviews");
		 int result=0;
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, spaceNum);
			pstmt.setInt(3, userNo);
		
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
