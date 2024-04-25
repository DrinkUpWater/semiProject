package controller.notice.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.NoticeAttachment;
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
	
	public int insertNotice(Notice n, NoticeAttachment nat) {
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().insertNotice(conn, n);
		int result2 = 1;
		
		if(nat != null) {
			result2 = new NoticeDao().insertAttachment(conn, nat);
			System.out.println(result2);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
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
	
	public int updateNotice(Notice n, NoticeAttachment nat) {
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().updateNotice(conn, n);
		int result2 = 1;
		
		if(nat != null) {
			if(nat.getFileNo() != 0) {
				result2 = new NoticeDao().updateNoticeAttachment(conn, nat);
			} else {
				result2 = new NoticeDao().insertNewNoticeAttachment(conn, nat);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 * result2;
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
	
	public NoticeAttachment selectNoticeAttachment(int noticeNo) {
		Connection conn = getConnection();
		NoticeAttachment nat = new NoticeDao().selectNoticeAttachment(conn, noticeNo);
		
		close(conn);
		if(nat != null) {
			return nat;
		} else {
			return null;
		}
		
	}
	
	public int selectSearchCount(String condition, String keyword) {
		Connection conn = getConnection();
		int searchCount = new NoticeDao().selectSearchCount(conn, condition, keyword);
		
		if(searchCount > 0) {
			close(conn);
		} else {
			rollback(conn);
		}
		
		return searchCount;
	}
	
	public ArrayList<Notice> selectSearchList(String condition, String keyword, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectSearchList(conn, condition, keyword, pi);
		
		close(conn);
		
		return list;
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
	
	public int selectReplyCount(int noticeNo){
		Connection conn = getConnection();
		
		int result = new NoticeDao().selectReplyCount(conn, noticeNo);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new NoticeDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}

	public String statusCheck(int noticeNo) {
		Connection conn = getConnection();
		
		String statusCheck = new NoticeDao().statusCheck(conn, noticeNo);
		
		close(conn);
		
		return statusCheck;
	}
	

//	public int findNextNum(int noticeNo) {
//		Connection conn = getConnection();
//		
//		int nextNum=new NoticeDao().findNextNum(conn,noticeNo);
//		
//		close(conn);
//		return nextNum;
//	}
//
//
//	public int findpreNum(int noticeNo) {
//        Connection conn = getConnection();
//		
//		int nextNum=new NoticeDao().findpreNum(conn,noticeNo);
//		
//		close(conn);
//		return 0;
//	}
	
}
