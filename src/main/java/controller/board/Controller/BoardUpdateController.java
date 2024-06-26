package controller.board.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.BoardAttachment;
import com.oreilly.servlet.MultipartRequest;

import controller.board.model.vo.Board;
import controller.board.service.BoardService;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//1)용량제한크기설정
			int maxSize = 10 * 1024 * 1024;
			
			//2) 물리적 저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_sample_img/");

			//3) 전달된 파일명 수정작업 후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());

			//4. sql문 실행에 필요한 값 추출해서 vo에 저장
			int boardNo = Integer.parseInt(multiRequest.getParameter("num"));
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);

			
			BoardAttachment bat = null; //일단 null로 만들고 넘어온 파일이 있다면 그때 생성
			if(multiRequest.getOriginalFileName("file") != null) {
				//새로 넘어온 첨부파일이 있을 때
				bat = new BoardAttachment();
				bat.setOriginName(multiRequest.getOriginalFileName("file"));
				bat.setChangeName(multiRequest.getFilesystemName("file"));
				bat.setFilePath("resources/board_sample_img/");
				
				//기존 첨부파일이 있을 때 => update NoticeAttachment(기존첨부파일번호)
				if(multiRequest.getParameter("originFileNo") != null) {
					bat.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				} else {//첨부파일이 없을 떄 => insert
					bat.setRefBoardNo(boardNo);
				}
			} //새로운 첨부파일이 없다면 nat = null
			
			int result = new BoardService().updateBoard(b, bat);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글이 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.bo?num=" + b.getBoardNo());
			} else {
				request.setAttribute("errorMsg", "게시글 수정에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
