package controller.notice.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;

import controller.notice.model.dao.NoticeDao;
import controller.notice.model.vo.Notice;
import controller.notice.model.vo.Reply;


public class NoticeService {
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		
		return listCount;
	}
	
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Notice increaseCount(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		Notice n = null;
		if(result > 0) {
			commit(conn);
			n = new NoticeDao().selectNotice(conn, noticeNo);
		} else {
			rollback(conn);
		}
		
		return n;
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		
		close(conn);
		return n;
	}
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();	
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if (result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new NoticeDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
}
