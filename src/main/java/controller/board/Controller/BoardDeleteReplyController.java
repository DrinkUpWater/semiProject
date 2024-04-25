package controller.board.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.board.service.BoardService;

/**
 * Servlet implementation class BoardDeleteReplyController
 */
@WebServlet("/drlist.bo")
public class BoardDeleteReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replyNo = Integer.parseInt(request.getParameter("num"));
		int refBno = Integer.parseInt(request.getParameter("refNum"));
		
		int result = new BoardService().deleteReply(replyNo);
		
		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "댓글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?num=" + refBno);
		} else { 
			request.setAttribute("errorMsg", "댓글 삭제 실패");
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
