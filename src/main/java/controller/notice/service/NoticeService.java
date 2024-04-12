package controller.notice.service;

import java.sql.Connection;

import controller.notice.model.dao.NoticeDao;
import controller.notice.model.vo.Notice;

public class NoticeService {
	
	
	
	
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
}
