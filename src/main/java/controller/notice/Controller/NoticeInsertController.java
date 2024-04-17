package controller.notice.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.notice.model.vo.Notice;
import controller.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
//		String img = request.getParameter("file");
		System.out.println(noticeTitle);
		System.out.println(noticeContent);
		
		
		HttpSession session = request.getSession();
		
		// Member 객체와 로그인 페이지를 만들어야 가져올 수 있음
//		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
//		n.setImg(img);
//		n.setNoticeWriter(String.valueOf(userNo));  로그인 페이지랑 합치면 세션에 있는 로그인유저 번호 가져와 이름 뜨게하기
		
		
		int result = new NoticeService().insertNotice(n);
		
		if(result == 0) {
			request.setAttribute("errorMsg", "공지사항에 등록에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		} else {
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.no");
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
