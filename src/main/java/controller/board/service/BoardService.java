package controller.board.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.BoardAttachment;
import com.kh.common.PageInfo;

import controller.board.model.dao.BoardDao;
import controller.board.model.vo.Board;
import controller.board.model.vo.Reply;

public class BoardService {
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		close(conn);
		
		return listCount;
	}
	
	
	public ArrayList<Board> selectBoardList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public int insertBoard(Board b, BoardAttachment bat) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		int result2 = 1;
		
		if(bat != null) {
			result2 = new BoardDao().insertAttachment(conn, bat);
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
	
	public Board increaseCount(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		Board b = null;
		if(result > 0) {
			commit(conn);
			b = new BoardDao().selectBoard(conn, boardNo);
		} else {
			rollback(conn);
		}
		
		return b;
	}
	
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		return b;
	}
	
	public int updateBoard(Board b, BoardAttachment bat) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		int result2 = 1;
		
		if(bat != null) {
			if(bat.getFileNo() != 0) {
				result2 = new BoardDao().updateBoardAttachment(conn, bat);
			} else {
				result2 = new BoardDao().insertNewBoardAttachment(conn, bat);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 * result2;
	}
	
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();	
		int result = new BoardDao().deleteBoard(conn, boardNo);
		
		if (result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public BoardAttachment selectBoardAttachment(int boardNo) {
		Connection conn = getConnection();
		BoardAttachment bat = new BoardDao().selectBoardAttachment(conn, boardNo);
		
		close(conn);
		if(bat != null) {
			return bat;
		} else {
			return null;
		}
		
	}
	
	public int selectSearchCount(String condition, String keyword) {
		Connection conn = getConnection();
		int searchCount = new BoardDao().selectSearchCount(conn, condition, keyword);
		
		if(searchCount > 0) {
			close(conn);
		} else {
			rollback(conn);
		}
		
		return searchCount;
	}
	
	public ArrayList<Board> selectSearchList(String condition, String keyword, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectSearchList(conn, condition, keyword, pi);
		
		close(conn);
		
		return list;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = new BoardDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int selectBoardReplyCount(int boardNo){
		Connection conn = getConnection();
		
		int result = new BoardDao().selectBoardReplyCount(conn, boardNo);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}

	public String statusCheck(int boardNo) {
		Connection conn = getConnection();
		
		String statusCheck = new BoardDao().statusCheck(conn, boardNo);
		
		close(conn);
		
		return statusCheck;
	}
	
	public int maxBoardNo() {
		Connection conn = getConnection();
		
		int maxBoardNo = new BoardDao().maxBoardNo(conn);
		
		close(conn);
		
		return maxBoardNo;
	}

	public int minBoardNo() {
		Connection conn = getConnection();
		
		int minBoardNo = new BoardDao().minBoardNo(conn);
		
		close(conn);
		
		return minBoardNo;
	}
}
