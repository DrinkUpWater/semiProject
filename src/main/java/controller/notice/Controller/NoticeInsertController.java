package controller.notice.Controller;

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
import com.kh.common.NoticeAttachment;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

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
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("content"));

		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
//			System.out.println(request.getParameter("title"));
//			System.out.println(request.getParameter("content"));
			
			String savePath =  request.getSession().getServletContext().getRealPath("/resources/notice_sample_img/");
		
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		
			String noticeTitle = request.getParameter("title");
			String noticeContent = request.getParameter("content");
			
			HttpSession session = request.getSession();
	
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			Notice n = new Notice();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			n.setNoticeWriter(String.valueOf(userNo));  
			
			NoticeAttachment nat = new NoticeAttachment();
			String key = "file";
			if(multiRequest.getOriginalFileName(key) != null) {
				nat = new NoticeAttachment();
				nat.setOriginName(multiRequest.getOriginalFileName(key));
				nat.setChangeName(multiRequest.getFilesystemName(key));
				nat.setFilePath("/resources/notice_sample_img/");
				System.out.println(nat);
			}
			
			int result = new NoticeService().insertNotice(n, nat);
			
			if(result == 0) {
				request.setAttribute("errorMsg", "공지사항에 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp");
			} else {
				if(nat != null) {
					new File(savePath + nat.getChangeName()).delete();
				}
				
				session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.no?cpage=1");
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
