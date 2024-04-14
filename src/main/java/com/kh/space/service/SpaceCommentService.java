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
		
		return result;
	}
	
	
	
	
	

}
