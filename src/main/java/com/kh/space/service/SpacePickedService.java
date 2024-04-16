package com.kh.space.service;

import com.kh.space.model.dao.SpacePickedDao;
import com.kh.space.model.vo.Picked;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

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
		
		return 0;
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
	
}
