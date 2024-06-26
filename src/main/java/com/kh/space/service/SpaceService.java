package com.kh.space.service;

import com.kh.common.Attachment;
import com.kh.common.PageInfo;
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
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int result = spaceDao.selectListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Space> selectSpaceList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Space> list = spaceDao.selectSpaceList(conn, pi);
		
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

	public ArrayList<Space> KeywordSearchSpaceList(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Space> list = spaceDao.KeywordSearchSpaceList(conn, keyword, pi);
		
	    close(conn);	
		
		return list;
	}

	public ArrayList<Space> selectSpaceList(String pInfo, int pCount, String pKind) {
		Connection conn = getConnection();

		ArrayList<Space> list = spaceDao.selectSpaceList(conn, pInfo, pCount, pKind);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Space> selectSpaceList(String pInfo, int pCount, String pKind, String pOrder) {
		Connection conn = getConnection();

		ArrayList<Space> list = spaceDao.selectSpaceList(conn, pInfo, pCount, pKind, pOrder);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Space> selectSpaceListPaging(String pInfo, int pCount, String pKind, String pOrder, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Space> list = spaceDao.selectSpaceListPaging(conn, pInfo, pCount, pKind, pOrder, pi);
		
		close(conn);
		
		return list;
	}

	public int selectListCountPaging(int pCount, String pInfo, String pKind) {
		Connection conn = getConnection();
		
		int result = spaceDao.selectListCountPaging(conn, pCount, pInfo, pKind);
		
		close(conn);
		
		return result;
	}

	public int selectListCountPagingKeyword(String keyword) {
		Connection conn = getConnection();
		
		int result = spaceDao.selectListCountPagingKeyword(conn, keyword);
		
		close(conn);
		
		return result;
	}

	public int updateAttachment(int spaceNo, int i, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = spaceDao.deleteAttachment(conn, spaceNo, i);
		int result2 = spaceDao.insertAttachmentOne(conn, spaceNo, i, at);
		
		if (result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public int updateSpace(Space sp) {
		Connection conn = getConnection();
		
		int result = spaceDao.updateSpace(conn, sp);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	

}
