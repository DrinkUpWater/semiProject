package controller.notice.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;

import controller.notice.model.vo.Reply;
import controller.notice.service.NoticeService;

/**
 * Servlet implementation class ReplyInsertController
 */
@WebServlet("/rinsert.no")
public class ReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String replyContent = request.getParameter("content");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();		
		
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setRefNoticeNo(noticeNo);
		r.setReplyWriter(String.valueOf(userNo));
		
		int result = new NoticeService().insertReply(r);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
