package controller.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.BoardAttachment;
import com.kh.common.PageInfo;

import controller.board.model.dao.BoardDao;
import controller.board.model.vo.Board;
import controller.board.model.vo.Reply;

public class BoardDao {
private Properties prop = new Properties();
	
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Board> selectBoardList(Connection conn, PageInfo pi){
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(
							rset.getInt("board_no"),
							rset.getString("board_title"),
							rset.getString("user_id"),
							rset.getInt("count"),
							rset.getDate("create_date")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int increaseCount(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Board selectBoard(Connection conn, int boardNo) {
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(
							rset.getInt("board_no"),
							rset.getString("board_title"),
							rset.getString("board_content"),
							rset.getString("user_id"),
							rset.getDate("create_date")
						);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteBoard(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateBoardAttachment(Connection conn, BoardAttachment bat) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoardAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bat.getOriginName());
			pstmt.setString(2, bat.getChangeName());
			pstmt.setString(3, bat.getFilePath());
			pstmt.setInt(4, bat.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertNewBoardAttachment(Connection conn, BoardAttachment bat) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewBoardAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bat.getRefBoardNo());
			pstmt.setString(2, bat.getOriginName());
			pstmt.setString(3, bat.getChangeName());
			pstmt.setString(4, bat.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, BoardAttachment bat) {
		int result = 1;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bat.getOriginName());
			pstmt.setString(2, bat.getChangeName());
			pstmt.setString(3, bat.getFilePath());
			
			result = result * pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public BoardAttachment selectBoardAttachment(Connection conn, int boardNo) {
		
		BoardAttachment bat = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bat = new BoardAttachment();
				bat.setFileNo(rset.getInt("file_no"));
				bat.setOriginName(rset.getString("origin_name"));
				bat.setChangeName(rset.getString("change_name"));
				bat.setFilePath(rset.getString("file_path"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bat;
	}
	
	public int selectSearchCount(Connection conn, String condition, String keyword) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
//		String sql = prop.getProperty("selectSearchCount");  
		String searchType = null;
		
		if(condition.equals("title")) {
			searchType = "board_title";
		} else if(condition.equals("content")){
			searchType = "board_content";
		} else if(condition.equals("writer")){
			searchType = "user_id";
		}
		
		String sql = "SELECT COUNT(*) "
				+	 "FROM BOARD B "
				+	 "JOIN MEMBER ON (BOARD_WRITER = USER_NO) "
				+	 "WHERE B.STATUS = 'Y' "
				+	 "AND " + searchType + " LIKE '%" + keyword + "%'";
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count(*)");
			}
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	
	// mybatis없이 property객체를 이용해 매개변수를 담은 변수를 notice_mapper에 집어넣을려고 하니
	// searchType(notice_title)이 sql문에서 따옴표를 포함하여 적용되어 select가 안되서 property객체 안쓰고 sql문 직접 작성함
	public ArrayList<Board> selectSearchList(Connection conn, String condition, String keyword, PageInfo pi){
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String searchType = null;
		
		if(condition.equals("title")) {
			searchType = "board_title";
		} else if(condition.equals("content")){
			searchType = "board_content";
		} else if(condition.equals("writer")){
			searchType = "user_id";
		}
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		String sql = "	SELECT *"
				+ "		FROM( SELECT ROWNUM RNUM, A.*"
				+ "			FROM(SELECT BOARD_NO,"
				+ "					   BOARD_TITLE,"
				+ "					   USER_ID,"
				+ "					   COUNT,"
				+ "					   CREATE_DATE"
				+ "				FROM BOARD B"
				+ "				JOIN MEMBER ON (BOARD_WRITER = USER_NO)"
				+ "				WHERE B.STATUS = 'Y'"
				+ "				AND " + searchType + " LIKE '%" + keyword + "%' "
				+ "				ORDER BY BOARD_NO DESC"
				+ "			) A"
				+ "		)"
				+ "		WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		
		try {
			pstmt = conn.prepareStatement(sql);
				
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(
							rset.getInt("board_no"),
							rset.getString("board_title"),
							rset.getString("user_id"),
							rset.getInt("count"),
							rset.getDate("create_date")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBoardNo());
			pstmt.setInt(3, Integer.parseInt(r.getReplyWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectBoardReplyCount(Connection conn, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardReplyCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(Connection conn, int boardNo){
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reply r = new Reply();
				r.setReplyNo(rset.getInt("reply_no"));
				r.setReplyContent(rset.getString("reply_content"));
				r.setReplyWriter(rset.getString("user_id"));
				r.setCreateDate(rset.getString("create_date"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public String statusCheck(Connection conn, int boardNo) {
		String statusCheck = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("statusCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				statusCheck = rset.getString("status");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return statusCheck;
	}

	public int maxBoardNo(Connection conn) {
		int maxBoardNo = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("maxBoardNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				maxBoardNo = rset.getInt("max(board_no)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return maxBoardNo;
	}
	
	public int minBoardNo(Connection conn) {
		int minBoardNo = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("minBoardNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				minBoardNo = rset.getInt("min(board_no)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return minBoardNo;
	}
}
