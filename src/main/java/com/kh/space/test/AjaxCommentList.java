package com.kh.space.test;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.space.test.Comment;

/**
 * Servlet implementation class AjaxCommentList
 */


@WebServlet("/comment.bo")
public class AjaxCommentList extends HttpServlet {


	
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public AjaxCommentList() {
		CommentList.datas.add(new Comment("admin","관리자글입니다.","호스트리플라이1",1,"2024-04-11"));
    	CommentList.datas.add(new Comment("user1","user1글입니다.","호스트리플라이2",1,"2024-04-12"));
    	CommentList.datas.add(new Comment("user2","user2글입니다.","호스트리플라이3",1,"2024-04-12"));
    	CommentList.datas.add(new Comment("user3","user3글입니다.","호스트리플라이4",1,"2024-04-13"));
    
    }
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("utf-8");
       String spaceNo=request.getParameter("spaceNum");
       System.out.println(spaceNo);
       
       
       
       
       
  
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(CommentList.datas,response.getWriter());
       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	
	static class Reply{
		
		int replyNo;
		String userId;
		String content;
		String time;
		String hostReply;
		
		public Reply() {
			super();
		}

		
		
		public int getReplyNo() {
			return replyNo;
		}



		public void setReplyNo(int replyNo) {
			this.replyNo = replyNo;
		}



		public String getContent() {
			return content;
		}



		public void setContent(String content) {
			this.content = content;
		}



		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getUsercontent() {
			return content;
		}

		public void setUsercontent(String content) {
			this.content = content;
		}

		public String getTime() {
			return time;
		}

		public void setTime(String time) {
			this.time = time;
		}

		public String getHostReplay() {
			return hostReply;
		}

		public void setHostReplay(String hostReply) {
			this.hostReply = hostReply;
		}
		
		
		
	}

}
