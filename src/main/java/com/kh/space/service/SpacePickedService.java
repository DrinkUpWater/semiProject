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

	public ArrayList<Space> findUserPicked(int userNo) {
		Connection conn =getConnection();
		ArrayList<Space> spaces=sDao.findUserPicked(conn,userNo);
		
		 close(conn);
		 
		return spaces;
	}
	
}
