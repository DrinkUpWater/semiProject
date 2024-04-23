package com.kh.space.service;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.space.model.dao.SpaceCommentDao;
import com.kh.space.model.vo.GuestComment;

public class SpaceCommentService {

	public ArrayList<GuestComment> selectComment(int spaceNum) {
		Connection conn =getConnection();
		
		ArrayList<GuestComment> comments=new SpaceCommentDao().selectComment(conn,spaceNum);
		
		close(conn);
		
		
		return comments;
	}

	public int insertComment(int spaceNum, String content, int userNo) {
		Connection conn =getConnection();
		int result=new SpaceCommentDao().insertComment(conn,spaceNum,content,userNo);
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertHostComment(int commentNo, String hostReply) {
		
		Connection conn =getConnection();
		int result=new SpaceCommentDao().insertHostComment(conn,commentNo,hostReply);
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}

	public int updateHostComment(int commentNo, String hostReply) {
		Connection conn =getConnection();
		int result=new SpaceCommentDao().updateHostComment(conn,commentNo,hostReply);
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}

	public int findHostComment(int commentNo) {
		Connection conn =getConnection();
		int result=new SpaceCommentDao().findHostComment(conn,commentNo);
		
		
		close(conn);
		
		return result;
		
		
	}

	public int deleteHostComment(int commentNo) {
		Connection conn =getConnection();
		int result=new SpaceCommentDao().deleteHostComment(conn,commentNo);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteGuestComment(int commentNo, int userNo) {
		Connection conn =getConnection();
		int result=new SpaceCommentDao().deleteGuestComment(conn,commentNo,userNo);
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
