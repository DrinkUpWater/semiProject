package controller.board.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.BoardAttachment;

import controller.board.model.vo.Board;
import controller.board.service.BoardService;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("num"));
		
		int maxBoardNo = new BoardService().maxBoardNo();
		
		int minBoardNo = new BoardService().minBoardNo();
				
		String next = request.getParameter("next");
		String pre = request.getParameter("pre");
		
		if(next != null) {
			String statusCheck = new BoardService().statusCheck(boardNo);
			while(statusCheck.equals("N")) {
				if(statusCheck.equals("Y")){
					break;
				}
				boardNo +=  1;
				statusCheck = new BoardService().statusCheck(boardNo);
			} 
		} 
		
		if(pre != null) {
			String statusCheck = new BoardService().statusCheck(boardNo);
			while(statusCheck.equals("N")) {
				if(statusCheck.equals("Y")){
					break;
				}
				boardNo -=  1;
				statusCheck = new BoardService().statusCheck(boardNo);
			} 
		}
		
		Board b = new BoardService().increaseCount(boardNo);
		int boardReplyCount = new BoardService().selectBoardReplyCount(boardNo);
		
		if(b != null) {
			BoardAttachment bat = new BoardService().selectBoardAttachment(boardNo);
			
			request.setAttribute("board", b);
			request.setAttribute("boardAttachment", bat);
			request.setAttribute("boardReplyCount", boardReplyCount);
			request.setAttribute("maxBoardNo", maxBoardNo);
			request.setAttribute("minBoardNo", minBoardNo);
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "게시판 조회에 실패하였습니다.");
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
