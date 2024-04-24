package controller.notice.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.NoticeAttachment;
import com.kh.common.PageInfo;

import controller.notice.model.vo.Notice;
import controller.notice.model.vo.Reply;
import oracle.net.aso.q;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String filePath = NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath();
		
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
	
	public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi){
		
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(
							rset.getInt("notice_no"),
							rset.getString("notice_title"),
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
	
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, Integer.parseInt(n.getNoticeWriter()));
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int increaseCount(Connection conn, int noticeNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		Notice n = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(
							rset.getInt("notice_no"),
							rset.getString("notice_title"),
							rset.getString("notice_content"),
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
		
		return n;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteNotice(Connection conn, int noticeNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateNoticeAttachment(Connection conn, NoticeAttachment nat) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNoticeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nat.getOriginName());
			pstmt.setString(2, nat.getChangeName());
			pstmt.setString(3, nat.getFilePath());
			pstmt.setInt(4, nat.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertNewNoticeAttachment(Connection conn, NoticeAttachment nat) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewNoticeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nat.getRefNoticeNo());
			pstmt.setString(2, nat.getOriginName());
			pstmt.setString(3, nat.getChangeName());
			pstmt.setString(4, nat.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, NoticeAttachment at) {
		int result = 1;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = result * pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public NoticeAttachment selectNoticeAttachment(Connection conn, int noticeNo) {
		
		NoticeAttachment nat = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nat = new NoticeAttachment();
				nat.setFileNo(rset.getInt("file_no"));
				nat.setOriginName(rset.getString("origin_name"));
				nat.setChangeName(rset.getString("change_name"));
				nat.setFilePath(rset.getString("file_path"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return nat;
	}
	
	public int selectSearchCount(Connection conn, String condition, String keyword) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
//		String sql = prop.getProperty("selectSearchCount");  
		String searchType = null;
		
		if(condition.equals("title")) {
			searchType = "notice_title";
		} else if(condition.equals("content")){
			searchType = "notice_content";
		} else if(condition.equals("writer")){
			searchType = "user_id";
		}
		
		String sql = "SELECT COUNT(*) "
				+	 "FROM NOTICE N "
				+	 "JOIN MEMBER ON (NOTICE_WRITER = USER_NO) "
				+	 "WHERE N.STATUS = 'Y' "
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
	public ArrayList<Notice> selectSearchList(Connection conn, String condition, String keyword, PageInfo pi){
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String searchType = null;
//		String sql = prop.getProperty("selectSearchList");
		
		if(condition.equals("title")) {
			searchType = "notice_title";
		} else if(condition.equals("content")){
			searchType = "notice_content";
		} else if(condition.equals("writer")){
			searchType = "user_id";
			System.out.println(searchType);
		}
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		String sql = "	SELECT *"
				+ "		FROM( SELECT ROWNUM RNUM, A.*"
				+ "			FROM(SELECT NOTICE_NO,"
				+ "					   NOTICE_TITLE,"
				+ "					   USER_ID,"
				+ "					   COUNT,"
				+ "					   CREATE_DATE"
				+ "				FROM NOTICE N"
				+ "				JOIN MEMBER ON (NOTICE_WRITER = USER_NO)"
				+ "				WHERE N.STATUS = 'Y'"
				+ "				AND " + searchType + " LIKE '%" + keyword + "%' "
				+ "				ORDER BY NOTICE_NO DESC"
				+ "			) A"
				+ "		)"
				+ "		WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		
		try {
			pstmt = conn.prepareStatement(sql);
				
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(
							rset.getInt("notice_no"),
							rset.getString("notice_title"),
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
			pstmt.setInt(2, r.getRefNoticeNo());
			pstmt.setInt(3, Integer.parseInt(r.getReplyWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectReplyCount(Connection conn, int noticeNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
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
	
	public ArrayList<Reply> selectReplyList(Connection conn, int noticeNo){
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
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
	
	public String statusCheck(Connection conn, int noticeNo) {
		String statusCheck = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("statusCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
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

//	public int findNextNum(Connection conn, int noticeNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		int nextNum=0;
//		String sql = prop.getProperty("findNextNum");
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, noticeNo);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				nextNum=rset.getInt("NEXTNNO");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//			
//		}
//	
//		return nextNum;
//	}
//
//	public int findpreNum(Connection conn, int noticeNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		int preNum=0;
//		String sql = prop.getProperty("findPreNum");
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, noticeNo);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				preNum=rset.getInt("NOTICE_NO");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//			
//		}
//	
//		return preNum;
//		
//	}
	
}
