package com.kh.space.service;

import com.kh.space.model.dao.SpaceDao;
import com.kh.space.model.vo.Space;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

public class SpaceService {
	
	private SpaceDao sp=new SpaceDao();

	public Space selectOneSpace(int spaceNo) {
		Connection conn =getConnection();
		Space space=sp.selectOneSpace(conn,spaceNo);
		close(conn);
		
		return space;
		
	}

}
