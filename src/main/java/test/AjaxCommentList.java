package test;

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

/**
 * Servlet implementation class AjaxCommentList
 */


@WebServlet("/comment.bo")
public class AjaxCommentList extends HttpServlet {

	
	
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCommentList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("utf-8");
       String spaceNo=request.getParameter("spaceNum");
       System.out.println(spaceNo);
       
       ArrayList<Reply> replys=new ArrayList<>();
//       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//       Date now=new Date(2024);
		
		
       Reply reply =new Reply();
       reply.setReplyNo(1);
       reply.setUserId("admin");
       reply.setUsercontent("관리자글입니다.");
       reply.setHostReplay("호스트리플라이1");
       reply.setTime("2024-04-11");
       
       Reply reply1 =new Reply();
       reply1.setReplyNo(2);
       reply1.setUserId("user1");
       reply1.setUsercontent("user1의 QandA");
       reply1.setHostReplay("호스트리플라이2");
       reply1.setTime("2024-04-11");
       
       
       
       Reply reply2 =new Reply();
       reply2.setReplyNo(3);
       reply2.setUserId("user2");
       reply2.setUsercontent("user2의 QandA");
       reply2.setHostReplay("호스트리플라이3");
       reply2.setTime("2024-04-11");
       
       
       
       
       
       replys.add(reply);
       replys.add(reply1);
       replys.add(reply2);
       
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(replys,response.getWriter());
       
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
