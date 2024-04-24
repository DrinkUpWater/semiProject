package com.kh.space.service;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.space.model.dao.SpaceDao;

public class SpaceDeleteService {

	public int spaceDelete(int spaceNum, int userNo) {
		Connection conn =getConnection();
		int result=new SpaceDao().spaceDelete(conn,spaceNum,userNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

}
