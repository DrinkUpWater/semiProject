package com.kh.space.model.dao;
import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.space.model.vo.GuestComment;

public class SpaceCommentDao {
	private Properties pro=new Properties();
	public SpaceCommentDao() {
		String file=SpaceCommentDao.class.getResource("/db/sql/space-mapper.xml").getPath();
		try {
			pro.loadFromXML(new FileInputStream(file));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public ArrayList<GuestComment> selectComment(Connection conn, int spaceNum) {
	
		PreparedStatement pstmt=null;
		ResultSet rest =null;
		ArrayList<GuestComment> comments= new ArrayList<>();
		String sql=pro.getProperty("selectGuestComment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, spaceNum);
			
			rest=pstmt.executeQuery();
			
			while(rest.next()) {
				comments.add(new GuestComment(
						rest.getInt("Comment_No"),
						rest.getString("USER_ID"),
						rest.getString("게스트답글"),
						rest.getDate("INSERT_DATE"),
						rest.getString("호스트답글")
						));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rest);
			close(pstmt);
		}
		
		
		return comments;
	}


	public int insertComment(Connection conn, int spaceNum, String content, int userNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=pro.getProperty("insertGuestComment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,content);
			pstmt.setInt(2, spaceNum);
			pstmt.setInt(3, userNo);
			
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
