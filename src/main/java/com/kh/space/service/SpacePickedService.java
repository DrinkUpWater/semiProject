package com.kh.space.service;

import com.kh.space.model.dao.SpacePickedDao;
import com.kh.space.model.vo.Picked;
import com.kh.space.model.vo.Space;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class SpacePickedService {
	
	private SpacePickedDao sDao=new SpacePickedDao();


	public Picked selectOnePicked(int spaceNum, int userNo) {
	    Connection conn=getConnection();
	    Picked picked=sDao.selectOnePicked(conn,spaceNum,userNo);
	    
	    close(conn);
		
		
		return picked;
	}

	public int insertPicked(int spaceNum, int userNo) {
		Connection conn=getConnection();
		int result=sDao.insertPicked(conn,spaceNum,userNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deletePicked(int spaceNum, int userNo) {
		Connection conn =getConnection();
		int result=sDao.deletePicked(conn,spaceNum,userNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int findUserPicked(int userNo, int spaceNo) {
		Connection conn =getConnection();
		int count=sDao.findUserPicked(conn,userNo,spaceNo);
		
		 close(conn);
		 
		return count;
	}

	public ArrayList<Space> findUserPickedes(int userNo) {
		Connection conn =getConnection();
		ArrayList<Space> pickeds=sDao.findUserPickeds(conn,userNo);
		
		 close(conn);
		 
		return pickeds;
	
	}
	
}
