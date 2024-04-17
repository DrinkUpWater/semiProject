package com.kh.space.service;

import com.kh.common.Attachment;
import com.kh.space.model.dao.SpaceDao;
import com.kh.space.model.vo.Space;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class SpaceService {
	
	private SpaceDao spaceDao = new SpaceDao();

	public Space selectOneSpace(int spaceNo) {
		Connection conn =getConnection();
		Space space=spaceDao.selectOneSpace(conn,spaceNo);
		close(conn);
		
		return space;
		
	}

	public int insertSpace(Space sp, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = spaceDao.insertSpace(conn, sp);
		int result2 = spaceDao.insertAttachmentList(conn, list);
		
		if (result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public ArrayList<Space> selectSpaceList(){
		Connection conn = getConnection();
		
		ArrayList<Space> list = spaceDao.selectSpaceList(conn);
		
		close(conn);
		
		return list;
	}

}
