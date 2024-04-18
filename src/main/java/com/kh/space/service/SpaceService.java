package com.kh.space.service;

import com.kh.common.Attachment;
import com.kh.space.model.dao.SpaceDao;
import com.kh.space.model.dto.SpaceThumbNail;
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

	public ArrayList<Space> selectMySpaces(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Space> list = spaceDao.selectMySpaces(conn,userNo);
		
		close(conn);
		
		return list ;
	}

	public ArrayList<Attachment> selectMainAttachment() {
		Connection conn = getConnection();
		
		ArrayList<Attachment> atList = spaceDao.selectMainAttachment(conn);
		
		close(conn);
		
		return atList;
	}


	 public ArrayList<Attachment> selectSpaceAttachment(int spaceNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> atList = spaceDao.selectSpaceAttachment(conn,spaceNo);
		
		close(conn);
		
		return atList;
    }	

	public ArrayList<Space> selectSpaceList(int pCount) {
		Connection conn = getConnection();
		
		ArrayList<Space> list = spaceDao.selectSpaceList(conn, pCount);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Space> selectSpaceList(String pInfo) {
		Connection conn = getConnection();
		
		ArrayList<Space> list = spaceDao.selectSpaceList(conn, pInfo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Space> selectSpaceList(String pInfo, int pCount) {
        Connection conn = getConnection();
		
		ArrayList<Space> list = spaceDao.selectSpaceList(conn, pInfo, pCount);
		
		close(conn);
		
		return list;

	}

}
