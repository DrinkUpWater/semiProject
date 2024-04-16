package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import static com.kh.common.JDBCTemplate.*;
import java.util.Properties;

import com.kh.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getNickName());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getBirth());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, m.getUserHost());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				m = new Member(
						
						   rset.getInt("USER_NO"), 
						   rset.getString("USER_ID"), 
						   rset.getString("USER_PWD"),
						   rset.getString("USER_NAME"), 
						   rset.getString("USER_NICKNAME"),
						   rset.getString("GENDER"), 
						   rset.getString("PHONE"), 
						   rset.getString("BIRTH"),
						   rset.getString("EMAIL"), 
						   rset.getDate("JOIN_DATE"),
						   rset.getDate("MODIFY_DATE"),
						   rset.getString("STATUS"),
						   rset.getString("USER_HOST"),
						   rset.getString("USER_ADMIN")				   			   
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return m;
	}
	
	//아이디 중복확인
	public int idCheck(Connection conn, String checkId) {
		int count =0;
		ResultSet rset= null;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	//비밀번호 찾기
	public String findPwd(Connection conn, String userId, String phone, String email) { 
		String findPwd = null; //찾을 비밀번호
		ResultSet rset= null;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("findPwd");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2,phone);
			pstmt.setString(3,email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				findPwd =rset.getString("USER_PWD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return findPwd;
	}

	public int updateMember(Connection conn, Member m) {
		int result = 0;		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getNickName());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getBirth());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectMember(Connection conn, String userId) {
		Member m = null;
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql =prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m= new Member(
						rset.getInt("user_no"),
						rset.getString("user_id"),
						rset.getString("user_pwd"),
						rset.getString("user_name"),
						rset.getString("user_nickname"),
						rset.getString("gender"),
						rset.getString("phone"),
						rset.getString("birth"),
						rset.getString("email"),
						rset.getDate("join_date"),
						rset.getDate("modify_date"),
						rset.getString("status"),
						rset.getString("user_host"),
						rset.getString("user_admin")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int updatePwdMember(Connection conn, Member m, String newPwd) {
		int result =0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("updatePwdMember");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, m.getNickName());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getBirth());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getUserId());
			
			result =pstmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int checkPwdMember(Connection conn, Member m, String oldPwd) { //현재비밀번호를 맞게 입력했는지 확인
		int count=0;
		ResultSet rset = null;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("checkPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oldPwd);
			pstmt.setString(2, m.getUserId());
			
			rset =pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

}
