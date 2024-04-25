package controller.board.Controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.BoardAttachment;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

import controller.board.model.vo.Board;
import controller.board.service.BoardService;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;

			
			String savePath =  request.getSession().getServletContext().getRealPath("/resources/board_sample_img/");
		
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
					
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			HttpSession session = request.getSession();
	
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			Board b = new Board();
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(String.valueOf(userNo));  
			
			BoardAttachment bat = new BoardAttachment();
			String key = "file";
			if(multiRequest.getOriginalFileName(key) != null) {
				bat = new BoardAttachment();
				bat.setOriginName(multiRequest.getOriginalFileName(key));
				bat.setChangeName(multiRequest.getFilesystemName(key));
				bat.setFilePath("resources/board_sample_img/");
			}
			
			int result = new BoardService().insertBoard(b, bat);
			if(result == 0) {
				if(bat != null) {
					new File(savePath + bat.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "게시글 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp");
			} else {
				session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
			}
		
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
