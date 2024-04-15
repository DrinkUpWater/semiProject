package controller.notice.service;

import java.sql.Connection;
import java.util.ArrayList;

import controller.notice.model.dao.NoticeDao;
import controller.notice.model.vo.Notice;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.close;

public class NoticeService {
	
	public ArrayList<Notice> selectNotice(){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		return list;
	}
	
	public int insertNotice(Notice n) {
		//Connection conn = getConnection();   JDBCTemplate 클래스 따로 만들어서 import getConnection 해줘야함
		//int result = new NoticeDao().insertNotice(conn, n);
		
		int result = new NoticeDao().insertNotice(n);
		
//		if(result > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		
//		close(conn);
		
//		conn.close();
		
		return result;
	}
	
	public Notice increaseCount(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		return null;
	}
}
