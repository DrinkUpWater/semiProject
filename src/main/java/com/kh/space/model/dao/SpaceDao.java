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

import com.kh.common.Attachment;
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
						reset.getString("SPACE_ENROLL_STATUS"),
						reset.getInt("USER_NO")
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


	public int insertSpace(Connection conn, Space sp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = pro.getProperty("insertSpace");
			
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sp.getSpaceName());
			pstmt.setString(2, sp.getSpaceKind());
			pstmt.setString(3, sp.getSpaceOneIntroduce());
			pstmt.setString(4, sp.getSpaceIntroduce());
			pstmt.setString(5, sp.getSpaceTag());
			pstmt.setString(6, sp.getSpaceInformation());
			pstmt.setString(7, sp.getSpaceCaution());
			pstmt.setString(8, sp.getSpaceAddress());
			pstmt.setString(9, sp.getSpaceDetailAddress());
			pstmt.setInt(10, sp.getSpacePrice());
			pstmt.setString(11, sp.getSpaceLocation());
			pstmt.setString(12, sp.getSpaceTel());
			pstmt.setInt(13, sp.getSpaceCapacity());
			pstmt.setInt(14, sp.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		PreparedStatement pstmt = null;
		int result = 1;
		
		String sql = pro.getProperty("insertAttachmentList");
		
		try {
			
			for (Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result = result * pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Space> selectSpaceList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Space> list = new ArrayList<>();
		
		String sql = pro.getProperty("selectSpaceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				Space sp = new Space();
				sp.setSpaceNo(rset.getInt("SPACE_NO"));
				sp.setSpaceName(rset.getString("SPACE_NAME"));
				sp.setSpaceTag(rset.getString("SPACE_TAG"));
				sp.setSpaceAddress(rset.getString("SPACE_ADDRESS"));
				sp.setSpacePrice(rset.getInt("SPACE_PRICE"));	
				sp.setSpaceCapacity(rset.getInt("SPACE_CAPACITY"));
				
				list.add(sp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
