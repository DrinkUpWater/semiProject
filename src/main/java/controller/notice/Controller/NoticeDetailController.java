package controller.notice.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.NoticeAttachment;

import controller.notice.model.vo.Notice;
import controller.notice.model.vo.Reply;
import controller.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/detail.no")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("num"));
		
		int maxNoticeNo = new NoticeService().maxNoticeNo();
		
		int minNoticeNo = new NoticeService().minNoticeNo();
				
		String next = request.getParameter("next");
		String pre = request.getParameter("pre");
		
		if(next != null) {
			String statusCheck = new NoticeService().statusCheck(noticeNo);
			while(statusCheck.equals("N")) {
				if(statusCheck.equals("Y")){
					break;
				}
				noticeNo +=  1;
				statusCheck = new NoticeService().statusCheck(noticeNo);
			} 
		} 
		
		if(pre != null) {
			String statusCheck = new NoticeService().statusCheck(noticeNo);
			while(statusCheck.equals("N")) {
				if(statusCheck.equals("Y")){
					break;
				}
				noticeNo -=  1;
				statusCheck = new NoticeService().statusCheck(noticeNo);
			} 
		}
		
		Notice n = new NoticeService().increaseCount(noticeNo);
		int noticeReplyCount = new NoticeService().selectNoticeReplyCount(noticeNo);
		
		if(n != null) {
			NoticeAttachment nat = new NoticeService().selectNoticeAttachment(noticeNo);
			
			request.setAttribute("notice", n);
			request.setAttribute("noticeAttachment", nat);
			request.setAttribute("noticeReplyCount", noticeReplyCount);
			request.setAttribute("maxNoticeNo", maxNoticeNo);
			request.setAttribute("minNoticeNo", minNoticeNo);
			
			request.getRequestDispatcher("views/notice/noticeDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "공지사항 조회에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
